Add-Type -AssemblyName System.Drawing

$base = "c:\Users\akusu\Documents\minecraft\ore_addon\RP\textures"
New-Item -ItemType Directory -Force -Path "$base\blocks" | Out-Null
New-Item -ItemType Directory -Force -Path "$base\items" | Out-Null
New-Item -ItemType Directory -Force -Path "$base\models\armor" | Out-Null

# ---- Color helpers ----
function C([int]$r,[int]$g,[int]$b) { [System.Drawing.Color]::FromArgb(255,$r,$g,$b) }
function CA([int]$a,[int]$r,[int]$g,[int]$b) { [System.Drawing.Color]::FromArgb($a,$r,$g,$b) }

# Color palette
$DS1  = C 40  40  44   # deepslate darkest
$DS2  = C 60  60  66   # deepslate mid
$DS3  = C 80  80  88   # deepslate light
$DS4  = C 95  95 103   # deepslate highlight
$P1   = C 40  10  70   # purple darkest
$P2   = C 70  20 110   # purple dark
$P3   = C 110  40 170  # purple mid
$P4   = C 150  80 210  # purple bright
$P5   = C 190 130 240  # purple light
$P6   = C 220 180 255  # purple highlight
$BK   = C  0   0   0
$WH   = C 255 255 255

# ---- Helper: save bitmap ----
function SaveBmp([System.Drawing.Bitmap]$bmp, [string]$path) {
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
    Write-Host "Saved: $path"
}

# ---- budoh_ore.png (16x16) ----
# Deepslate background with purple gem veins
$orePixels = @(
    $DS2,$DS1,$DS2,$DS3,$DS2,$DS1,$DS2,$DS3,$DS1,$DS2,$DS3,$DS2,$DS1,$DS2,$DS3,$DS2,
    $DS1,$DS3,$P2, $P3, $DS2,$DS2,$DS3,$DS1,$DS2,$DS3,$DS1,$P2, $P3, $DS1,$DS2,$DS3,
    $DS2,$P3, $P4, $P5, $P3, $DS1,$DS2,$DS3,$DS1,$P3, $P4, $P5, $P3, $DS2,$DS1,$DS2,
    $DS3,$P2, $P5, $P6, $P4, $P2, $DS2,$DS2,$DS2,$P2, $P5, $P6, $P4, $P2, $DS3,$DS1,
    $DS2,$DS1,$P3, $P4, $P3, $DS1,$DS2,$DS3,$DS3,$DS1,$P3, $P4, $P3, $DS1,$DS2,$DS3,
    $DS1,$DS2,$P2, $P3, $DS2,$DS3,$DS1,$DS2,$DS2,$DS3,$P2, $P3, $DS2,$DS3,$DS1,$DS2,
    $DS2,$DS3,$DS1,$DS2,$DS3,$DS2,$DS1,$DS2,$DS3,$DS2,$DS1,$DS2,$DS3,$DS2,$DS1,$DS3,
    $DS3,$DS2,$DS3,$DS1,$DS2,$DS3,$DS1,$P2, $P3, $DS1,$DS3,$DS2,$DS1,$DS3,$DS2,$DS1,
    $DS1,$DS3,$DS2,$DS3,$DS1,$DS2,$DS3,$P3, $P4, $P3, $DS2,$DS1,$DS3,$DS2,$DS3,$DS2,
    $DS2,$DS1,$DS3,$DS2,$P2, $P3, $DS2,$P2, $P5, $P4, $P2, $DS3,$DS2,$DS1,$DS2,$DS3,
    $DS3,$DS2,$DS1,$P3, $P4, $P5, $P3, $DS1,$P3, $P5, $P4, $P3, $DS1,$DS2,$DS3,$DS2,
    $DS2,$DS3,$DS2,$P2, $P5, $P6, $P4, $P2, $DS2,$P4, $P6, $P5, $P2, $DS3,$DS1,$DS3,
    $DS1,$DS2,$DS3,$P3, $P4, $P3, $DS2,$DS3,$DS3,$DS2,$P3, $P4, $P3, $DS2,$DS2,$DS1,
    $DS2,$DS1,$DS2,$DS2,$P2, $DS3,$DS1,$DS2,$DS2,$DS1,$DS3,$P2, $DS2,$DS1,$DS3,$DS2,
    $DS3,$DS2,$DS1,$DS3,$DS2,$DS2,$DS3,$DS1,$DS3,$DS2,$DS1,$DS3,$DS1,$DS2,$DS2,$DS3,
    $DS1,$DS3,$DS2,$DS1,$DS3,$DS1,$DS2,$DS3,$DS1,$DS3,$DS2,$DS1,$DS3,$DS1,$DS2,$DS1
)
$bmp = New-Object System.Drawing.Bitmap 16,16
for($i=0;$i-lt 256;$i++){$bmp.SetPixel($i%16,[math]::Floor($i/16),$orePixels[$i])}
SaveBmp $bmp "$base\blocks\budoh_ore.png"

# ---- budoh_block.png (16x16) ----
# Solid purple block like diamond block
$blkPixels = @(
    $P2, $P3, $P3, $P4, $P3, $P3, $P4, $P3, $P3, $P4, $P3, $P3, $P4, $P3, $P3, $P2,
    $P3, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P5, $P4, $P3,
    $P3, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P5, $P3,
    $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4,
    $P3, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P5, $P4, $P3,
    $P3, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P5, $P3,
    $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4,
    $P3, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P5, $P4, $P3,
    $P3, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P5, $P3,
    $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4,
    $P3, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P5, $P4, $P3,
    $P3, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P6, $P5, $P5, $P5, $P3,
    $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4,
    $P3, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P4, $P5, $P5, $P5, $P4, $P3,
    $P3, $P5, $P5, $P5, $P5, $P5, $P5, $P5, $P5, $P5, $P5, $P5, $P5, $P5, $P5, $P3,
    $P2, $P3, $P3, $P4, $P3, $P3, $P4, $P3, $P3, $P4, $P3, $P3, $P4, $P3, $P3, $P2
)
$bmp = New-Object System.Drawing.Bitmap 16,16
for($i=0;$i-lt 256;$i++){$bmp.SetPixel($i%16,[math]::Floor($i/16),$blkPixels[$i])}
SaveBmp $bmp "$base\blocks\budoh_block.png"

# ---- budoh.png (16x16) - gem item ----
$T = CA 0 0 0 0
$gemPixels = @(
    $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $P4, $P5, $P5, $P4, $P3, $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $P3, $P5, $P6, $P6, $P5, $P4, $P3, $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $P3, $P5, $P6, $P6, $P5, $P6, $P5, $P4, $P3, $T,  $T,  $T,  $T,
    $T,  $T,  $P3, $P4, $P5, $P5, $P4, $P4, $P5, $P6, $P5, $P4, $P3, $T,  $T,  $T,
    $T,  $T,  $P4, $P5, $P6, $P5, $P4, $P4, $P5, $P6, $P5, $P4, $P2, $T,  $T,  $T,
    $T,  $T,  $P4, $P5, $P5, $P4, $P3, $P3, $P4, $P5, $P5, $P4, $P2, $T,  $T,  $T,
    $T,  $T,  $P3, $P4, $P5, $P4, $P3, $P3, $P4, $P5, $P4, $P3, $P2, $T,  $T,  $T,
    $T,  $T,  $P3, $P4, $P4, $P3, $P2, $P2, $P3, $P4, $P4, $P3, $P2, $T,  $T,  $T,
    $T,  $T,  $P2, $P3, $P4, $P3, $P2, $P2, $P3, $P4, $P3, $P2, $P1, $T,  $T,  $T,
    $T,  $T,  $P2, $P3, $P3, $P2, $P2, $P2, $P3, $P3, $P2, $P2, $P1, $T,  $T,  $T,
    $T,  $T,  $P1, $P2, $P3, $P3, $P2, $P2, $P3, $P3, $P2, $P1, $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $P1, $P2, $P3, $P3, $P3, $P3, $P2, $P1, $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $P1, $P2, $P2, $P2, $P2, $P1, $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $P1, $P1, $P1, $P1, $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T
)
$bmp = New-Object System.Drawing.Bitmap 16,16
for($i=0;$i-lt 256;$i++){$bmp.SetPixel($i%16,[math]::Floor($i/16),$gemPixels[$i])}
SaveBmp $bmp "$base\items\budoh.png"

# ---- SWORD ----
$BRN = C 101 67 33   # brown handle
$BRL = C 139 90 43   # brown light
$GRY = C 100 100 100 # guard gray

$swordPixels = @(
    $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $P6, $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $P5, $P6, $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $P4, $P5, $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $P4, $P5, $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $T,  $T,  $P3, $P4, $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $T,  $P3, $P4, $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $P2, $P3, $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $P2, $P3, $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $GRY,$GRY,$GRY,$P2, $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $BRL,$BRN,$T,  $P2, $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $BRL,$BRN,$T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $BRL,$BRN,$T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $BRL,$BRN,$T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $BRN,$T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,
    $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T,  $T
)
$bmp = New-Object System.Drawing.Bitmap 16,16
for($i=0;$i-lt 256;$i++){$bmp.SetPixel($i%16,[math]::Floor($i/16),$swordPixels[$i])}
SaveBmp $bmp "$base\items\budoh_sword.png"

# --- Helper: create armor item sprite (generic purple shape) ----
function MakeArmorSprite([string]$type) {
    $bmp = New-Object System.Drawing.Bitmap 16,16
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear([System.Drawing.Color]::Transparent)

    $dark = [System.Drawing.SolidBrush]::new($P2)
    $mid  = [System.Drawing.SolidBrush]::new($P3)
    $lite = [System.Drawing.SolidBrush]::new($P4)
    $high = [System.Drawing.SolidBrush]::new($P5)

    switch ($type) {
        "helmet" {
            # Top arc
            $g.FillRectangle($mid, 2,3,12,2)
            $g.FillRectangle($lite,3,2,10,1)
            $g.FillRectangle($high,4,1,8,1)
            $g.FillRectangle($dark,2,5,2,3)
            $g.FillRectangle($dark,12,5,2,3)
            $g.FillRectangle($mid, 4,5,8,3)
            $g.FillRectangle($lite,5,5,6,1)
        }
        "chestplate" {
            $g.FillRectangle($mid, 2,1,12,2)
            $g.FillRectangle($lite,3,1,10,1)
            $g.FillRectangle($dark,2,3,2,10)
            $g.FillRectangle($dark,12,3,2,10)
            $g.FillRectangle($mid, 4,3,8,10)
            $g.FillRectangle($lite,5,4,6,8)
            $g.FillRectangle($high,6,5,4,6)
        }
        "leggings" {
            $g.FillRectangle($mid, 2,1,12,3)
            $g.FillRectangle($lite,3,1,10,2)
            $g.FillRectangle($dark,2,4,4,10)
            $g.FillRectangle($dark,10,4,4,10)
            $g.FillRectangle($mid, 5,4,3,10)
            $g.FillRectangle($mid, 8,4,2,10)
            $g.FillRectangle($lite,6,5,1,9)
            $g.FillRectangle($lite,9,5,1,9)
        }
        "boots" {
            $g.FillRectangle($dark,2,2,5,12)
            $g.FillRectangle($dark,9,2,5,12)
            $g.FillRectangle($mid, 3,3,3,10)
            $g.FillRectangle($mid, 10,3,3,10)
            $g.FillRectangle($lite,4,4,2,8)
            $g.FillRectangle($lite,10,4,2,8)
            $g.FillRectangle($mid, 2,12,6,2)
            $g.FillRectangle($mid, 8,12,6,2)
        }
    }

    $g.Dispose(); $dark.Dispose(); $mid.Dispose(); $lite.Dispose(); $high.Dispose()
    return $bmp
}

foreach ($armorType in @("helmet","chestplate","leggings","boots")) {
    $bmp = MakeArmorSprite $armorType
    SaveBmp $bmp "$base\items\budoh_$armorType.png"
}

# ---- Armor layer textures (64x32) ----
# Layer 1: head + body + boots
$layer1 = New-Object System.Drawing.Bitmap 64,32
$g1 = [System.Drawing.Graphics]::FromImage($layer1)
$g1.Clear([System.Drawing.Color]::Transparent)
$purpleBrush = [System.Drawing.SolidBrush]::new($P3)
$purpleDark   = [System.Drawing.SolidBrush]::new($P2)
$purpleLight  = [System.Drawing.SolidBrush]::new($P4)
# Head region (0,0 -> 32,16)
$g1.FillRectangle($purpleDark,  0,0,32,16)
$g1.FillRectangle($purpleBrush, 1,1,30,14)
$g1.FillRectangle($purpleLight, 2,2,28,12)
# Body region (16,16 -> 40,32) - rough approximation
$g1.FillRectangle($purpleDark,  16,16,24,16)
$g1.FillRectangle($purpleBrush, 17,17,22,14)
$g1.FillRectangle($purpleLight, 18,18,20,12)
# Leg/boots region (0,16 -> 16,32)
$g1.FillRectangle($purpleDark,  0,16,16,16)
$g1.FillRectangle($purpleBrush, 1,17,14,14)
$g1.FillRectangle($purpleLight, 2,18,12,12)
$g1.Dispose(); $purpleBrush.Dispose(); $purpleDark.Dispose(); $purpleLight.Dispose()
SaveBmp $layer1 "$base\models\armor\budoh_layer_1.png"

# Layer 2: leggings only
$layer2 = New-Object System.Drawing.Bitmap 64,32
$g2 = [System.Drawing.Graphics]::FromImage($layer2)
$g2.Clear([System.Drawing.Color]::Transparent)
$legBrush = [System.Drawing.SolidBrush]::new($P4)
$legDark  = [System.Drawing.SolidBrush]::new($P3)
$g2.FillRectangle($legDark,  0,16,16,16)
$g2.FillRectangle($legBrush, 1,17,14,14)
$g2.FillRectangle($legDark,  16,16,16,16)
$g2.FillRectangle($legBrush, 17,17,14,14)
$g2.Dispose(); $legBrush.Dispose(); $legDark.Dispose()
SaveBmp $layer2 "$base\models\armor\budoh_layer_2.png"

Write-Host "All textures generated successfully!"
