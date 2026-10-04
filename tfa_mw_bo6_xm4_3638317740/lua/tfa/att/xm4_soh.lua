
-- TFA Base Attachment Template by TFA Base Devs

-- To the extent possible under law, the person who associated CC0 with
-- TFA Base Template has waived all copyright and related or neighboring rights
-- to TFA Base Template.

-- You should have received a copy of the CC0 legalcode along with this
-- work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.TFADataVersion = 1 -- If it is undefined, it fallbacks to 0 and WeaponTable gets migrated like SWEPs do

-- ATTACHMENT.Base = "base" -- Attachment baseclass, defaults to "base" attachment

ATTACHMENT.Name = "Faster Reload"
ATTACHMENT.ShortName = "" -- Abbreviation shown on the bottom left of the icon, generated from name if not defined
ATTACHMENT.Description = {
	
	-- Color(255, 255, 255), "bottom text",
} -- all colors are defined in lua/tfa/modules/tfa_attachments.lua
ATTACHMENT.Icon = "entities/form_change.png" -- "entities/tfa_ammo_match.png" -- Full path to the icon, reverts to '?' by default

ATTACHMENT.WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)

["Animations"] = {
	["reload"] =   function(wep,val)
	val = table.Copy(val)
	val["type"] = TFA.Enum.ANIMATION_SEQ 
    if wep:GetStat("Mag1") then
		val["value"] = "reload_fast01"
	elseif wep:GetStat("Mag2") then
		val["value"] = "reload_fast03"
	else
		val["value"] = "reload_fast"
	end
	return val, true, true, true
    end,
	["reload_empty"] =   function(wep,val)
		val = table.Copy(val)
		val["type"] = TFA.Enum.ANIMATION_SEQ 
		val["type"] = TFA.Enum.ANIMATION_SEQ 
    if wep:GetStat("Mag1") then
		val["value"] = "reload_empty_fast01"
	elseif wep:GetStat("Mag2") then
		val["value"] = "reload_empty_fast03"
	else
		val["value"] = "reload_empty_fast"
	end
		return val, true, true, true
		end,
},


}
if not TFA_RELOAD1_MODULE then
    include("tfa/modules/att_reload_tactical_module.lua")
end

function ATTACHMENT:Attach(wep)
	
	
	-- 启用战术换弹模块功能
	if TFA_RELOAD1_MODULE and TFA_RELOAD1_MODULE.EnableTacticalReload then
		TFA_RELOAD1_MODULE.EnableTacticalReload(wep)
	end
	
	
	
	
end

function ATTACHMENT:Detach(wep)
	-- 禁用战术换弹模块功能
	if TFA_RELOAD1_MODULE and TFA_RELOAD1_MODULE.DisableTacticalReload then
		TFA_RELOAD1_MODULE.DisableTacticalReload(wep)
	end
	
	
	

end
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

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
