-- ===========================================================================
-- Crazy Expansion - Gameplay
--
-- 城市扩张惩罚等级计算与刷新
--
-- 规则说明：
--   1. 人口决定基础惩罚。
--   2. 市政厅等级降低惩罚。
--   3. 没有市政厅的“野城”视为拥有最低级市政厅。
--   4. 全国存在祠堂时，所有城市额外降低 1 点惩罚。
-- ===========================================================================


-- ===========================================================================
-- 配置区
-- ===========================================================================

-- 请保留原属性名，以免影响已有 XML、Modifier 或其他 Lua。
local PROPERTY_CITY_LEVEL = "PROP_CITY_LEVEL"


-- ---------------------------------------------------------------------------
-- 人口 → 基础惩罚
--
-- 当前所有人口段的基础惩罚均为 4。
-- 保留分段配置，方便以后调整。
-- ---------------------------------------------------------------------------

local POP_RULES = {
    { MinPopulation = 0,  MaxPopulation = 9,         BaseDebuff = 4 },
    { MinPopulation = 10, MaxPopulation = 19,        BaseDebuff = 4 },
    { MinPopulation = 20, MaxPopulation = 29,        BaseDebuff = 4 },
    { MinPopulation = 30, MaxPopulation = 39,        BaseDebuff = 4 },
    { MinPopulation = 40, MaxPopulation = math.huge, BaseDebuff = 4 }
}


-- ---------------------------------------------------------------------------
-- 市政厅建筑配置
--
-- 按等级从高到低排列。
-- 检测到最高等级后即可直接返回，不必继续遍历。
-- ---------------------------------------------------------------------------

local CITY_HALL_TYPES = {
    { BuildingType = "BUILDING_CITYHALL_METROPOLIS", Level = 5 },
    { BuildingType = "BUILDING_CITYHALL_CITY",       Level = 4 },
    { BuildingType = "BUILDING_CITYHALL_COUNTY",     Level = 3 },
    { BuildingType = "BUILDING_CITYHALL_TOWN",       Level = 2 },
    { BuildingType = "BUILDING_CITYHALL_VILLAGE",    Level = 1 }
}

local GOV_WIDE_BUILDING_TYPE = "BUILDING_GOV_WIDE"


-- ===========================================================================
-- 建筑数据缓存
-- ===========================================================================

-- 缓存有效的市政厅建筑 Index，避免运行时反复查询 GameInfo。
local CITY_HALL_BUILDINGS = {}

for _, data in ipairs(CITY_HALL_TYPES) do
    local buildingInfo = GameInfo.Buildings[data.BuildingType]

    if buildingInfo then
        CITY_HALL_BUILDINGS[#CITY_HALL_BUILDINGS + 1] = {
            Index = buildingInfo.Index,
            Level = data.Level
        }
    else
        print("[CrazyExpansion] Warning: No City Hall Type: ".. tostring(data.BuildingType))
    end
end


-- 缓存全国祠堂的建筑 Index。
local GOV_WIDE_BUILDING_INDEX = nil

do
    local buildingInfo = GameInfo.Buildings[GOV_WIDE_BUILDING_TYPE]

    if buildingInfo then
        GOV_WIDE_BUILDING_INDEX = buildingInfo.Index
    else
        print("[CrazyExpansion] Warning: No Gov Wide Hall Type: ".. tostring(GOV_WIDE_BUILDING_TYPE))
    end
end


-- ===========================================================================
-- 工具函数
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- 获取城市实际拥有的市政厅等级
-- ---------------------------------------------------------------------------

local function GetActualCityHallLevel(pCity)
    if not pCity then
        return 0
    end

    local pBuildings = pCity:GetBuildings()

    if not pBuildings then
        return 0
    end

    -- CITY_HALL_BUILDINGS 已按等级从高到低排列。
    for _, data in ipairs(CITY_HALL_BUILDINGS) do
        if pBuildings:HasBuilding(data.Index) then
            return data.Level
        end
    end

    return 0
end


-- ---------------------------------------------------------------------------
-- 获取用于计算的市政厅等级
--
-- 没有市政厅的“野城”视为拥有最低级市政厅，因此：
--
--   实际等级 0 → 计算等级 1
--   实际等级 1 → 计算等级 1
--   实际等级 2~5 → 计算等级 2~5
-- ---------------------------------------------------------------------------

local function GetEffectiveCityHallLevel(pCity)
    local actualLevel = GetActualCityHallLevel(pCity)

    return math.max(1, actualLevel)
end


-- ---------------------------------------------------------------------------
-- 根据人口取得基础惩罚
-- ---------------------------------------------------------------------------

local function GetPopulationBaseDebuff(iPopulation)
    iPopulation = tonumber(iPopulation) or 0
    iPopulation = math.max(0, iPopulation)

    for _, rule in ipairs(POP_RULES) do
        if iPopulation >= rule.MinPopulation
            and iPopulation <= rule.MaxPopulation then

            return rule.BaseDebuff
        end
    end

    return 0
end

-- ---------------------------------------------------------------------------
-- 计算人口与市政厅带来的惩罚
--
-- 计算规则：
--   最低级市政厅不提供减免；
--   之后每提高一级，减少 1 点惩罚。
--
--   计算等级 1 → 减免 0
--   计算等级 2 → 减免 1
--   计算等级 3 → 减免 2
--   计算等级 4 → 减免 3
--   计算等级 5 → 减免 4
--
-- 没有市政厅时，计算等级会被视为 1，因此不会额外增加惩罚。
-- ---------------------------------------------------------------------------

local function CalculateBaseDebuff(iPopulation, iCityHallLevel)
    local iBaseDebuff = GetPopulationBaseDebuff(iPopulation)

    iCityHallLevel = tonumber(iCityHallLevel) or 1
    iCityHallLevel = math.max(1, iCityHallLevel)

    local iReduction = iCityHallLevel - 1

    return math.max(0, iBaseDebuff - iReduction)
end


-- ---------------------------------------------------------------------------
-- 检查玩家全国是否拥有祠堂
-- ---------------------------------------------------------------------------

local function HasGovWideBuilding(iPlayerID)
    if GOV_WIDE_BUILDING_INDEX == nil then
        return false
    end

    local pPlayer = Players[iPlayerID]

    if not pPlayer then
        return false
    end

    local pCities = pPlayer:GetCities()

    if not pCities then
        return false
    end

    for _, pCity in pCities:Members() do
        local pBuildings = pCity:GetBuildings()

        if pBuildings
            and pBuildings:HasBuilding(GOV_WIDE_BUILDING_INDEX) then

            return true
        end
    end

    return false
end


-- ---------------------------------------------------------------------------
-- 计算单座城市的最终惩罚等级
--
-- bHasGovWideBuilding 由调用方预先计算。
-- 刷新全国城市时，只需检查一次祠堂，避免重复遍历全国城市。
-- ---------------------------------------------------------------------------

local function CalculateCityLevel(pCity, bHasGovWideBuilding)
    if not pCity then
        return 0
    end

    local iPopulation = pCity:GetPopulation()
    local iCityHallLevel = GetEffectiveCityHallLevel(pCity)

    local iDebuff = CalculateBaseDebuff(iPopulation, iCityHallLevel)

    -- 全国拥有祠堂时，额外降低 1 点惩罚。
    if bHasGovWideBuilding and iDebuff > 0 then
        iDebuff = iDebuff - 1
    end

    return math.max(0, iDebuff)
end


-- ---------------------------------------------------------------------------
-- 将惩罚等级写入城市中心地块
--
-- 仅在数值发生变化时写入，避免每回合重复设置相同属性。
-- ---------------------------------------------------------------------------

local function SetCityLevelProperty(pCity, iLevel)
    if not pCity then
        return false
    end

    local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())

    if not pPlot then
        return false
    end

    local iOldLevel = pPlot:GetProperty(PROPERTY_CITY_LEVEL)

    if iOldLevel ~= iLevel then
        pPlot:SetProperty(PROPERTY_CITY_LEVEL, iLevel)
        return true
    end

    return false
end


-- ===========================================================================
-- 对外接口
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- 获取单座城市当前的扩张惩罚等级
-- ---------------------------------------------------------------------------
function GetCrazyExpansionLevel(pCity)
    if not pCity then
        return 0
    end

    local iPlayerID = pCity:GetOwner()
    local pPlayer = Players[iPlayerID]

    if not pPlayer then
        return 0
    end

    local bHasGovWideBuilding = HasGovWideBuilding(iPlayerID)
    return CalculateCityLevel(pCity, bHasGovWideBuilding)
end


-- ===========================================================================
-- 刷新逻辑
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- 刷新玩家的全部城市
-- ---------------------------------------------------------------------------

local function RefreshAllCityLevel(iPlayerID)
    local pPlayer = Players[iPlayerID]

    if not pPlayer or not pPlayer:IsMajor() then
        return
    end

    local pCities = pPlayer:GetCities()

    if not pCities then
        return
    end

    -- 全国建筑只检查一次。
    local bHasGovWideBuilding = HasGovWideBuilding(iPlayerID)

    for _, pCity in pCities:Members() do
        local iLevel = CalculateCityLevel(pCity, bHasGovWideBuilding)
        SetCityLevelProperty(pCity, iLevel)
    end
end


-- ---------------------------------------------------------------------------
-- 刷新单座城市
-- ---------------------------------------------------------------------------

local function RefreshCityLevel(iPlayerID, iCityID)
    local pPlayer = Players[iPlayerID]

    if not pPlayer or not pPlayer:IsMajor() then
        return
    end

    local pCity = CityManager.GetCity(iPlayerID, iCityID)

    if not pCity then
        return
    end

    local bHasGovWideBuilding = HasGovWideBuilding(iPlayerID)

    local iLevel = CalculateCityLevel(pCity, bHasGovWideBuilding)

    SetCityLevelProperty(pCity, iLevel)
end


-- ===========================================================================
-- 事件注册
-- ===========================================================================

-- 玩家回合开始时刷新该玩家的全部城市。
Events.PlayerTurnActivated.Add(RefreshAllCityLevel)

-- 新城市加入地图时刷新该城市。
Events.CityAddedToMap.Add(RefreshCityLevel)
