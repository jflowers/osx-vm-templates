#!/bin/sh

/usr/sbin/softwareupdate --schedule off

# Get and install Xcode CLI tools
OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')

[ "$OSX_VERS" -eq 9 ] && DMGURL=https://nexus.vistacore.us/nexus/content/repositories/filerepo/com/apple/xcode/command_line_tools_os_x_mavericks/5.0.2/command_line_tools_os_x_mavericks-5.0.2.dmg
[ "$OSX_VERS" -eq 7 ] && DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_xcode_os_x_lion_april_2013.dmg
[ "$OSX_VERS" -eq 8 ] && DMGURL=http://devimages.apple.com/downloads/xcode/command_line_tools_for_osx_mountain_lion_april_2014.dmg

TOOLS=clitools.dmg
curl "$DMGURL" -o "$TOOLS"
TMPMOUNT=`/usr/bin/mktemp -d /tmp/clitools.XXXX`
hdiutil attach "$TOOLS" -mountpoint "$TMPMOUNT"
installer -pkg "$(find $TMPMOUNT -name '*.mpkg')" -target /
hdiutil detach "$TMPMOUNT"
rm -rf "$TMPMOUNT"
rm "$TOOLS"
exit
