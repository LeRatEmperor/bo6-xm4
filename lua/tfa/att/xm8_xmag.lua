

if not ATTACHMENT then
	ATTACHMENT = {}
end
ATTACHMENT.TFADataVersion = 1 -- If it is undefined, it fallbacks to 0 and WeaponTable gets migrated like SWEPs do

ATTACHMENT.Data ={
	["Name"] = "45 Round Mags",
	["ShortName"] = "MAG",
	["Model"] = {
		["ModelPath"] = "models/dqr/bo7/scotia/scotia_m_l.mdl",
		["PartClass"] = "mag",
	},
	["Icon"] = "bo7/scotia/icon/me1",

}


ATTACHMENT.Description = {
		TFA.AttachmentColors["+"], "45 Round Magazine",
		TFA.AttachmentColors["+"], "+5% Static Recoil Factor",
		TFA.AttachmentColors["-"], "+5% Iron Sight Accuracy Penalty",
		TFA.AttachmentColors["-"], "+5% Iron Sight Time",
		TFA.AttachmentColors["-"], "-5% Move Speed",

}
-- ATTACHMENT.Description = {
-- 	TFA.AttachmentColors["+"], "+1% ADS Speed",
-- 	TFA.AttachmentColors["+"], "+1% Move Speed",
-- 	TFA.AttachmentColors["+"], "+10% Fire Rate",
-- 	TFA.AttachmentColors["-"], "+20% Recoil",
-- 	TFA.AttachmentColors["-"], "+25% Recoil Rise",
-- 	TFA.AttachmentColors["-"], "+5% Recoil Shake",



	

-- 	Color(255, 255, 255), "bottom text",
-- } -- all colors are defined in lua/tfa/modules/tfa_attachments.lua

ATTACHMENT.WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
["xmag1"] = true ,
["Animations"] = {
	["reload"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "reload_ext01"
	},
	["reload_empty"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "reload_empty_ext01"
	},
	["inspect_empty"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "inspect_empty_ext01"
	},
},
["Primary"] = {
	-- ["KickUp"] = function(wep, stat) return stat * 1.20 end,
	-- ["KickDown"] = function(wep, stat) return stat * 1.25 end,
	-- ["KickHorizontal"] = function(wep, stat) return stat * 1.20 end,
	-- ["RPM"] = function(wep, stat) return stat * 1.10 end,
	["StaticRecoilFactor"] = function(wep, stat) return stat * 1.05 end,
	-- ["Spread"] = function(wep, stat) return stat * 1.05 end,
	["IronAccuracy"] = function(wep, stat) return stat * 1.05 end,
	-- ["SpreadMultiplierMax"] = function(wep, stat) return stat * 1.05 end,
	-- ["SpreadIncrement"] = function(wep, stat) return stat * 1.05 end,
	-- ["SpreadRecovery"] = function(wep, stat) return stat * 1.05 end,
	["ClipSize"] = function(wep, stat) return 45 end,
},
 ["IronSightTime"] = function(wep, stat) return stat * 1.05 end,
 ["MoveSpeed"] = function(wep, stat) return stat * 0.95 end,
--  ["IronRecoilMultiplier"] = function(wep, stat) return stat * 1.01 end,
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

function ReloadWep(wep)
	local chambered = math.max(wep:Clip1() - wep:GetMaxClip1(), 0)

	timer.Simple(0.1, function()
		if IsValid(wep) then
			wep:SetClip1(wep:GetMaxClip1())
		end
		if wep:Clip1() > wep:GetMaxClip1() then
			wep:Unload()

			local amounttoreplace = math.min(wep:GetPrimaryClipSizeForReload(true) - wep:Clip1(), wep:Ammo1()) + chambered
			wep:TakePrimaryAmmo(amounttoreplace * -1)
			wep:TakePrimaryAmmo(amounttoreplace, true)
		end
	end)
end
--重装弹药
function ATTACHMENT:Attach(wep)
	
	local partClass = self.Data.Model.PartClass
	local newModel = self.Data.Model.ModelPath
	self:SwapWeaponModel(wep, partClass, newModel)
	ReloadWep(wep)
end

function ATTACHMENT:Detach(wep)
	local partClass = self.Data.Model.PartClass
	self:RestoreWeaponModel(wep, partClass)
	ReloadWep(wep)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end