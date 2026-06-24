#!/bin/bash
# =============================================
# Install custom Russian (phonetic WinKeys) layout
# =============================================

set -e

CUSTOM_NAME="ru_custom"
LAYOUT_NAME="phonetic_winkeys_custom"

echo "Creating custom XKB layout: Russian (phonetic WinKeys custom)"

# Create user xkb directory
mkdir -p ~/.config/xkb/symbols
mkdir -p ~/.config/xkb/keymap

# Create the symbols file
cat > ~/.config/xkb/symbols/$CUSTOM_NAME << 'EOF'
default partial alphanumeric_keys
xkb_symbols "phonetic_winkeys_custom" {
    include "ru(phonetic)"

    name[Group1]= "Russian (phonetic WinKeys custom)";

    // Your custom key mappings
    key <TLDE> { [ Cyrillic_io, Cyrillic_IO ] };
    key <LatX> { [ Cyrillic_ha, Cyrillic_HA ] };
    key <LatH> { [ Cyrillic_che, Cyrillic_CHE ] };
    key <AE12> { [ Cyrillic_softsign, Cyrillic_hardsign ] };
    key <LatW> { [ Cyrillic_sha, Cyrillic_SHA ] };
    key <AD11> { [ Cyrillic_yu, Cyrillic_YU ] };
    key <AD12> { [ Cyrillic_zhe, Cyrillic_ZHE ] };
    key <LatV> { [ Cyrillic_ve, Cyrillic_VE ] };
    key <LSGT> { [ Cyrillic_shcha, Cyrillic_SHCHA ] };
};
EOF

echo "Symbols file created at ~/.config/xkb/symbols/$CUSTOM_NAME"

# Create a helper script to load the layout
cat > ~/.local/bin/load-russian-custom.sh << 'EOF'
#!/bin/bash
# Quick load custom Russian phonetic layout
setxkbmap -I"$HOME/.config/xkb" -layout $CUSTOM_NAME -variant phonetic_winkeys_custom -option ""
echo "Custom Russian (phonetic WinKeys) layout loaded."
EOF

chmod +x ~/.local/bin/load-russian-custom.sh

echo "Helper script created: ~/.local/bin/load-russian-custom.sh"
echo ""
echo "=== How to use ==="
echo "1. Run the layout once:"
echo "   load-russian-custom.sh"
echo ""
echo "2. Add it to GNOME Settings:"
echo "   Go to Settings → Keyboard → Input Sources → + → Russian →"
echo "   (You may need to log out/in or restart GNOME Shell (Alt+F2 → r) for it to appear)"
echo ""
echo "3. For permanent auto-load, add this to Startup Applications:"
echo "   ~/.local/bin/load-russian-custom.sh"
echo ""
echo "Done!"
