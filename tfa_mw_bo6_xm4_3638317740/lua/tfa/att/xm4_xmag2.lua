
-- TFA Base Attachment Template by TFA Base Devs

-- To the extent possible under law, the person who associated CC0 with
-- TFA Base Template has waived all copyright and related or neighboring rights
-- to TFA Base Template.

-- You should have received a copy of the CC0 legalcode along with this
-- work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.TFADataVersion = 0 -- If it is undefined, it fallbacks to 0 and WeaponTable gets migrated like SWEPs do

-- ATTACHMENT.Base = "base" -- Attachment baseclass, defaults to "base" attachment

ATTACHMENT.Name = "60 Round Mags"
ATTACHMENT.ShortName = "" -- Abbreviation shown on the bottom left of the icon, generated from name if not defined
ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "60 Clipsize",
	TFA.AttachmentColors["-"], "+25% Recoil",
	TFA.AttachmentColors["-"], "+25% ADS Time",

	
	-- Color(255, 255, 255), "bottom text",
} -- all colors are defined in lua/tfa/modules/tfa_attachments.lua
ATTACHMENT.Icon = "bo6/xm4/icon/m60" -- "entities/tfa_ammo_match.png" -- Full path to the icon, reverts to '?' by default

ATTACHMENT.WeaponTable = { -- The place where you change the stats (CACHED STATS ONLY!)
["XMag2Enable"] =true,

["Primary"]={
	["ClipSize"] = function(wep,stat) return 60 end,
	["KickUp"] = function( wep, stat ) return stat * 1.25 end,
	["KickDown"] = function( wep, stat ) return stat * 1.25 end,
	["KickHorizontal"] = function( wep, stat ) return stat * 1.25 end,
},
["IronSightTime"] = function( wep, stat ) return stat * 1.25 end,

["Animations"] = {
	["reload"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "reload_ext02"
	},
	["reload_empty"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "reload_empty_ext02"
	},
	["inspect"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "inspect_ext02"
	},
	["inspect_empty"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ,
		["value"] = "inspect_empty_ext02"
	},
}


}

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


function ATTACHMENT:Attach(wep)
	ReloadWep(wep)
	wep.VElements.mag.model = "models/dqr/bo6/xm4/xm4_mag_ext2.mdl"
	wep.WElements.mag.model = wep.VElements.mag.model

end

function ATTACHMENT:Detach(wep)
	ReloadWep(wep)
	wep.VElements.mag.model ="models/dqr/bo6/xm4/xm4_mag_30.mdl "
	wep.WElements.mag.model = wep.VElements.mag.model

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
