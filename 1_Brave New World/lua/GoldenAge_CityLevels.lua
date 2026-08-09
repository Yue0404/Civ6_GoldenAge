-- =====================================================
-- 配置区
-- =====================================================
local CITY_HALL_LEVELS = {
    BUILDING_CITYHALL_VILLAGE     = 1,
    BUILDING_CITYHALL_TOWN        = 2,
    BUILDING_CITYHALL_COUNTY      = 3,
    BUILDING_CITYHALL_CITY        = 4,
    BUILDING_CITYHALL_METROPOLIS  = 5
}

local GOV_WIDE_BUILDING = GameInfo.Buildings["BUILDING_GOV_WIDE"]

-- 人口 → 基础惩罚
local POP_RULES = {
    { min = 0,  max = 9,   base = 4 },
    { min = 10, max = 19,  base = 4 },
    { min = 20, max = 29,  base = 4 },
    { min = 30, max = 39,  base = 4 },
    { min = 40, max = math.huge, base = 4 }
}

-- =====================================================
-- 工具函数
-- =====================================================

-- 取得城市市政厅等级（0~5）
local function GetCityHallLevel(pCity)
    local pBuildingList = pCity:GetBuildings()
    local iLevel = 0

    for buildingType, iLv in pairs(CITY_HALL_LEVELS) do
        local pBuilding = GameInfo.Buildings[buildingType]
        if pBuilding and pBuildingList:HasBuilding(pBuilding.Index) then
            if iLv > iLevel then
                iLevel = iLv
            end
        end
    end

    return iLevel
end

-- 人口 + 市政厅 → 基础惩罚
local function CalcBaseDebuff(iPopulation, iCityHallLevel)
    local iBase = 0
	iCityHallLevel = iCityHallLevel or 0

    for _, rule in ipairs(POP_RULES) do
        if iPopulation >= rule.min and iPopulation <= rule.max then
            iBase = rule.base
            break
        end
    end

    return math.max(0, iBase - (iCityHallLevel - 1))
end

-- 全国是否有祠堂（全文明唯一）
local function HasGovWideBuilding(playerID)
    if not GOV_WIDE_BUILDING then
        return false
    end

    local pPlayer = Players[playerID]
    if not pPlayer then
        return false
    end

    for _, city in pPlayer:GetCities():Members() do
        if city:GetBuildings():HasBuilding(GOV_WIDE_BUILDING.Index) then
            return true
        end
    end

    return false
end

-- =====================================================
-- 对外接口（Gameplay 专用）
-- =====================================================

function GetCrazyExpansionLevel(pCity)
    if not pCity then
        return 0
    end

    local iPlayerID = pCity:GetOwner()
    local pPlayer = Players[iPlayerID]
    if not pPlayer then
        return 0
    end

    local iPopulation = pCity:GetPopulation()
    local iCityHallLevel = GetCityHallLevel(pCity)

    local iDebuff = CalcBaseDebuff(iPopulation, iCityHallLevel)

    -- 祠堂：全国 -1
    if iDebuff > 0 and HasGovWideBuilding(iPlayerID) then
        iDebuff = iDebuff - 1
    end

    return math.max(0, iDebuff)
end

-- =====================================================
-- 刷新逻辑
-- =====================================================

function RefreshAllCityLevel(iPlayerID)
    local pPlayer = Players[iPlayerID]
    if not pPlayer or not pPlayer:IsMajor() then
        return
    end

    for _, city in pPlayer:GetCities():Members() do
        local iLevel = GetCrazyExpansionLevel(city)
        local pPlot = Map.GetPlot(city:GetX(), city:GetY())
        pPlot:SetProperty("PROP_CITY_LEVEL", iLevel)
    end
end

Events.PlayerTurnActivated.Add(RefreshAllCityLevel)

function RefreshCityLevel(iPlayerID, iCityID)
    local pPlayer = Players[iPlayerID]
    if not pPlayer or not pPlayer:IsMajor() then
        return
    end

    local pCity = CityManager.GetCity(iPlayerID, iCityID)
    if not pCity then
        return
    end

    local iLevel = GetCrazyExpansionLevel(pCity)
    local pPlot = Map.GetPlot(pCity:GetX(), pCity:GetY())
    pPlot:SetProperty("PROP_CITY_LEVEL", iLevel)
end

Events.CityAddedToMap.Add(RefreshCityLevel)
