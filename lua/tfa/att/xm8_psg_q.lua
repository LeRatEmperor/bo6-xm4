

if not ATTACHMENT then
	ATTACHMENT = {}
end
ATTACHMENT.Data ={
	["Name"] = "FAST",
	["ShortName"] = "PSGrip",
	["Model"] = {
		["ModelPath"] = "models/dqr/bo7/scotia/scotia_p_q.mdl",
		["PartClass"] = "pgrip",
	},
	["Icon"] = "bo7/scotia/icon/pq",

}

ATTACHMENT.Description = {
TFA.AttachmentColors["+"], "-30% Iron Sight Time",
Color(255, 255, 255), "Summary: Ultra-fast target",
Color(255, 255, 255), "acquisition and aiming.",
}
--[[
ATTACHMENT.Description = {
	TFA.AttachmentColors["-"], "+25% ADS Time",
    TFA.AttachmentColors["-"], "-15% Move Speed",
    TFA.AttachmentColors["+"], "-35% Vertical Recoil",
    TFA.AttachmentColors["+"], "-35% Downward Recoil", 
    TFA.AttachmentColors["+"], "-25% Horizontal Recoil",
    TFA.AttachmentColors["+"], "-25% Iron Sight Recoil",
    TFA.AttachmentColors["+"], "-15% Spread",

	

	-- Color(255, 255, 255), "bottom text",
} -- all colors are defined in lua/tfa/modules/tfa_attachments.lua
]]
ATTACHMENT.WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
["ViewModelBoneMods"] = {
	

} , 
["WorldModelBoneMods"] = {
	

} , 
["Primary"] = {
-- 	 ["KickUp"] = function(wep, stat) return stat * .85 end,
-- 	 ["KickDown"] = function(wep, stat) return stat * .85 end,
-- 	 ["KickHorizontal"] = function(wep, stat) return stat * .85 end,
-- 	["RPM"] = function(wep, stat) return stat * 1.10 end,
	-- ["StaticRecoilFactor"] = function(wep, stat) return stat * 0.9 end,
-- 	 ["Spread"] = function(wep, stat) return stat * .85 end,
-- 	["IronAccuracy"] = function(wep, stat) return stat * 1.05 end,
-- 	["SpreadMultiplierMax"] = function(wep, stat) return stat * 1.05 end,
-- 	["SpreadIncrement"] = function(wep, stat) return stat * 1.05 end,
-- 	["SpreadRecovery"] = function(wep, stat) return stat * 1.05 end,
 	-- ["Range"] = function(wep, stat) return stat * 0.85 end,
},
  ["IronSightTime"] = function(wep, stat) return stat * 0.70 end,
--   ["MoveSpeed"] = function(wep, stat) return stat * .95 end,
--   ["IronRecoilMultiplier"] = function(wep, stat) return stat * .95 end,
}

-- ATTACHMENT.DInv2_GridSizeX = nil -- DInventory/2 Specific. Determines attachment's width in grid.
-- ATTACHMENT.DInv2_GridSizeY = nil -- DInventory/2 Specific. Determines attachment's height in grid.
-- ATTACHMENT.DInv2_Volume = nil -- DInventory/2 Specific. Determines attachment's volume in liters.
-- ATTACHMENT.DInv2_Mass = nil -- DInventory/2 Specific. Determines attachment's mass in kilograms.
-- ATTACHMENT.DInv2_StackSize = nil -- DInventory/2 Specific. Determines attachment's maximal stack size.

--[[
-- Default behavior is always allow, override to change
function ATTACHMENT:CanAttach(wep)
	return true
end
]]--

--[[
-- These functions are called BEFORE stat cache is rebuilt
function ATTACHMENT:Attach(wep)
end

function ATTACHMENT:Detach(wep)
end
]]--

-- Attachment functions called from base
--[[
-- Called from render target code if SWEP.RTDrawEnabled is true
function ATTACHMENT:RTCode(wep, rt_texture, w, h)
end
]]--

--[[
-- Called from FireBullets for each bullet trace hit; arguments are passed from bullet callback
function ATTACHMENT:CustomBulletCallback(wep, attacker, trace, dmginfo)
end
]]--

--[[
-- Called before stencil sight reticle is drawn
function ATTACHMENT:PreDrawStencilSight(wep, vm, ply, sightVElementTable)
	-- 3D rendering context from PostDrawViewModel
	-- https://wiki.facepunch.com/gmod/3D_Rendering_Functions

	-- return true -- to prevent SWEP:PreDrawStencilSight from being called
	-- return false -- to stop reticle from drawing
end
]]--

--[[
-- Called right after stencil sight reticle is drawn
function ATTACHMENT:PostDrawStencilSight(wep, vm, ply, sightVElementTable)
	-- 3D rendering context from PostDrawViewModel
	-- https://wiki.facepunch.com/gmod/3D_Rendering_Functions

	-- return true -- to prevent SWEP:PostDrawStencilSight from being called
end
]]--
-- TFA Base Attachment Template by TFA Base Devs

-- To the extent possible under law, the person who associated CC0 with
-- TFA Base Template has waived all copyright and related or neighboring rights
-- to TFA Base Template.

-- You should have received a copy of the CC0 legalcode along with this
-- work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.


ATTACHMENT.TFADataVersion = 0 -- If it is undefined, it fallbacks to 0 and WeaponTable gets migrated like SWEPs do

-- ATTACHMENT.Base = "base" -- Attachment baseclass, defaults to "base" attachment

ATTACHMENT.Name = ATTACHMENT.Data.Name
ATTACHMENT.ShortName = ATTACHMENT.Data.ShortName
ATTACHMENT.Icon = ATTACHMENT.Data.Icon
--替换模型用的函数
function ATTACHMENT:SwapWeaponModel(wep, partClass, newModel)
	if not wep or not partClass or not newModel then return false end
	
	local success = false
	
	-- 视图模型
	if wep.VElements and wep.VElements[partClass] then
		-- 保存原模型
		if not wep.VElements[partClass]._original_model then
			wep.VElements[partClass]._original_model = wep.VElements[partClass].model
		end
		wep.VElements[partClass].model = newModel
		success = true
	end
	
	-- 世界模型
	if wep.WElements and wep.WElements[partClass] then
		-- 保存原模型
		if not wep.WElements[partClass]._original_model then
			wep.WElements[partClass]._original_model = wep.WElements[partClass].model
		end
		wep.WElements[partClass].model = newModel
		success = true
	end
	
	return success
end

function ATTACHMENT:RestoreWeaponModel(wep, partClass)
	if not wep or not partClass then return false end
	
	local success = false
	
	-- 恢复视图模型
	if wep.VElements and wep.VElements[partClass] and wep.VElements[partClass]._original_model then
		wep.VElements[partClass].model = wep.VElements[partClass]._original_model
		success = true
	end
	
	-- 恢复世界模型
	if wep.WElements and wep.WElements[partClass] and wep.WElements[partClass]._original_model then
		wep.WElements[partClass].model = wep.WElements[partClass]._original_model
		success = true
	end
	
	return success
end
--配件安装
function ATTACHMENT:Attach(wep)
	
	local partClass = self.Data.Model.PartClass
	local newModel = self.Data.Model.ModelPath
	self:SwapWeaponModel(wep, partClass, newModel)

end

function ATTACHMENT:Detach(wep)
	local partClass = self.Data.Model.PartClass
	self:RestoreWeaponModel(wep, partClass)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end