
-- TFA Base Attachment Template by TFA Base Devs

-- To the extent possible under law, the person who associated CC0 with
-- TFA Base Template has waived all copyright and related or neighboring rights
-- to TFA Base Template.

-- You should have received a copy of the CC0 legalcode along with this
-- work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

if not ATTACHMENT then
	ATTACHMENT = {}
end
function ATTACHMENT:Attach(wep)
	
	wep.VElements.pgrip.model = "models/dqr/bo6/xm4/xm4_psg_q1.mdl"
	wep.WElements.pgrip.model = wep.VElements.pgrip.model

end

function ATTACHMENT:Detach(wep)
	wep.VElements.pgrip.model ="models/dqr/bo6/xm4/xm4_psg_def.mdl "
	wep.WElements.pgrip.model = wep.VElements.pgrip.model

end

ATTACHMENT.TFADataVersion = 1 -- If it is undefined, it fallbacks to 0 and WeaponTable gets migrated like SWEPs do

-- ATTACHMENT.Base = "base" -- Attachment baseclass, defaults to "base" attachment

ATTACHMENT.Name ="Aim Grip"
ATTACHMENT.ShortName = "PGRIP" -- Abbreviation shown on the bottom left of the icon, generated from name if not defined
ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "+5% ADS Speed",
	TFA.AttachmentColors["+"], "+15% Move Speed",


	

	-- Color(255, 255, 255), "bottom text",
} -- all colors are defined in lua/tfa/modules/tfa_attachments.lua
ATTACHMENT.Icon = "bo6/xm4/icon/pq1" -- "entities/tfa_ammo_match.png" -- Full path to the icon, reverts to '?' by default

ATTACHMENT.WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)

-- ["ViewModelBoneMods"]={
-- 	["tag_flash"] = { scale = Vector(1, 1, 1), pos = Vector(-9, 0,0), angle = Angle(0, 0, 0) },
-- 	["tag_grip_attach"] = { scale = Vector(1, 1, 1), pos = Vector(6, 0, 0), angle = Angle(0, 0, 0) },
-- },
-- ["WorldModelBoneMods"]={
-- 	["tag_flash"] = {  scale = Vector(1, 1, 1), pos = Vector(0, 0, -4), angle = Angle(0, 0, 0) },
-- 	["tag_grip_attach"] = { scale = Vector(1, 1, 1), pos = Vector(6, 0, 0), angle = Angle(0, 0, 0) },
-- },


-- ["Primary"] = {
-- 	["Range"] = function(wep, stat) return stat * 0.85 end,
-- 	["KickUp"] = function(wep, stat) return stat * 1.20 end,
-- 	["KickDown"] = function(wep, stat) return stat * 1.20 end,
-- 	["KickHorizontal"] = function(wep, stat) return stat * 1.20 end,
-- 	["RPM"] = function(wep, stat) return stat * 1.10 end,
-- },
["IronSightTime"] = function(wep, stat) return stat * 0.95 end,
 ["MoveSpeed"] = function(wep, stat) return stat * 1.15 end,

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

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
