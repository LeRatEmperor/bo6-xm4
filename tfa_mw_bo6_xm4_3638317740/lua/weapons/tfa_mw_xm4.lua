

-- TFA Base Template by TFA Base Devs

-- To the extent possible under law, the person who associated CC0 with
-- TFA Base Template has waived all copyright and related or neighboring rights
-- to TFA Base Template.

-- You should have received a copy of the CC0 legalcode along with this
-- work.  If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.



-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --
-- !                                                               ! --
-- !   WARNING! This template is outdated, not supported anymore   ! --
-- !     and is only kept in for reference/comparison reasons.     ! --
-- !                                                               ! --
-- !                Please use the updated template                ! --
-- !      located at lua/weapons/tfa_base_template/shared.lua      ! --
-- !            for future weapon development purposes.            ! --
-- !                                                               ! --
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --



SWEP.Base               = "tfa_bash_base"
SWEP.Category               = "TFA Modern Warfare" -- The category.  Please, just choose something generic or something I've already done if you plan on only doing like one swep..
SWEP.Manufacturer = nil -- Gun Manufactrer (e.g. Hoeckler and Koch )
SWEP.Author             = "" -- Author Tooltip
SWEP.SubCategory                = "Assault"
SWEP.Contact                = "" -- Contact Info Tooltip
SWEP.Purpose                = "" -- Purpose Tooltip
SWEP.Instructions               = "" -- Instructions Tooltip
SWEP.Spawnable              = true -- Can you, as a normal user, spawn this?
SWEP.AdminSpawnable         = false -- Can an adminstrator spawn this?  Does not tie into your admin mod necessarily, unless its coded to allow for GMod's default ranks somewhere in its code.  Evolve and ULX should work, but try to use weapon restriction rather than these.
SWEP.DrawCrosshair          = true      -- Draw the crosshair?
SWEP.DrawCrosshairIS = false -- Draw the crosshair in ironsights?
SWEP.PrintName              =  "XM4"       -- Weapon name (Shown on HUD)
SWEP.Slot               = 2             -- Slot in the weapon selection menu.  //subtract 1, as this starts at 0.
SWEP.SlotPos                = 73            -- Position in the slot
SWEP.AutoSwitchTo           = false      -- Auto switch to if we pick it up
SWEP.AutoSwitchFrom         = false      -- Auto switch from if you pick up a better weapon
SWEP.Weight             = 100            -- This controls how "good" the weapon is for autopickup.

-- [[WEAPON HANDLING]] --
SWEP.Primary.Sound =  Sound("bo6_xm4_fire") -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound = Sound("bo6_xm4_fire_s") -- This is the sound of the weapon, when silenced.
SWEP.Primary.SoundEchoTable={
    [0] = Sound("bo6_xm4_fire_atom"),
	[256] = Sound("bo6_xm4_fire_atom")

}
SWEP.Primary.PenetrationMultiplier = 1 -- Change the amount of something this gun can penetrate through
-- the LESSER this value is, the BETTER is penetration
-- this is basically multiplier for next values
-- you don't need to uncomment these if you are not going to modify them!
--[[
SWEP.PenetrationMaterials = {
	[MAT_DEFAULT] = 1,
	[MAT_VENT] = 0.4, --Since most is aluminum and stuff
	[MAT_METAL] = 0.6, --Since most is aluminum and stuff
	[MAT_WOOD] = 0.2,
	[MAT_PLASTIC] = 0.23,
	[MAT_FLESH] = 0.48,
	[MAT_CONCRETE] = 0.87,
	[MAT_GLASS] = 0.16,
	[MAT_SAND] = 1,
	[MAT_SLOSH] = 1,
	[MAT_DIRT] = 0.95, --This is plaster, not dirt, in most cases.
	[MAT_FOLIAGE] = 0.9
}
]]

SWEP.Primary.Damage = 26 -- Damage, in standard damage points.
SWEP.Primary.DamageTypeHandled = true -- true will handle damagetype in base
SWEP.Primary.DamageType = DMG_BULLET -- See DMG enum.  This might be DMG_SHOCK, DMG_BURN, DMG_BULLET, etc.  Leave nil to autodetect.  DMG_AIRBOAT opens doors.
SWEP.Primary.Force = nil -- Force value, leave nil to autocalc
SWEP.Primary.Knockback = nil -- Autodetected if nil; this is the velocity kickback
SWEP.Primary.HullSize = 0 -- Big bullets, increase this value.  They increase the hull size of the hitscan bullet.
SWEP.Primary.NumShots =1 -- The number of shots the weapon fires.  SWEP.Shotgun is NOT required for this to be >1.
SWEP.Primary.Automatic = true -- Automatic/Semi Auto
SWEP.Primary.RPM = 700 -- This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Semi = nil -- RPM for semi-automatic or burst fire.  This is in Rounds Per Minute / RPM
SWEP.Primary.RPM_Burst = nil -- RPM for burst fire, overrides semi.  This is in Rounds Per Minute / RPM
SWEP.Primary.DryFireDelay = nil -- How long you have to wait after firing your last shot before a dryfire animation can play.  Leave nil for full empty attack length.  Can also use SWEP.StatusLength[ ACT_VM_BLABLA ]
SWEP.Primary.BurstDelay = nil -- Delay between bursts, leave nil to autocalculate

SWEP.Primary.LoopSound = nil -- Looped fire sound, unsilenced
SWEP.Primary.LoopSoundSilenced = nil -- Looped fire sound, silenced
SWEP.Primary.LoopSoundTail = nil -- Loop end/tail sound, unsilenced
SWEP.Primary.LoopSoundTailSilenced = nil -- Loop end/tail sound, silenced
SWEP.Primary.LoopSoundAutoOnly = false -- Play loop sound for full-auto only? Fallbacks to Primary.Sound for semi/burst if true

-- WORLD/THIRDPERSON/NPC FIRING SOUNDS! Fallbacks to first person sound if not defined.

SWEP.Primary.Sound_World = SWEP.Primary.Sound -- This is the sound of the weapon, when you shoot.
SWEP.Primary.SilencedSound_World =SWEP.Primary.SilencedSound -- This is the sound of the weapon, when silenced.

SWEP.Primary.LoopSound_World = nil -- Looped fire sound, unsilenced
SWEP.Primary.LoopSoundSilenced_World = nil -- Looped fire sound, silenced
SWEP.Primary.LoopSoundTail_World = nil -- Loop end/tail sound, unsilenced
SWEP.Primary.LoopSoundTailSilenced_World = nil -- Loop end/tail sound, silenced

SWEP.CanJam = true -- whenever weapon cam jam
SWEP.JamChance = 0.04 -- the (maximal) chance the weapon will jam. Newly spawned weapon will never jam on first shot for example.
-- Default value is 0.04 (4%)
-- Maxmial value is 1, means weapon will always jam when factor become 100
-- Also remember that there is a minimal factor before weapon can jam
-- This number is not treated "as-is" but as basic value that needs to be concluded as chance
-- You don't really need to cry over it and trying to balance it, TFA Base will do the job for you
-- (TFA Base will calculate the best value between 0 and JamChance based on current JamFactor of the weapon)
SWEP.JamFactor = 0.06 -- How to increase jam factor after each shot.
-- When factor reach 100 it will mean that on each shot there will be SWEP.Primary.JamChance chance to jam
-- When factor reach 50 it will mean that on each shot there will be SWEP.Primary.JamChance / 2 chance to jam
-- and so on
-- Default value is 0.06, means weapon will jam with SWEP.Primary.JamChance chance right after 1666 shots

-- These settings are good for Assault Rifles, however, not good for anything else.
-- Suggested stats:

--[[
-- Pistols
SWEP.JamChance = 0.20
SWEP.JamFactor = 0.14
]]

--[[
-- Revolvers
SWEP.JamChance = 0.17
SWEP.JamFactor = 0.50
]]

--[[
-- Miniguns
SWEP.JamChance = 0.03
SWEP.JamFactor = 0.01
]]

--[[
-- Submachine gun
SWEP.JamChance = 0.04
SWEP.JamFactor = 0.09
]]

--[[
-- Auto shotguns
SWEP.JamChance = 0.15
SWEP.JamFactor = 0.2
]]

--[[
-- Pump-action shotguns
SWEP.JamChance = 0.25
SWEP.JamFactor = 0.3
]]

--[[
-- Sniper rifle
SWEP.JamChance = 0.17
SWEP.JamFactor = 0.35
]]

SWEP.FiresUnderwater = false
-- Miscelaneous Sounds
SWEP.IronInSound = Sound("") -- Sound to play when ironsighting in?  nil for default
SWEP.IronOutSound = Sound("")-- Sound to play when ironsighting out?  nil for default
-- Silencing
SWEP.CanBeSilenced = false -- Can we silence?  Requires animations.
SWEP.Silenced = false -- Silenced by default?
-- Selective Fire Stuff
SWEP.SelectiveFire = true  -- Allow selecting your firemode?
SWEP.DisableBurstFire = false  -- Only auto/single?
SWEP.OnlyBurstFire = false   -- No auto, only burst/single?
SWEP.BurstFireCount = 3 -- Burst fire count override (autocalculated by the clip size if nil)
SWEP.DefaultFireMode = nil-- Default to auto or whatev
SWEP.FireModeName = nil -- Change to a text value to override it
SWEP.FireSoundAffectedByClipSize = true -- Whenever adjuct pitch (and proably other properties) of fire sound based on current clip / maxclip
-- This is always false when either:
-- Weapon has no primary clip
-- Weapon's clip is smaller than 4 rounds
-- Weapon is a shotgun
-- Ammo Related
SWEP.Primary.ClipSize = 30-- This is the size of a clip
SWEP.Primary.DefaultClip =SWEP.Primary.ClipSize*3 -- This is the number of bullets the gun gives you, counting a clip as defined directly above.
SWEP.Primary.Ammo = "ar2" -- What kind of ammo.  Options, besides custom, include pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, and AirboatGun.
SWEP.Primary.AmmoConsumption = 1 -- Ammo consumed per shot
-- Pistol, buckshot, and slam like to ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.DisableChambering = false  -- Disable round-in-the-chamber
-- Misc
SWEP.IronRecoilMultiplier =0.65 -- Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 0.75 -- Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate

-- Recoil Related
SWEP.Primary.KickUp =0.28 -- This is the maximum upwards recoil (rise)
SWEP.Primary.KickDown =0.05 -- This is the maximum downwards recoil (skeet)
SWEP.Primary.KickHorizontal = 0.12 -- This is the maximum sideways recoil (no real term)
SWEP.Primary.StaticRecoilFactor = 0.3 -- Amount of recoil to directly apply to EyeAngles.  Enter what fraction or percentage (in decimal form) you want.  This is also affected by a convar that defaults to 0.5.

SWEP.ViewModelPunch_MaxVertialOffset             =2 -- Default value is 3
SWEP.ViewModelPunch_MaxVertialOffset_IronSights  =2 -- Default value is 1.95
SWEP.ViewModelPunch_VertialMultiplier            = 1 -- Default value is 1
SWEP.ViewModelPunch_VertialMultiplier_IronSights = 1 -- Default value is 0.25

SWEP.ViewModelPunchPitchMultiplier               = (SWEP.Primary.KickUp+SWEP.Primary.KickDown ) * (1-SWEP.Primary.StaticRecoilFactor) -- Default value is 0.5
SWEP.ViewModelPunchPitchMultiplier_IronSights    = (SWEP.Primary.KickUp+SWEP.Primary.KickDown ) * (1-SWEP.Primary.StaticRecoilFactor) * SWEP.IronRecoilMultiplier -- Default value is 0.09
SWEP.ViewModelPunchYawMultiplier                 = SWEP.Primary.KickHorizontal * (1-SWEP.Primary.StaticRecoilFactor)-- Default value is 0.6
SWEP.ViewModelPunchYawMultiplier_IronSights      =  SWEP.Primary.KickHorizontal * (1-SWEP.Primary.StaticRecoilFactor)* SWEP.IronRecoilMultiplier -- Default value is 0.25
-- Firing Cone Related
SWEP.Primary.Spread = .12 -- This is hip-fire acuracy.  Less is more (1 is horribly awful, .0001 is close to perfect)
SWEP.Primary.IronAccuracy = 0.002/3.5 -- Ironsight accuracy, should be the same for shotguns

-- Unless you can do this manually, autodetect it.  If you decide to manually do these, uncomment this block and remove this line.
SWEP.Primary.SpreadMultiplierMax = 3.5 --How far the spread can expand when you shoot. Example val: 2.5
SWEP.Primary.SpreadIncrement = 0.25
SWEP.Primary.SpreadRecovery =3 -- How much the spread recovers, per second. Example val: 3

-- Range Related

-- DEPRECATED. Automatically converted to RangeFalloffLUT table
SWEP.Primary.Range = 0.5 * (20 * 160) -- The distance the bullet can travel in source units.  Set to -1 to autodetect based on damage/rpm.
SWEP.Primary.RangeFalloff = -1 -- The percentage of the range the bullet damage starts to fall off at.  Set to 0.8, for example, to start falling off after 80% of the range.

-- Use these if you don't want/understand how to use LUT below. These values are automatically converted to RangeFalloffLUT table
SWEP.Primary.FalloffMetricBased = false -- Set to true if you set up values below
SWEP.Primary.FalloffByMeter = nil -- How much damage points will bullet loose when travel
SWEP.Primary.MinRangeStartFalloff = nil -- How long will bullet travel in Meters before starting to lose damage?
SWEP.Primary.MaxFalloff = nil -- Maximal amount of damage to be lost
SWEP.LaserDistance = 11500
SWEP.LaserSightModAttachment = 7
SWEP.LaserSightModAttachmentWorld = 7
SWEP.LaserDotISMovement = true
-- Use this for full control over damage dropoff.
--[[
SWEP.Primary.RangeFalloffLUT = {
	bezier = true, -- Whenever to use Bezier or not to interpolate points?
	-- you probably always want it to be set to true
	range_func = "quintic", -- function to spline range
	-- "linear" for linear splining.
	-- Possible values are "quintic", "cubic", "cosine", "sinusine", "linear" or your own function
	units = "meters", -- possible values are "inches", "inch", "hammer", "hu" (are all equal)
	-- everything else is considered to be meters
	lut = { -- providing zero point is not required
		-- without zero point it is considered to be as {range = 0, damage = 1}
		{range = 5, damage = 0.9},
		{range = 12, damage = 0.8},
		{range = 18, damage = 0.5},
		{range = 24, damage = 0.2},
		{range = 30, damage = 0.55},
		{range = 38, damage = 0.76},
		{range = 50, damage = 1},
		{range = 52, damage = 0.96},
		{range = 60, damage = 0.3},
		{range = 70, damage = 0.1},
	}
}
]]

SWEP.DisplayFalloff = nil -- Defaults to true (false for melees)

--[[
SWEP.Primary.RecoilLUT_IronSightsMult = nil -- Defaults to 0.5
-- controls how much effective LUT is when iron sighting
SWEP.Primary.RecoilLUT_AnglePunchMult = nil -- Defaults to 0.25
-- controls how much effective LUT at pushing EyeAngles of shooter
SWEP.Primary.RecoilLUT_ViewPunchMult = nil -- Defaults to 1
-- controls how much effective LUT at viewpunch

SWEP.Primary.RecoilLUT = {
	["in"] = {
		bezier = true,
		func = "quintic", -- function to inerpolate progress when sampling points from table
		-- Possible values are "quintic", "cubic", "cosine", "sinusine", "linear" or your own function
		cooldown_speed = 1, -- how much to loose progress when we are at this stage
		-- 1 means we lose entire progress in a second
		increase = 0.1, -- how much to increase progress after shot
		-- 0.1 means that this stage would be full after 10 shots
		wait = 0.1, -- how much time do we wait in seconds after we stopped shooting
		-- after this time, IN stage begin to cooldown until it reach zero

		-- table is always prepended with an Angle()
		-- only Pitch and Yaw are utilized
		-- sampled point is added to aimvector of player
		-- when they shoot
		points = {
			Angle(-1, 0.4),
			Angle(-4, -2),
			Angle(-6, -4),
			Angle(-10, -6),
		}
	},

	["loop"] = {
		bezier = true,
		func = "quintic",
		-- this stage can not cooldown, so no cooldown_speed is defined
		increase = 0.1, -- when LOOP stage reach 1, it is reset to 0
		wait = 0.1, -- how much time do we wait in seconds after we stopped shooting
		-- after this time, stage switch to OUT

		-- table is NOT prepended with an Angle()
		-- make sure it's starting point match the one from IN stage
		-- last and first points are connected automatically
		points = {
			Angle(-10, -6),
			Angle(-12, -0.4),
			Angle(-8, 9),
			Angle(-11, 12),
			Angle(-13, 2),
			Angle(-8, -4),
		}
	},

	["out"] = {
		bezier = true,
		func = "quintic",
		-- this stage is different
		-- it is only started after LOOP took place
		-- shooting in this stage will actually roll back it's state
		-- until it reach zero and switch back to LOOP
		-- cooling down actually increase stage's progress
		cooldown_speed = 1,
		-- increase act as negative number to reach zero in this stage
		increase = 0.2,

		-- after this stage reach 1, everything reset to IN and wait for next fire
		-- table is always appended with an Angle()

		-- starting point is dynamic
		-- and will always match current LOOP's one
		points = {
			Angle(-7, -2),
			Angle(-4, -1),
			Angle(-2, 0),
		}
	}
}
]]

-- Penetration Related
SWEP.MaxPenetrationCounter = 4 -- The maximum number of ricochets.  To prevent stack overflows.


-- Movespeed
SWEP.MoveSpeed = .95 -- Multiply the player's movespeed by this.
SWEP.IronSightsMoveSpeed = 0.85 -- Multiply the player's movespeed by this when sighting.

-- PROJECTILES
SWEP.Primary.Projectile = nil -- Entity to shoot
SWEP.Primary.ProjectileVelocity = 0 -- Entity to shoot's velocity
SWEP.Primary.ProjectileModel = nil -- Entity to shoot's model

-- VIEWMODEL
SWEP.ViewModel          = "models/weapons/v_xm4_v.mdl" -- Viewmodel path
SWEP.ViewModelFOV           = 65        -- This controls how big the viewmodel looks.  Less is more.
SWEP.ViewModelFlip          = false     -- Set this to true for CSS models, or false for everything else (with a righthanded viewmodel.)
SWEP.UseHands = true -- Use gmod c_arms system.
SWEP.VMPos = Vector(-0, -0, 0) -- The viewmodel positional offset, constantly.  //subtract this from any other modifications to viewmodel position.
SWEP.VMAng = Vector(0, 0, 0) -- The viewmodel angular offset, constantly.   //subtract this from any other modifications to viewmodel angle.
SWEP.VMPos_Additive = false -- Set to false for an easier time using VMPos. If true, VMPos will act as a constant delta ON TOP OF ironsights, run, whateverelse
SWEP.CenteredPos = nil -- The viewmodel positional offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.CenteredAng = nil -- The viewmodel angular offset, used for centering.  Leave nil to autodetect using ironsights.
SWEP.Bodygroups_V = {
	[1] = 1,
} -- {
	-- [0] = 1,
	-- [1] = 4,
	-- [2] = etc.
-- }

SWEP.AllowIronSightsDoF = true -- whenever allow DoF effect on viewmodel when zoomed in with iron sights

SWEP.IronSightsReloadEnabled =false   -- Enable ADS reload animations support (requires animations to be enabled in SWEP.Animations)
SWEP.IronSightsReloadLock = false -- Lock ADS state when reloading

-- WORLDMODEL
SWEP.WorldModel         = "models/weapons/w_xm4_w.mdl" -- Weapon world model path
SWEP.Bodygroups_W = SWEP.Bodygroups_V -- {
-- [0] = 1,
-- [1] = 4,
-- [2] = etc.
-- }

SWEP.HoldType = "ar2" -- This is how others view you carrying the weapon. Options include:
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive
-- You're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.Offset = {
	Pos = {
		Up =1,
		Right =1,
		Forward =0
	},
	Ang = {
		Up = 90,
		Right =- 180,
		Forward =79
	},
	Scale = 1
} -- Procedural world model animation, defaulted for CS:S purposes.

SWEP.ThirdPersonReloadDisable = false -- Disable third person reload?  True disables.

-- SCOPES
SWEP.IronSightsSensitivity = 1 -- Useful for a RT scope.  Change this to 0.25 for 25% sensitivity.  This is if normal FOV compenstaion isn't your thing for whatever reason, so don't change it for normal scopes.
SWEP.BoltAction = false -- Unscope/sight after you shoot?
SWEP.Scoped = false -- Draw a scope overlay?
SWEP.ScopeOverlayThreshold = 0.875 -- Percentage you have to be sighted in to see the scope.
SWEP.BoltTimerOffset = 0.25 -- How long you stay sighted in after shooting, with a bolt action.
SWEP.ScopeScale = 0.5 -- Scale of the scope overlay
SWEP.ReticleScale = 0.7 -- Scale of the reticle overlay
-- GDCW Overlay Options.  Only choose one.
SWEP.Secondary.UseACOG = true -- Overlay option
SWEP.Secondary.UseMilDot = false -- Overlay option
SWEP.Secondary.UseSVD = false -- Overlay option
SWEP.Secondary.UseParabolic = false -- Overlay option
SWEP.Secondary.UseElcan = false -- Overlay option
SWEP.Secondary.UseGreenDuplex = false -- Overlay option
if surface then
	SWEP.Secondary.ScopeTable = nil --[[
		{
			scopetex = surface.GetTextureID("scope/gdcw_closedsight"),
			reticletex = surface.GetTextureID("scope/gdcw_acogchevron"),
			dottex = surface.GetTextureID("scope/gdcw_acogcross")
		}
	]] --
end
-- [[SHOTGUN CODE]] --
SWEP.Shotgun = false -- Enable shotgun style reloading.
SWEP.ShotgunEmptyAnim = false -- Enable emtpy reloads on shotguns?
SWEP.ShotgunEmptyAnim_Shell = true -- Enable insertion of a shell directly into the chamber on empty reload?
SWEP.ShotgunStartAnimShell = true-- shotgun start anim inserts shell
SWEP.ShellTime = .73 -- For shotguns, how long it takes to insert a shell.
SWEP.SprintBobMult= 5 -- More is more bobbing, proportionally.  This is multiplication, not addition.  You want to make this > 1 probably for sprinting.
SWEP.IronBobMult= 0  -- More is more bobbing, proportionally.  This is multiplication, not addition.  You want to make this < 1 for sighting, 0 to outright disable.
-- [[CROUCHING]] --
-- Viewmodel offset when player is crouched
 SWEP.CrouchPos = nil
 SWEP.CrouchAng =  nil
-- [[IRONSIGHTS]] --
SWEP.data = {}
SWEP.data.ironsights = 1 -- Enable Ironsights
SWEP.Secondary.IronFOV = 75 -- How much you "zoom" in. Less is more!  Don't have this be <= 0.  A good value for ironsights is like 70.
-- SWEP.IronViewModelFOV = 65 -- Target viewmodel FOV when aiming down the sights.
SWEP.IronSightsPos = Vector(-0.0,0, -0.0) -- Change this, using SWEP Creation Kit preferably
SWEP.IronSightsAng = Vector(0, 0,0) 
SWEP.IronSightTime = 0.4 -- Change this, using SWEP Creation Kit preferably
SWEP.IronSightsOffsetSmoothing = 0
SWEP.CustomSightsPos =SWEP.IronSightsPos + Vector(-0.055,-0, 0.15)  -- Change this, using SWEP Creation Kit preferably
SWEP.CustomSightsAng = SWEP.IronSightsAng+ Vector(0,0, -2) 
SWEP.IronSightsPos_MONOC = SWEP.CustomSightsPos+Vector(0,0,0.10)
SWEP.IronSightsAng_MONOC = SWEP.CustomSightsAng

SWEP.IronSightsPos_AIMOP = SWEP.CustomSightsPos +Vector(0,0,0.15)
SWEP.IronSightsAng_AIMOP = SWEP.CustomSightsAng

SWEP.IronSightsPos_MINI = SWEP.CustomSightsPos
SWEP.IronSightsAng_MINI = SWEP.CustomSightsAng

SWEP.IronSightsPos_OPE = SWEP.CustomSightsPos +Vector(0,0,0.10)
SWEP.IronSightsAng_OPE =SWEP.CustomSightsAng

SWEP.IronSightsPos_LP = SWEP.CustomSightsPos
SWEP.IronSightsAng_LP = SWEP.CustomSightsAng

SWEP.IronSightsPos_SOLO = SWEP.CustomSightsPos
SWEP.IronSightsAng_SOLO = SWEP.CustomSightsAng

SWEP.IronSightsPos_VIP =SWEP.CustomSightsPos+Vector(0,0,-0.17)
SWEP.IronSightsAng_VIP =SWEP.CustomSightsAng

SWEP.IronSightsPos_CORP = SWEP.CustomSightsPos+Vector(0.00,0,-0.3)
SWEP.IronSightsAng_CORP =SWEP.CustomSightsAng

SWEP.IronSightsPos_PBX = SWEP.CustomSightsPos+Vector(0.00,0,-0.2)
SWEP.IronSightsAng_PBX = SWEP.CustomSightsAng

SWEP.IronSightsPos_XM157 = SWEP.CustomSightsPos+Vector(0.07,0,-0.4)
SWEP.IronSightsAng_XM157 = SWEP.CustomSightsAng



SWEP.IronSightsPos_Kobra = SWEP.CustomSightsPos + Vector(-0.01,0,-0.42)
SWEP.IronSightsAng_Kobra =SWEP.CustomSightsAng

SWEP.IronSightsPos_EOTech = SWEP.CustomSightsPos + Vector(-0.01,0,-0.22)
SWEP.IronSightsAng_EOTech = SWEP.CustomSightsAng

SWEP.IronSightsPos_RDS = SWEP.CustomSightsPos + Vector(-0.01,0,-0.42)
SWEP.IronSightsAng_RDS = SWEP.CustomSightsAng
SWEP.Secondary.IronFOV_RDS = 75

SWEP.IronSightsPos_2XRDS = SWEP.CustomSightsPos + Vector(-0.01,-2,-0.42)
SWEP.IronSightsAng_2XRDS = SWEP.CustomSightsAng
SWEP.RTRedrawViewModel_2XRDS = false

SWEP.IronSightsPos_C79 = SWEP.CustomSightsPos  + Vector(0.01,0,-0.58)
SWEP.IronSightsAng_C79 = SWEP.CustomSightsAng
SWEP.Secondary.IronFOV_C79 = 55
SWEP.RTScopeFOV_C79 = 55
SWEP.RTRedrawViewModel_C79 = false

SWEP.IronSightsPos_PO4X = SWEP.CustomSightsPos  + Vector(0.085,1,-0.32)
SWEP.IronSightsAng_PO4X = SWEP.CustomSightsAng
SWEP.Secondary.IronFOV_PO4X = 55
SWEP.RTRedrawViewModel_PO4X = false

SWEP.IronSightsPos_Thermal 			= SWEP.CustomSightsPos + Vector(-0.01,-6,-0.42)
SWEP.IronSightsAng_Thermal 			= SWEP.CustomSightsAng
SWEP.Secondary.IronFOV_Thermal 		= 50

SWEP.IronSightsPos_NVPoint = Vector(-2.2, 2, -0.5)
SWEP.IronSightsAng_NVPoint = Vector(0,0, -55)

SWEP.IronSightsPos_GL = Vector(0, 0, 0)
SWEP.IronSightsAng_GL = Vector(0, 0 ,0)

SWEP.Secondary.IronFOV_4xScope = 22
SWEP.IronViewModelFOV_4xScope = 87
SWEP.IronSightsPos_4xScope =SWEP.CustomSightsPos
SWEP.IronSightsAng_4xScope = SWEP.CustomSightsAng

SWEP.IronSightsPos_Mosin = SWEP.CustomSightsPos+ Vector(0.035,0,-0.28)
SWEP.IronSightsAng_Mosin =  SWEP.CustomSightsAng
SWEP.Secondary.IronFOV_Mosin = 62


SWEP.IronSightsPos_MX4 =  SWEP.CustomSightsPos+ Vector(-0.015,0,-0.6)
SWEP.IronSightsAng_MX4 = SWEP.CustomSightsAng
SWEP.Secondary.ScopeZoom_MX4 = 8.7



-- [[VIEWMODEL BLOWBACK]] --
SWEP.BlowbackEnabled = false -- Enable Blowback?
SWEP.BlowbackVector = Vector(0, -1, 0) -- Vector to move bone <or root> relative to bone <or view> orientation.
SWEP.BlowbackAngle = nil -- Angle(0, 0, 0)
SWEP.BlowbackCurrentRoot = 0 -- Amount of blowback currently, for root
SWEP.BlowbackCurrent = 0 -- Amount of blowback currently, for bones
SWEP.BlowbackBoneMods = nil -- Viewmodel bone mods via SWEP Creation Kit
SWEP.Blowback_Only_Iron = true -- Only do blowback on ironsights
SWEP.Blowback_PistolMode = false -- Do we recover from blowback when empty?
SWEP.Blowback_Shell_Enabled = true -- Shoot shells through blowback animations
SWEP.Blowback_Shell_Effect = "ShellEject" -- Which shell effect to use
SWEP.BlowbackAllowAnimation = nil -- Allow playing shoot animation with blowback?
-- [[VIEWMODEL PROCEDURAL ANIMATION]] --
SWEP.DoProceduralReload = false -- Animate first person reload using lua?
SWEP.ProceduralReloadTime = 1 -- Procedural reload time?
-- [[HOLDTYPES]] --
SWEP.IronSightHoldTypeOverride = "smg" -- This variable overrides the ironsights holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
SWEP.SprintHoldTypeOverride = "passive" -- This variable overrides the sprint holdtype, choosing it instead of something from the above tables.  Change it to "" to disable.
-- [[ANIMATION]] --
SWEP.MagoutTime = {
	["reload"] = 23/30,
	["reload_ext01"] = 24/30,
	["reload_ext02"] = 38/30,
	["reload_ext03"] = 23/30,
}
SWEP.StatusLengthOverride       = {
	["fire_last"] = 0.1,
	["iron_fire"] = 0.1,

	["reload"] = 1.65,
	["reload_empty"] =2.2,
	["reload_ext01"] = 1.7,
	["reload_empty_ext01"] = 2.2,
	["reload_ext02"] = 2.5,
	["reload_empty_ext02"] = 2.78,
	["reload_ext03"] = 3,
	["reload_empty_ext03"] = 3.6,
	

	
	
} -- Changes the status delay of a given animation; only used on reloads.  Otherwise, use SequenceLengthOverride or one of the others
SWEP.SequenceLengthOverride       = {
	["reload"] = SWEP.StatusLengthOverride.reload,
	["reload_empty"] = SWEP.StatusLengthOverride.reload_empty,
	
	["ads_in"] = 0.2,
	["ads_in_empty"] = 0.2,
	["ads_out"] = 0.2,
	["ads_out_empty"] = 0.2,

	
	
	
}  -- Changes both the status delay and the nextprimaryfire of a given animation
SWEP.SequenceTimeOverride = {} -- Like above but changes animation length to a target
SWEP.SequenceRateOverride = {} -- Like above but scales animation length rather than being absolute

SWEP.ProceduralHolsterEnabled = nil
SWEP.ProceduralHolsterTime = 0.3
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)

SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH -- TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
SWEP.Idle_Blend = 0.0 -- Start an idle this far early into the end of a transition
SWEP.Idle_Smooth = 0.1 -- Start an idle this far early into the end of another animation
-- MDL Animations Below

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID -- LOCOMOTION_ANI = mdl, LOCOMOTION_HYBRID = ani + lua, LOCOMOTION_LUA = lua only

SWEP.IronAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "ads_in", -- Number for act, String/Number for sequence
		["value_empty"] = "ads_in_empty",
		["transition"] = false
	}, -- Inward transition
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "iron_idle", -- Number for act, String/Number for sequence
		["value_empty"] = "iron_idle_empty"
	}, -- Looping Animation
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "ads_out", -- Number for act, String/Number for sequence
		["value_empty"] = "ads_out_empty",
		["transition"] = false
	}, -- Outward transition
	["shoot"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "iron_fire", -- Number for act, String/Number for sequence
		["value_last"] = "iron_fire_last",
	--	["value_empty"] = "Fire_Iron_Dry"
	} -- What do you think
}

-- [[SPRINTING]] --
SWEP.RunSightsPos = Vector(0,0,0) -- Change this, using SWEP Creation Kit preferably
SWEP.RunSightsAng = Vector(-15, 15, -15) -- Change this, using SWEP Creation Kit preferably
--SWEP.RunSightsAng = Vector(-0, 0, -0  ) -- Change this, using SWEP Creation Kit preferably

SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_HYBRID-- LOCOMOTION_ANI = mdl, LOCOMOTION_HYBRID = ani + lua, LOCOMOTION_LUA = lua only
SWEP.SprintAnimation = {}

SWEP.Walk_Mode = TFA.Enum.LOCOMOTION_LUA -- LOCOMOTION_ANI = mdl, LOCOMOTION_HYBRID = ani + lua, LOCOMOTION_LUA = lua only
SWEP.WalkAnimation ={
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "jog", -- Number for act, String/Number for sequence
		["value_empty"] = "jog_empty",
		["is_idle"] = true
	}, -- looping animation 
}
--[[
SWEP.WalkAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Idle_to_Walk", -- Number for act, String/Number for sequence
		["value_empty"] = "Idle_to_Walk_Empty",
		["transition"] = true
	}, -- Inward transition
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Walk", -- Number for act, String/Number for sequence
		["value_empty"] = "Walk_Empty",
		["is_idle"] = true
	}, -- looping animation
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "Walk_to_Idle", -- Number for act, String/Number for sequence
		["value_empty"] = "Walk_to_Idle_Empty",
		["transition"] = true
	} -- Outward transition
}
]]

--[[
-- Looping fire animation (full-auto only)
SWEP.ShootAnimation = {
	["in"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "ShootLoop_Start", -- Number for act, String/Number for sequence
		["value_is"] = "ShootLoop_Iron_Start", -- Number for act, String/Number for sequence
		["transition"] = true
	}, -- Looping Start, fallbacks to loop
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "ShootLoop", -- Number for act, String/Number for sequence,
		["value_is"] = "ShootLoop_Iron", -- Number for act, String/Number for sequence,
		["is_idle"] = true,
	}, -- Looping Animation
	["out"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] = "ShootLoop_End", -- Number for act, String/Number for sequence
		["value_is"] = "ShootLoop_Iron_End", -- Number for act, String/Number for sequence
		["transition"] = true
	}, -- Looping End
}
]]

SWEP.Customize_Mode = TFA.Enum.LOCOMOTION_HYBRID -- LOCOMOTION_ANI = mdl, LOCOMOTION_HYBRID = ani + lua, LOCOMOTION_LUA = lua only
-- [[INSPECTION]] --
--SWEP.InspectPos =Vector(-40, -30, 15) -- Replace with a vector, in style of ironsights position, to be used for inspection
--SWEP.InspectAng =  Vector(0, -90, 0) -- Replace with a vector, in style of ironsights angle, to be used for inspection
SWEP.InspectPos =Vector(5, 0, 0) -- Replace with a vector, in style of ironsights position, to be used for inspection
SWEP.InspectAng =  nil -- Replace with a vector, in style of ironsights angle, to be used for inspection
SWEP.CustomizeAnimation = {
	
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, -- Sequence or act
		["value"] =  ACT_VM_IDLE, -- Number for act, String/Number for sequence
		["value_empty"] =  ACT_VM_IDLE_EMPTY, -- Number for act, String/Number for sequence
		["is_idle"] = true
	},
	
}


SWEP.PumpAction = { 
}


-- [[EFFECTS]] --
-- Attachments
SWEP.MuzzleAttachment           = "muzzle"       -- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellAttachment            = "shell"       -- Should be "2" for CSS models or "shell" for hl2 models
SWEP.MuzzleFlashEnabled = true -- Enable muzzle flash
SWEP.MuzzleAttachmentRaw = nil -- This will override whatever string you gave.  This is the raw attachment number.  This is overridden or created when a gun makes a muzzle event.
SWEP.AutoDetectMuzzleAttachment = false -- For multi-barrel weapons, detect the proper attachment?
SWEP.MuzzleFlashEffect = nil -- Change to a string of your muzzle flash effect.  Copy/paste one of the existing from the base.
SWEP.SmokeParticle = nil -- Smoke particle (ID within the PCF), defaults to something else based on holdtype; "" to disable
SWEP.EjectionSmokeEnabled = true -- Disable automatic ejection smoke
-- Shell eject override
SWEP.LuaShellEject = true -- Enable shell ejection through lua?
SWEP.LuaShellEjectDelay = 0 -- The delay to actually eject things
SWEP.LuaShellModel = "models/dqr/bo6/xm4/545s.mdl" -- The model to use for ejected shells
SWEP.LuaShellScale = nil -- The model scale to use for ejected shells
SWEP.LuaShellYaw = nil -- The model yaw rotation ( relative ) to use for ejected shells
-- Tracer Stuff
SWEP.TracerName         = nil   -- Change to a string of your tracer name.  Can be custom. There is a nice example at https://github.com/garrynewman/garrysmod/blob/master/garrysmod/gamemodes/base/entities/effects/tooltracer.lua
SWEP.TracerCount        = 1     -- 0 disables, otherwise, 1 in X chance
-- Impact Effects
SWEP.ImpactEffect = nil -- Impact Effect
SWEP.ImpactDecal = nil -- Impact Decal
-- [[EVENT TABLE]] --
SWEP.EventTable = {} -- Event Table, used for custom events when an action is played.  This can even do stuff like playing a pump animation after shooting.
-- example:
-- SWEP.EventTable = {
--  [ACT_VM_RELOAD] = {
--																				-- ifp is IsFirstTimePredicted()
--      { ["time"] = 0.1, ["type"] = "lua", ["value"] = function( wep, viewmodel, ifp ) end, ["client"] = true, ["server"] = true},
--      { ["time"] = 0.1, ["type"] = "sound", ["value"] = Sound("x") }
--  }
-- }
-- [[RENDER TARGET]] --
SWEP.RTMaterialOverride = nil -- Take the material you want out of print(LocalPlayer():GetViewModel():GetMaterials()), //subtract 1 from its index, and set it to this.
SWEP.RTOpaque = false -- Do you want your render target to be opaque?
SWEP.RTCode = nil -- function(self) return end -- This is the function to draw onto your rendertarget
SWEP.RTBGBlur = true -- Draw background blur when 3D scope is active?
-- [[AKIMBO]] --
SWEP.Akimbo = false -- Akimbo gun?  Alternates between primary and secondary attacks.
SWEP.AnimCycle = 1 -- Start on the right
SWEP.AkimboHUD = true -- Draw holographic HUD for both weapons?
-- [[ATTACHMENTS]] --
SWEP.ViewModelBoneMods = {
	--["A_Suppressor"] = { scale = Vector(0.8, 0.8, 0.8), pos = Vector(0.05, -0.8, 0), angle = Angle(0, 0, 0) },
	--["tag_grip_attach"] = { scale = Vector(1, 1, 1), pos = Vector(1.5, 0, 0.15), angle = Angle(0, 0, 0) },
	["tag_flash"] = { scale = Vector(1, 1, 1), pos = Vector(-2, 0, 0), angle = Angle(0, 0, 0) },
	["tag_holo"] = { scale = Vector(1, 1, 1), pos = Vector(2, 0, 0), angle = Angle(0, 0, 2) },
	--["tag_laser_attach"] = { scale = Vector(1, 1, 1), pos = Vector(2, 0, 0.8), angle = Angle(0, 0, 90) },
	
}
SWEP.WorldModelBoneMods = 
{
	--["A_Suppressor"] = { scale = Vector(0.8, 0.8, 0.8), pos = Vector(0.05, -0.8, 0), angle = Angle(0, 0, 0) },
	--["tag_grip_attach"] = { scale = Vector(1, 1, 1), pos = Vector(1.5, 0, 0.15), angle = Angle(0, 0, 0) },
	["tag_flash"] = { scale = Vector(1, 1, 1), pos = Vector(0, -.25, 3), angle = Angle(0, 0, 0) },
	["tag_holo"] = { scale = Vector(1, 1, 1), pos = Vector(3, 0, 0), angle = Angle(0, 0, 2) },
	--["tag_laser_attach"] = { scale = Vector(1, 1, 1), pos = Vector(2, 0, 0.8), angle = Angle(0, 0, 90) },
	
}
SWEP.VElements = {
	["barrel"] = { type = "Model", model = "models/dqr/bo6/xm4/xm4_bar_def.mdl ", bone = "", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[2]=1,[1]=1}, active = true, bonemerge = true }, 
	["mag"] = { type = "Model", model = "models/dqr/bo6/xm4/xm4_mag_30.mdl ", bone = "", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[1]=1}, active = true, bonemerge = true }, 
	["default_stock"] = { type = "Model", model = "models/dqr/bo6/xm4/xm4_stock_def.mdl ", bone = "", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[1]=0}, active = true, bonemerge = true }, 
	["pgrip"] = { type = "Model", model = "models/dqr/bo6/xm4/xm4_psg_def.mdl ", bone = "", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[1]=0}, active = true, bonemerge = true }, 

	
	--["default_muzzle"] = { type = "Model", model = "models/freezeice/norinco/attachments/qbz191/attachment_vm_ar_qbz191_barrel.mdl ", bone = "", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[1]=0}, active = true, bonemerge = true }, 
	["df_xm157_optic"] = { type = "Model", model = "models/weapons/attachments/df_xm157.mdl", bone = "", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[1]=0}, active = false, bonemerge = true }, 
	["df_xm157_opticlen"] = { type = "Model", model = "models/mw3/m7/df_xm157_lh.mdl ", bone = "", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true }, 

	
	--["sights_folded"] = { type = "Model", model = "models/ironsight_m4_unfolded.mdl", bone = "tag_holo", rel = "ref", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = true, bonemerge = true  }, 
	["sight_monocle"] =  { type = "Model", model = "models/weapons/mw/common/si_monocle.mdl", bone = "tag_holo", rel = "", pos = Vector(-2.5, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
	["sight_aimop"] =  { type = "Model", model = "models/weapons/mw/common/si_aimop.mdl", bone = "tag_holo", rel = "",pos = Vector(-2, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
	["sight_mini"] =  { type = "Model", model = "models/weapons/mw/common/si_mini.mdl", bone = "", rel = "mw_rail", pos = Vector(0, 0, 0.4), angle = Angle(0, 0, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
	["sight_operator"] =  { type = "Model", model = "models/weapons/mw/common/si_operator.mdl", bone = "tag_holo", rel = "", pos = Vector(-2, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
	["sight_lp945"] =  { type = "Model", model = "models/weapons/mw/common/si_lp945.mdl", bone = "", rel = "mw_rail",pos = Vector(0, -0.5, 0.4), angle = Angle(0, 0, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
	["sight_viper"] =  { type = "Model", model = "models/weapons/mw/common/si_viper.mdl", bone = "tag_holo", rel = "", pos = Vector(-3, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
	["sight_corp_combat"] =  { type = "Model", model = "models/weapons/mw/common/si_corp_combat.mdl", bone = "tag_holo", rel = "",pos = Vector(-2, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
	["sight_solozero"] =  { type = "Model", model = "models/weapons/mw/common/si_solozero.mdl", bone = "", rel = "mw_rail", pos = Vector(0, -0.5, 0.4), angle = Angle(0, 0, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
	["sight_pbx7"] =  { type = "Model", model = "models/weapons/mw/common/si_pbx7.mdl", bone = "tag_holo", rel = "",pos = Vector(-2.5, 0, 0), angle = Angle(0, -90, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = false, active = false, bodygroup = {} },
	["sight_qmk152"] =  { type = "Model", model = "models/freezeice/norinco/attachments/qbz191/attachment_vm_ar_qbz191_qmk152.mdl", bone = "", rel = "",Vector(0, -1, 0.15), angle = Angle(0, -90, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = true, active = false, bodygroup = {[1] = 0} },
	["sight_qmk152_len"] =  { type = "Model", model = "models/freezeice/norinco/attachments/qbz191/attachment_vm_ar_qbz191_qmk152lh.mdl", bone = "", rel = "",Vector(0, -1, 0.15), angle = Angle(0, -90, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bonemerge = true, active = false, bodygroup = {} },

	["mw_rail"] = { type = "Model", model = "models/weapons/mw/common/si_mini_rail.mdl", bone = "tag_holo", rel = "",pos = Vector(-2, 0, 0.0), angle = Angle(0, -90, 0), size = Vector(0.98, 0.98, 0.98), color = Color(255, 255, 255, 255), surpresslightning = false,active = false, material = "", skin = 0, bodygroup = {} },	
    
	["sight_kobra"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_kobra_l.mdl", bone = "tag_holo", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = false },
	["sight_kobra_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_kobra") or nil,
	["sight_eotech"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_eotech_m.mdl", bone = "tag_holo", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = false },
	["sight_eotech_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_eotech") or nil,
	["sight_rds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimpoint.mdl", bone = "tag_holo", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = false },
	["sight_rds_lens"] = (TFA.INS2 and TFA.INS2.GetHoloSightReticle) and TFA.INS2.GetHoloSightReticle("sight_rds") or nil,
	["scope_2xrds"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_aimp2x.mdl", bone = "tag_holo", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = false },
	["scope_c79"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_elcan_m.mdl", bone = "tag_holo", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, -0.5), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = false },
	["scope_po4x"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_po4x24.mdl", bone = "tag_holo", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true },
	["scope_po4x_lens"] = { type = "Model", model = "models/rtcircle.mdl", bone = "Lense_RT", rel = "scope_po4x", pos = Vector(0, 0, -1.6), angle = Angle(-90, 0, -90), size = Vector(0.3, 0.3, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {}, active = false, bonemerge = false  },
    ["sight_thermal"] = { type = "Model", model = "models/weapons/attachments/thermal/c_iw4_thermal.mdl", bone = "tag_holo", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = false },
	["sight_thermal_lens"] = { type = "Model", model = "models/weapons/attachments/thermal/c_iw4_thermal_lens.mdl", bone = "tag_holo", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = false },	
	
	["scope_mosin"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_mosin_l.mdl", bone = "tag_holo", rel = "",  pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1.0, 1.0, 1.0), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , active = false },
	["scope_mx4"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_optic_m40_l.mdl", bone = "tag_holo", rel = "",  pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1.0, 1.0, 1.0), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , active = false },

	["tac_laser_01"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_laser01.mdl", bone = "", rel = "barrel", pos = Vector(7, 1.2, 0), angle = Angle(0, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	["tac_laser_beam_01"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "tag_laser", rel = "tac_laser_01", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	
	["tac_laser_02"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_laser02.mdl", bone = "tag_barrel_attach", rel = "",  pos = Vector(7, 1.2, 0), angle = Angle(0, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	["tac_laser_beam_02"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "tag_laser", rel = "tac_laser_02", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	
	["tac_laser_03"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_laser03.mdl", bone = "tag_barrel_attach", rel = "",  pos = Vector(7, 1.2, 0), angle = Angle(0, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	["tac_laser_beam_03"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "tag_laser", rel = "tac_laser_03", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
   
	["laser"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_laser01.mdl", bone = "", rel = "barrel", pos = Vector(7, 1.2, 0), angle = Angle(0, 0, 90), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	["laser_beam"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "tag_laser_attach", rel = "laser", pos = Vector(0, -0.15, 0.5), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	
	["laser_anpeq15_black"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_laser_anpeq15.mdl", bone = "tag_barrel_attach", rel = "", pos = Vector(8, 1.2, 1), angle = Angle(0, 0, 180), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	["laser_beam_anpeq15_black"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "tag_laser", rel = "laser_anpeq15_black", pos = Vector(0, -0.15, 0.5), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	
	["laser_anpeq15_tan"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_laser_anpeq15_tan.mdl", bone = "tag_barrel_attach", rel = "", pos = Vector(8, 1.2, 1), angle = Angle(0, 0, 180), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	["laser_beam_anpeq15_tan"] = { type = "Model", model = "models/tfa/lbeam.mdl", bone = "tag_laser_attach", rel = "laser_anpeq15_tan", pos = Vector(0, -0.15, 0.5), angle = Angle(0, 0, 0), size = Vector(2, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	
	["flashlight"] ={ type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_laser01.mdl", bone = "", rel = "barrel", pos = Vector(7, 1.2, 0), angle = Angle(0, 0, 90), size = Vector(0.95, 0.95, 0.95), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = false, active = false },
	
	
	["heavy_stock_01"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_stock_heavy.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true }, 
	["heavy_stock_02"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_stock_heavy02.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true }, 
	["light_stock_01"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_stock_light01.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true }, 
	["medium_stock_01"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_stock_medium01.mdl", bone = "", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false, bonemerge = true }, 

	--["standard_barrel"] = { type = "Model", model = "models/freezeice/norinco/attachments/qbz191/attachment_vm_ar_qbz191_muzzle.mdl ", bone = "tag_flash", rel = "", pos = Vector(-23,-0.5, 0.6), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[1]=1}, active = true, bonemerge = false },
	["MW_MuzzleBrake_01"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_muzzlebrake01.mdl", bone = "tag_flash", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },
	["MW_MuzzleBrake_02"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_muzzlebrake02.mdl", bone = "tag_flash", rel = "",pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },
	["MW_MuzzleBrake_03"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_muzzlebrake03.mdl", bone = "tag_flash", rel = "",pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },	
	
	["MW_flashhider_01"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_flashhider01.mdl", bone = "tag_flash", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },	
	["MW_flashhider_02"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_flashhider02.mdl", bone = "tag_flash", rel = "",pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },	
	["MW_flashhider_03"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_flashhider03.mdl", bone = "tag_flash", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },
	["suppressor"] = { type = "Model", model = "models/weapons/tfa_ins2/upgrades/a_suppressor_sec2.mdl", bone = "tag_flash", rel = "", pos = Vector(-0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.9, 0.9, 0.9), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },
	["suppressor_osprey"] = { type = "Model", model = "models/weapons/tfa_eft/upgrades/v_osprey.mdl", bone = "tag_flash", rel = "",  pos = Vector(-0, 0, 0), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },	

	["MW_supp_01"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_silencer_east01.mdl", bone = "tag_flash", rel = "", pos = Vector(-0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },
	["MW_supp_02"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_silencer02.mdl", bone = "tag_flash", rel = "", pos = Vector(-0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },
	["MW_supp_03"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_silencer03.mdl", bone = "tag_flash", rel = "", pos = Vector(-0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },	
	["MW_supp_04"] = { type = "Model", model = "models/weapons/tfa_mw2022/upgrades/attachment_vm_silencer04.mdl", bone = "tag_flash", rel = "", pos = Vector(-0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} , bonemerge = false, active = false },	

} -- Export from SWEP Creation Kit.  For each item that can/will be toggled, set active=false in its individual table
SWEP.WElements = SWEP.VElements -- Export from SWEP Creation Kit.  For each item that can/will be toggled, set active=false in its individual table
SWEP.Attachments = {
	[1] = { atts = {	"xm4_xmag","xm4_xmag2","xm4_xmag3"}, order = 1},
	[2] = { atts = {"xm4_bar_h1","xm4_bar_h2","xm4_bar_m1","xm4_bar_r1","xm4_bar_v1"}},
	[3] = { atts = {	"xm4_p_m","xm4_p_q1","xm4_p_q2","xm4_p_s1","xm4_p_s2"}},
	--[4] = { atts = {	"att_tfa_reload1_base"}},	
	
	[7] = { atts = { "r6s_muzzle_brake", "r6s_flashhider_2","ins2_br_heavy","nmw_muzzle_brake01","nmw_muzzle_brake02","nmw_muzzle_brake03","nmw_muzzle_flashhider01","nmw_muzzle_flashhider02","nmw_muzzle_flashhider03","nmw1_mpapa5_silencer01", "nmw1_mpapa5_silencer02","nmw1_mpapa5_silencer03", "nmw1_mpapa5_silencer04","ins2_br_supp", "ins2_eft_osprey"}},
	--[9] = { atts = { "ins2_ub_flashlight","nmw_muzzle_laser01", "nmw_muzzle_laser02", "nmw_muzzle_laser03","ins2_ub_laser", "ins2_laser_anpeq15_black", "ins2_laser_anpeq15_tan"}, order = 6 },

	
	[10] = { atts = { "xm4_sight","mw2019_si_operator","mw2019_si_monocle","mw2019_si_aimop","mw2019_si_mini","mw2019_si_lp945","mw2019_si_viper","mw2019_si_solozero","mw2019_si_corp_combat","mw2019_si_pbx7","ins2_si_kobra", "ins2_si_eotech", "ins2_si_rds", "ins2_si_2xrds", "ins2_si_c79", "ins2_si_po4x", "ins2_si_mosin","ins2_si_mx4", "iw4_att_thermal" },default = "xm4_sight"},
     

	[11] = { atts = {"xm4_stock_b1", "xm4_stock_f1", "xm4_stock_l1", "xm4_stock_m1", "xm4_stock_m2", "nmw_stock_heavy01","nmw_stock_heavy02","nmw_stock_light01","nmw_stock_medium01"}, order = 10 },

	[98] = {offset = { 0, 0 },atts = { "trm_pointershoot" }, default = "trm_pointershoot",hidden ="trm_pointershoot" },
	[99] = {offset = { 0, 0 },atts = { "am_match", "am_magnum" },  },
	--[[
		[slot number] = {
			atts = {
				"si_eotech",
				-- ...
			}, -- table of available attachments IDs

			sel = 0, -- index or ID of pre-selected attachment (index starts with 1)
			default = nil, -- attachment ID to equip on deselect
			hidden = nil, -- true to hide category from attachments selector (this does not prevent attachments to be selected through other means!)
		}
	]]

	-- sel allows you to have an attachment pre-selected, and is used internally by the base to show which attachment is selected in each category.
}
SWEP.AttachmentDependencies = {} -- {["si_acog"] = {"bg_rail", ["type"] = "OR"}} -- type could also be AND to require multiple
SWEP.AttachmentExclusions = {
}
SWEP.AttachmentTableOverride = {
	
 	
} --[[{ -- overrides WeaponTable for attachments
	["ins2_ub_laser"] = { -- attachment id, root of WeaponTable override
		["VElements"] = {
			["laser_rail"] = {
				["active"] = true
			},
		},
	}
}]]

SWEP.DInv2_GridSizeX = nil -- DInventory/2 Specific. Determines weapon's width in grid. This is not TFA Base specific and can be specified to any Scripted SWEP.
SWEP.DInv2_GridSizeY = nil -- DInventory/2 Specific. Determines weapon's height in grid. This is not TFA Base specific and can be specified to any Scripted SWEP.
SWEP.DInv2_Volume = nil -- DInventory/2 Specific. Determines weapon's volume in liters. This is not TFA Base specific and can be specified to any Scripted SWEP.
SWEP.DInv2_Mass = nil -- DInventory/2 Specific. Determines weapon's mass in kilograms. This is not TFA Base specific and can be specified to any Scripted SWEP.
SWEP.Secondary.CanBash            = true -- set to false to disable bashing
SWEP.Secondary.BashDamage         = 50 -- Melee bash damage
SWEP.Secondary.BashSound          = "TFA.Bash" -- Soundscript name for bash swing sound
SWEP.Secondary.BashHitSound       = "TFA.BashWall" -- Soundscript name for non-flesh hit sound
SWEP.Secondary.BashHitSound_Flesh = "TFA.BashFlesh" -- Soundscript name for flesh hit sound
SWEP.Secondary.BashLength         = 54 -- Length of bash melee trace in units
SWEP.Secondary.BashDelay          = 0.2 -- Delay (in seconds) from bash start to bash attack trace
SWEP.Secondary.BashDamageType     = DMG_SLASH -- Damage type (DMG_ enum value)
SWEP.Secondary.BashEnd            = 0.8 -- Bash end time (in seconds), defaults to animation end if undefined
SWEP.Secondary.BashInterrupt      = true -- Bash attack interrupts everything (reload, draw, whatever)

-- [[MISC INFO FOR MODELERS]] --
--[[

Used Animations (for modelers):

ACT_VM_DRAW - Draw
ACT_VM_DRAW_EMPTY - Draw empty
ACT_VM_DRAW_SILENCED - Draw silenced, overrides empty

ACT_VM_IDLE - Idle
ACT_VM_IDLE_SILENCED - Idle empty, overwritten by silenced
ACT_VM_IDLE_SILENCED - Idle silenced

ACT_VM_PRIMARYATTACK - Shoot
ACT_VM_PRIMARYATTACK_EMPTY - Shoot last chambered bullet
ACT_VM_PRIMARYATTACK_SILENCED - Shoot silenced, overrides empty
ACT_VM_PRIMARYATTACK_1 - Shoot ironsights, overriden by everything besides normal shooting
ACT_VM_DRYFIRE - Dryfire

ACT_VM_RELOAD - Reload / Tactical Reload / Insert Shotgun Shell
ACT_SHOTGUN_RELOAD_START - Start shotgun reload, unless ACT_VM_RELOAD_EMPTY is there.
ACT_SHOTGUN_RELOAD_FINISH - End shotgun reload.
ACT_VM_RELOAD_EMPTY - Empty mag reload, chambers the new round.  Works for shotguns too, where applicable.
ACT_VM_RELOAD_SILENCED - Silenced reload, overwrites all


ACT_VM_HOLSTER - Holster
ACT_VM_HOLSTER_SILENCED - Holster empty, overwritten by silenced
ACT_VM_HOLSTER_SILENCED - Holster silenced

]] --
DEFINE_BASECLASS( SWEP.Base )
-- SWEP.CustomLaserSightStatus = 0
-- SWEP.CustomLaserSightSwitchDelay = 0.25


include( "tfa/modules/mw_port_recoil_module_01.lua" )
include( "weapons/tfa_2d_thermal/shared.lua" )

