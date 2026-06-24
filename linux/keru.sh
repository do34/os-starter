#!/bin/bash
# =============================================
# Custom Russian Phonetic WinKeys variant for GNOME Wayland
# =============================================

set -e

echo "=== Installing custom Russian (phonetic WinKeys custom) ==="

mkdir -p ~/.config/xkb/symbols
mkdir -p ~/.config/xkb/rules

# 1. Custom symbols file (separate file = safer)
cat > ~/.config/xkb/symbols/ru_phonetic_winkeys_custom << 'EOF'
default partial alphanumeric_keys
xkb_symbols "phonetic_winkeys_custom" {
    include "ru(phonetic)"

    name[Group1] = "Russian (phonetic WinKeys custom)";

    // Your custom mappings
    key <TLDE> { [ Cyrillic_io,       Cyrillic_IO       ] };
    key <LatX> { [ Cyrillic_ha,       Cyrillic_HA       ] };
    key <LatH> { [ Cyrillic_che,      Cyrillic_CHE      ] };
    key <AE12> { [ Cyrillic_softsign, Cyrillic_hardsign ] };
    key <LatW> { [ Cyrillic_sha,      Cyrillic_SHA      ] };
    key <AD11> { [ Cyrillic_yu,       Cyrillic_YU       ] };
    key <AD12> { [ Cyrillic_zhe,      Cyrillic_ZHE      ] };
    key <LatV> { [ Cyrillic_ve,       Cyrillic_VE       ] };
    key <LSGT> { [ Cyrillic_shcha,    Cyrillic_SHCHA    ] };
};
EOF

echo "✓ Symbols file created"

# 2. Rules (append style)
cat > ~/.config/xkb/rules/evdev << 'EOF'
! include %S/evdev

! variant
  phonetic_winkeys_custom   ru: Russian (phonetic WinKeys custom)
EOF

echo "✓ Rules updated"

# 3. evdev.xml for GNOME menu visibility
cat > ~/.config/xkb/rules/evdev.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xkbConfigRegistry SYSTEM "xkb.dtd">
<xkbConfigRegistry version="1.1">
  <layoutList>
    <layout>
      <configItem>
        <name>ru</name>
      </configItem>
      <variantList>
        <variant>
          <configItem>
            <name>phonetic_winkeys_custom</name>
            <description>Russian (phonetic WinKeys custom)</description>
          </configItem>
        </variant>
      </variantList>
    </layout>
  </layoutList>
</xkbConfigRegistry>
EOF

echo "✓ GUI visibility file created"

# 4. Helper script
mkdir -p ~/.local/bin
cat > ~/.local/bin/load-russian-custom.sh << 'EOF'
#!/bin/bash
# This may not always work on Wayland, but useful for testing
setxkbmap -I"$HOME/.config/xkb" -layout ru -variant phonetic_winkeys_custom 2>/dev/null || \
echo "Layout configured via GNOME Settings (recommended on Wayland)"
EOF

chmod +x ~/.local/bin/load-russian-custom.sh

echo ""
echo "=== Installation finished! ==="
echo ""
echo "Now do this:"
echo "1. Log out and log back in (or restart GNOME Shell: Alt+F2 → r → Enter)"
echo "2. Go to Settings → Keyboard → Input Sources → +"
echo "3. Search for 'Russian' — you should see **Russian (phonetic WinKeys custom)**"
echo "4. Add it"
echo ""
echo "After adding it in Settings, it will work natively on Wayland."
echo ""
echo "Test command (if you want):"
echo "   load-russian-custom.sh"

