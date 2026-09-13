if SERVER then
    AddCSLuaFile()
end

SWEP.PrintName = "Glock 19"
SWEP.Author = "trollyne"
SWEP.Instructions = "Click izquierdo para disparar | R para recargar"
SWEP.Category = "Mis SWEPs"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.UseHands = true
SWEP.ViewModel = "models/weapons/gammaglock/v_gammaglock.mdl"
SWEP.WorldModel = "models/weapons/w_gammaglock.mld

SWEP.Primary.ClipSize = 15
SWEP.Primary.DefaultClip = 15
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"

SWEP.Primary.Delay = 0.15
SWEP.Primary.Damage = 20
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.02

function SWEP:Initialize()
    self:SetHoldType("pistol")
end

function SWEP:PrimaryAttack()
    if not self:CanPrimaryAttack() then return end

    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
    self:EmitSound("Weapon_Pistol.Single")

    self:ShootBullet(
        self.Primary.Damage,
        self.Primary.NumShots,
        self.Primary.Cone
    )

    self:TakePrimaryAmmo(1)
    self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

    local owner = self:GetOwner()
    if IsValid(owner) then
        owner:SetAnimation(PLAYER_ATTACK1)
    end
end

function SWEP:Reload()
    self:DefaultReload(ACT_VM_RELOAD)
end
