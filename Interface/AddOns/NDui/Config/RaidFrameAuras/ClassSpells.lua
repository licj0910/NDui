local _, ns = ...
local B, C, L, DB = unpack(ns)
local module = B:GetModule("AurasTable")

-- 角标的相关法术 [spellID] = {anchor, {r, g, b}, ALL}
C.CornerBuffs = {
	["PRIEST"] = {
		[17]     = {"TOPLEFT", {.7, .7, .7}},			-- 真言术盾
		[139]    = {"TOPRIGHT", {.4, .7, .2}},			-- 恢复
		[6346]   = {"BOTTOMRIGHT", {1, .8, 0}},			-- 防恐结界
		[6788]   = {"TOP", {.8, .1, .1}, true},			-- 虚弱灵魂
		[33206]  = {"LEFT", {.47, .35, .74}, true},		-- 痛苦压制
		[41635]  = {"RIGHT", {1, .7, .4}},				-- 愈合导言
	},
	["DRUID"] = {
		[467]    = {"LEFT", {.8, 1, .3}},				-- 荆棘术
		[774]    = {"TOPRIGHT", {.8, .4, .8}},			-- 回春
		[8936]   = {"RIGHT", {.2, .8, .2}},				-- 愈合
		[33763]  = {"TOPLEFT", {.2, .8, .6}},			-- 生命绽放
		[29166]  = {"TOP", {0, .4, 1}, true},			-- 激活
	},
	["PALADIN"] = {
		[1022]   = {"TOPRIGHT", {.2, .2, 1}, true},		-- 保护
		[1044]   = {"TOPRIGHT", {.89, .45, 0}, true},	-- 自由
		[6940]   = {"TOPRIGHT", {.89, .1, .1}, true},	-- 牺牲
		[19977]  = {"TOPLEFT", {1, .8, 0}},				-- 光明祝福
		[25890]  = {"TOPLEFT", {1, .8, 0}},				-- 强效光明祝福
		[19742]  = {"TOPLEFT", {0, .8, 1}},				-- 智慧祝福
		[25894]  = {"TOPLEFT", {0, .8, 1}},				-- 强效智慧祝福
		[19740]  = {"TOPLEFT", {.5, 1, .5}},			-- 力量祝福
		[25782]  = {"TOPLEFT", {.5, 1, .5}},			-- 强效力量祝福
		[25771]  = {"TOP", {.86, .11, .11}, true},		-- 自律
	},
	["WARLOCK"] = {
		[2970]   = {"TOPRIGHT", {0, .8, .5}},			-- 侦测隐形
		[6512]   = {"TOPRIGHT", {0, .8, .5}},			-- 侦测次级隐形
		[11743]  = {"TOPRIGHT", {0, .8, .5}},			-- 侦测强效隐形
		[20707]  = {"BOTTOMRIGHT", {.8, .4, .8}, true},	-- 灵魂石
	},
	["MAGE"] = {
		[130] 	 = {"TOP", {1, .6, .3}},				-- 缓落术
		[604]    = {"RIGHT", {0, .8, .5}},				-- 魔法抑制
		[1008]   = {"TOPRIGHT", {1, .8, 0}},			-- 魔法增效
		[1459]   = {"TOPLEFT", {0, .3, 1}},				-- 奥术智慧
		[23028]  = {"TOPLEFT", {0, .6, 1}},				-- 奥术光辉
	},
	["WARRIOR"] = {
		[6673]   = {"TOPRIGHT", {1, .5, .2}},			-- 战斗怒吼
	},
	["SHAMAN"] = {
		[974]    = {"RIGHT", {1, .8, 0}},				-- 大地之盾
		[16237]  = {"TOPRIGHT", {0, .6, 1}},			-- 先祖坚韧
		[29203]  = {"TOPLEFT", {0, 1, .4}},				-- 治疗之道
	},
	["HUNTER"] = {
		[13159]  = {"TOPRIGHT", {.9, .9, .9}},			-- 豹群
		[20043]  = {"TOPRIGHT", {.0, .9, .3}},			-- 野性守护
		[34477]  = {"BOTTOMRIGHT", {.9, .1, .1}},		-- 误导
	},
	["ROGUE"] = {
		[31224]  = {"TOPRIGHT", {.9, .3, .9}, true},	-- 斗篷
		[26669]  = {"RIGHT", {1, .8, 0}, true},			-- 闪避
	},
	["DEATHKNIGHT"] = {},
}

-- 角标黑名单
C.CornerBlackList = {
	[57669] = true, -- 吸血鬼之触和漫长寒冬触发的恢复
}

-- 团队框体减益指示器黑名单
C.RaidDebuffsBlack = {
	[23445] = true, -- 邪恶双子
	[28274] = true, -- 血蓟消散
	[36893] = true, -- 传送器故障
	[36895] = true, -- 传送器故障
	[36897] = true, -- 传送器故障
	[36899] = true, -- 传送器故障
	[36900] = true, -- 灵魂分裂：坏蛋
	[36901] = true, -- 灵魂分裂：好人
	[36940] = true, -- 传送器故障
}

-- 团队框体增益指示器白名单
C.RaidBuffsWhite = {
	[642] = true,		-- 圣盾术
	[871] = true,		-- 盾墙
	[1022] = true,		-- 保护祝福
	[27827] = true,		-- 救赎之魂
}