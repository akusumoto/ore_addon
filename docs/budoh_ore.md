# Core Feature 1: Budoh Ore

**AddOn Identifier**: `x051_ore_addon`
**Target Platform**: Bedrock (v1.21+)
**Language**: Japanese (in-game names will be localized to Japanese)

---

## 1. Item: Budoh (ブドー)
- **Identifier**: `x051_ore_addon:budoh`
- **Type**: Material (Item)
- **Visuals**: Purple color, like a diamond.

## 2. Block: Budoh Ore (ブドー鉱石 / 深層岩ブドー鉱石)
- **Identifier**: `x051_ore_addon:budoh_ore`
- **Properties**:
  - Drops 1x "Budoh" item by 90%, 2x "Budoh" item by 10% when broken.
  - Requires a pickaxe to break.
  - Generates specifically at the deepslate layer underground.
- **Visuals**: Purple color, like diamond ore.

## 3. Block: Budoh Block (ブドーブロック)
- **Identifier**: `x051_ore_addon:budoh_block`
- **Type**: Decor/Storage Block
- **Visuals**: Purple color, like a diamond block.
- **Recipe**: Crafted from 9 'Budoh' items.
  ```text
  B B B
  B B B
  B B B
  ```
  *(B = Budoh Item)*

## 4. Item: Budoh Sword (ブドーの剣)
- **Identifier**: `x051_ore_addon:budoh_sword`
- **Type**: Weapon (Sword)
- **Visuals**: Purple color, like a diamond sword.
- **Properties**:
  - **Attack Damage**: 10
- **Recipe**: Crafted from 2 'Budoh' items and 1 Stick.
  ```text
    B
    B
    S
  ```
  *(B = Budoh Item, S = Stick)*

## 5. Armor Set: Budoh Armor Pieces
- **Type**: Wearable Armor
- **Visuals**: Purple color, like diamond armor.

### Budoh Helmet (ブドーのヘルメット)
- **Identifier**: `x051_ore_addon:budoh_helmet`
- **Properties**:
  - **Defense**: 3
- **Recipe**: Crafted from 5 'Budoh' items.
  ```text
  B B B
  B   B
  ```

### Budoh Chestplate (ブドーのチェストプレート)
- **Identifier**: `x051_ore_addon:budoh_chestplate`
- **Properties**:
  - **Defense**: 8
- **Recipe**: Crafted from 8 'Budoh' items.
  ```text
  B   B
  B B B
  B B B
  ```

### Budoh Leggings (ブドーのレギンス)
- **Identifier**: `x051_ore_addon:budoh_leggings`
- **Properties**:
  - **Defense**: 6
- **Recipe**: Crafted from 7 'Budoh' items.
  ```text
  B B B
  B   B
  B   B
  ```

### Budoh Boots (ブドーのブーツ)
- **Identifier**: `x051_ore_addon:budoh_boots`
- **Properties**:
  - **Defense**: 3
- **Recipe**: Crafted from 4 'Budoh' items.
  ```text
  B   B
  B   B
  ```
