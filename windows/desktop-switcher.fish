#!/usr/bin/env fish

set WINDOWS_HOME_DIR (wslpath (wslvar USERPROFILE))
set DESKTOP_SWITCHER_DIR "$WINDOWS_HOME_DIR/desktop-switcher"
set DESKTOP_SWITCHER_WINPATH (wslvar USERPROFILE)"\\desktop-switcher\\desktop_switcher.ahk"

echo "Cloning desktop-switcher repo to $DESKTOP_SWITCHER_DIR"
git clone git@github.com:pmb6tz/windows-desktop-switcher.git $DESKTOP_SWITCHER_DIR

echo "Copying over custom config"
cp --force user_config.ahk $DESKTOP_SWITCHER_DIR/

echo "Run the following commands in an Administrator powershell prompt."
echo "It will register a scheduled task to invoke the script at logon."
echo "You can see scheduled tasks in the Task Scheduler app."
echo
echo "\$A = New-ScheduledTaskAction -Execute \"$DESKTOP_SWITCHER_WINPATH\""
echo '$T = New-ScheduledTaskTrigger -AtLogon'
echo '$P = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest'
echo '$S = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit 0'
echo '$D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S'
echo 'Register-ScheduledTask WindowsDesktopSwitcher -InputObject $D'
