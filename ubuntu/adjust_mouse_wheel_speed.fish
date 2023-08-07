#!/usr/bin/env fish

# Install imwheel
# ===============
sudo apt install imwheel

# Select new value for mouse speed and write it to ~/.imwheelrc
# =============================================================
if not test -f ~/.imwheelrc

echo >~/.imwheelrc "\
\".*\"
None,      Up,   Button4, 1
None,      Down, Button5, 1
Control_L, Up,   Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L,   Up,   Shift_L|Button4
Shift_L,   Down, Shift_L|Button5"

end

set fish_trace 1 CURRENT_VALUE (rg 'Button4, (.*)' --replace '$1' --only-matching  ~/.imwheelrc)
echo "Current speed: $CURRENT_VALUE"

set fish_trace 1 NEW_VALUE (zenity --scale --window-icon=info --ok-label=Apply --title="Wheelies" --text "Mouse wheel speed:" --min-value=1 --max-value=100 --value="$CURRENT_VALUE" --step 1)

if test "$NEW_VALUE" = ""
  exit 0
end

sed -i "s/\($TARGET_KEY *Button4, *\).*/\1$NEW_VALUE/" ~/.imwheelrc # find the string Button4, and write new value.
sed -i "s/\($TARGET_KEY *Button5, *\).*/\1$NEW_VALUE/" ~/.imwheelrc # find the string Button5, and write new value.

cat ~/.imwheelrc
imwheel -kill

# Setup systemd service to start imwheel
# ======================================
mkdir -p ~/.config/systemd/user

echo >~/.config/systemd/user/imwheel.service "\
[Unit]
Description=IMWheel
Wants=display-manager.service
After=display-manager.service

[Service]
Type=simple
ExecStartPre=-/bin/sleep 5
Environment=XAUTHORITY=%h/.Xauthority
ExecStart=/usr/bin/imwheel -d
ExecStop=/usr/bin/pkill imwheel
RemainAfterExit=yes

[Install]
WantedBy=graphical-session.target"

# Start the imwheel service now
systemctl --user --now enable imwheel.service
