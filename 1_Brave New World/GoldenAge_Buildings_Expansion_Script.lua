-- GoldenAge_Buildings_Expansion_Script
-- Author: Flactine
-- DateCreated: 1/31/2024 9:59:17 PM
--------------------------------------------------------------
-- ===========================================================================
-- 消防局自动修复系统
--
-- 功能：
--   1. 拥有消防局效果的城市，可以自动修复被掠夺的区域和建筑。
--   2. 核辐射污染地块上的区域或建筑不能被修复。
--   3. 被敌军或蛮族单位占据的地块不能被修复。
--   4. 玩家城市每回合均可触发自动修复。
--   5. AI 城市实际完成修复后，进入 10 个完整回合的冷却。
--
-- 消防局效果由城市属性控制：
--   PROP_GA_FIREST_AUTOREPAIR_BUILDING = 1
-- ===========================================================================


-- ===========================================================================
-- 配置
-- ===========================================================================

local FIRE_STATION_PROPERTY = "PROP_GA_FIREST_AUTOREPAIR_BUILDING"

-- 此属性保存在城市上，因此每座 AI 城市拥有独立冷却时间。
local AI_COOLDOWN_PROPERTY = "PROP_AI_FIRESTATION_CD"

local AI_COOLDOWN_TURNS = 10

-- 是否输出调试信息。
local DEBUG_MODE = false


-- ===========================================================================
-- 数据缓存
-- ===========================================================================

-- 建筑表在 Gameplay 运行期间不会发生变化。
-- 启动时缓存所有建筑 Index，避免每座城市每回合重新遍历 GameInfo。
local BUILDING_INDEXES = {}

for row in GameInfo.Buildings() do
    BUILDING_INDEXES[#BUILDING_INDEXES + 1] = row.Index
end


-- 核辐射管理器在游戏过程中可以重复使用。
local FALLOUT_MANAGER = Game.GetFalloutManager()


-- ===========================================================================
-- 调试输出
-- ===========================================================================

local function DebugPrint(message)
    if DEBUG_MODE then
        print("[FireStation] " .. tostring(message))
    end
end


-- ===========================================================================
-- 基础检查函数
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- 判断城市是否拥有消防局自动修复效果
--
-- 同时兼容以下属性值：
--   1
--   true
-- ---------------------------------------------------------------------------

local function CityHasFireStationEffect(pCity)
    if not pCity then
        return false
    end

    local value = pCity:GetProperty(FIRE_STATION_PROPERTY)

    return value == 1 or value == true
end


-- ---------------------------------------------------------------------------
-- 判断指定单位是否是该玩家的敌人
--
-- 以下单位视为敌人：
--   1. 蛮族及自由城市单位；
--   2. 与城市所属玩家处于战争状态的单位。
--
-- 和平状态下的外国单位不会阻止修复。
-- ---------------------------------------------------------------------------

local function IsHostileUnit(pPlayer, pUnit)
    if not pPlayer or not pUnit then
        return false
    end

    local iPlayerID = pPlayer:GetID()
    local iUnitOwnerID = pUnit:GetOwner()

    -- 自己的单位不会阻止修复。
    if iUnitOwnerID == iPlayerID then
        return false
    end

    local pUnitOwner = Players[iUnitOwnerID]

    -- 无法取得单位所属玩家时，为避免错误修复，按敌对单位处理。
    if not pUnitOwner then
        return true
    end

    if pUnitOwner:IsBarbarian() or (iUnitOwnerID == 62) then
        return true
    end

    local pDiplomacy = pPlayer:GetDiplomacy()

    if pDiplomacy
        and pDiplomacy:IsAtWarWith(iUnitOwnerID) then

        return true
    end

    return false
end


-- ---------------------------------------------------------------------------
-- 判断地块是否被敌对单位占据
-- ---------------------------------------------------------------------------

local function HasHostileUnitOnPlot(pPlayer, pPlot)
    if not pPlayer or not pPlot then
        return false
    end

    local units = Units.GetUnitsInPlot(pPlot)

    if not units then
        return false
    end

    for _, pUnit in ipairs(units) do
        if IsHostileUnit(pPlayer, pUnit) then
            return true
        end
    end

    return false
end


-- ---------------------------------------------------------------------------
-- 判断指定地块是否允许自动修复
--
-- 不能修复的情况：
--   1. 地块无效；
--   2. 地块存在核辐射污染；
--   3. 地块被敌军，蛮族单位或自由城市单位占据。
-- ---------------------------------------------------------------------------

local function CanRepairAtPlot(pPlayer, iPlotIndex)
	print("[FireStation] Checking Plot: " .. tostring(iPlotIndex))
    if not pPlayer then
        return false
    end

    if iPlotIndex == nil or iPlotIndex < 0 then
        return false
    end

    local pPlot = Map.GetPlotByIndex(iPlotIndex)

    if not pPlot then
        return false
    end

    -- 检查核辐射污染。
    if FALLOUT_MANAGER
        and FALLOUT_MANAGER:HasFallout(iPlotIndex) then
        return false
    end
	print("[FireStation] No Fallout on Plot: " .. tostring(iPlotIndex))

    -- 检查敌对单位。
    if HasHostileUnitOnPlot(pPlayer, pPlot) then
        return false
    end
	print("[FireStation] No Enemy on Plot: " .. tostring(iPlotIndex))

    return true
end


-- ===========================================================================
-- 区域修复
-- ===========================================================================

local function RepairPillagedDistricts(pPlayer, pCity)
    if not pPlayer or not pCity then
        return 0
    end
    local pDistricts = pCity:GetDistricts()

    if not pDistricts then
        return 0
    end

    local iRepairCount = 0
    local iDistrictsNum = pDistricts:GetNumDistricts()

    for iDistrictIndex = 0, iDistrictsNum - 1 do
        local pDistrict = pDistricts:GetDistrictByIndex(iDistrictIndex)
        if pDistrict and pDistrict:IsPillaged() then
            print("[FireStation] District iX, iY is: " .. tostring(pDistrict:GetX()) .. " and " .. tostring(pDistrict:GetY()))
            if pDistrict:GetX() ~= nil and pDistrict:GetY() ~= nil then
                local iPlotIndex = Map.GetPlotIndex(pDistrict:GetX(), pDistrict:GetY())
                if CanRepairAtPlot(pPlayer, iPlotIndex) then
                    pDistrict:SetPillaged(false)
                    iRepairCount = iRepairCount + 1

                    DebugPrint(
                        "Repair District: Player "
                        .. tostring(pPlayer:GetID())
                        .. ", City "
                        .. tostring(Locale.Lookup(pCity:GetName()))
                        .. ", Plot "
                        .. tostring(iPlotIndex)
                    )
                else
                    DebugPrint(
                        "Unable to Repair District: Player "
                        .. tostring(pPlayer:GetID())
                        .. ", City "
                        .. tostring(Locale.Lookup(pCity:GetName()))
                    )
                end
            end
        end
    end

    return iRepairCount
end


-- ===========================================================================
-- 建筑修复
-- ===========================================================================

local function RepairPillagedBuildings(pPlayer, pCity)
    if not pPlayer or not pCity then
        return 0
    end

    local pBuildings = pCity:GetBuildings()

    if not pBuildings then
        return 0
    end

    local iRepairCount = 0

    for _, iBuildingIndex in ipairs(BUILDING_INDEXES) do
        if pBuildings:HasBuilding(iBuildingIndex)
            and pBuildings:IsPillaged(iBuildingIndex) then

            local iPlotIndex =
                pBuildings:GetBuildingLocation(iBuildingIndex)

            if CanRepairAtPlot(pPlayer, iPlotIndex) then
                pBuildings:SetPillaged(iBuildingIndex, false)
                iRepairCount = iRepairCount + 1

                DebugPrint(
                    "Repair Building: Player "
                    .. tostring(pPlayer:GetID())
                    .. ", City "
                    .. tostring(Locale.Lookup(pCity:GetName()))
                    .. ", Building Index "
                    .. tostring(iBuildingIndex)
                )
            else
                DebugPrint(
                    "Unable to Repair Building: Player "
                    .. tostring(pPlayer:GetID())
                    .. ", City "
                    .. tostring(Locale.Lookup(pCity:GetName()))
                    .. ", Building Index "
                    .. tostring(iBuildingIndex)
                )
            end
        end
    end

    return iRepairCount
end


-- ===========================================================================
-- 单座城市修复
-- ===========================================================================

-- 返回本次实际完成的修复数量。
local function FireStationRepairCity(pPlayer, pCity)
    if not pPlayer or not pCity then
        return 0
    end

    if not CityHasFireStationEffect(pCity) then
        return 0
    end

    local iRepairCount = 0

    iRepairCount = iRepairCount
        + RepairPillagedDistricts(pPlayer, pCity)

    iRepairCount = iRepairCount
        + RepairPillagedBuildings(pPlayer, pCity)

    if iRepairCount > 0 then
        print(
            "[FireStation] Player "
            .. tostring(pPlayer:GetID())
            .. "'s City "
            .. tostring(Locale.Lookup(pCity:GetName()))
            .. " Auto Repaired "
            .. tostring(iRepairCount)
            .. " Districts/Buildings."
        )
    end

    return iRepairCount
end


-- ===========================================================================
-- AI 城市冷却
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- 处理 AI 城市
--
-- 冷却规则：
--
--   修复回合：
--     实际完成修复后，将冷却设置为 10。
--
--   接下来十个回合：
--     10 → 9 → 8 → ... → 1 → 0
--     期间不能再次自动修复。
--
--   第十个完整冷却回合结束后：
--     下一回合可以再次自动修复。
--
-- 只有实际修复了建筑或区域，才会开始冷却。
-- ---------------------------------------------------------------------------

local function ProcessAICity(pPlayer, pCity)
    if not pPlayer or not pCity then
        return
    end

    -- 没有消防局效果的城市不需要处理冷却。
    if not CityHasFireStationEffect(pCity) then
        return
    end

    local iCooldown =
        tonumber(pCity:GetProperty(AI_COOLDOWN_PROPERTY)) or 0

    iCooldown = math.max(0, iCooldown)

    if iCooldown > 0 then
        pCity:SetProperty(
            AI_COOLDOWN_PROPERTY,
            iCooldown - 1
        )

        DebugPrint(
            "AI City "
            .. tostring(Locale.Lookup(pCity:GetName()))
            .. " current cooldown: "
            .. tostring(iCooldown - 1)
        )

        return
    end

    local iRepairCount = FireStationRepairCity(
        pPlayer,
        pCity
    )

    -- 仅在实际完成修复后启动冷却。
    if iRepairCount > 0 then
        pCity:SetProperty(
            AI_COOLDOWN_PROPERTY,
            AI_COOLDOWN_TURNS
        )

        DebugPrint(
            "AI City "
            .. tostring(Locale.Lookup(pCity:GetName()))
            .. " in cooldown "
            .. tostring(AI_COOLDOWN_TURNS)
            .. " turn."
        )
    end
end


-- ===========================================================================
-- 回合处理
-- ===========================================================================

local function FireStationOnTurnBegin()
    local aliveMajorPlayers = PlayerManager.GetAliveMajors()

    if not aliveMajorPlayers then
        return
    end

    for _, pPlayer in ipairs(aliveMajorPlayers) do
        if pPlayer then
            local pCities = pPlayer:GetCities()

            if pCities then
                for _, pCity in pCities:Members() do
                    if pPlayer:IsHuman() then
                        -- 玩家城市每回合尝试修复。
                        FireStationRepairCity(
                            pPlayer,
                            pCity
                        )
                    else
                        -- AI 城市使用独立的十回合冷却。
                        ProcessAICity(
                            pPlayer,
                            pCity
                        )
                    end
                end
            end
        end
    end
end

-- ===========================================================================
-- 初始化
-- ===========================================================================

local function RepairBuildingsInitialize()
    Events.TurnBegin.Add(FireStationOnTurnBegin)
end

RepairBuildingsInitialize()
