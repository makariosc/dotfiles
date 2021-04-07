#/bin/bash
xrandr > /dev/null

intern=eDP-1
extern=HDMI-1

function activateExternHDMI {
	/usr/bin/xrandr --output "$extern" --auto --above "$intern" #--left-of "$intern" --rotate left
	/usr/bin/xrandr --output "$intern" #--pos 1080x1225
	EXT=TRUE
}

function deactivateExternHDMI {
	/usr/bin/xrandr --output "$extern" --off
	EXT=FALSE
}

function HDMIActive {
	[[ $EXT = "TRUE" ]]
}

function HDMIConnected {
	! /usr/bin/xrandr | grep "$extern disconnected"
}

if HDMIConnected
then
	activateExternHDMI
	sudo -u maki feh  --bg-fill /home/maki/Pictures/bg/20-Stacked-Macau.jpg --bg-fill /home/maki/Pictures/bg/The-Grid-III-Stacked-Hong-Kong-Peter-Stewart-Australia.jpg
else
	deactivateExternHDMI
	sudo -u maki feh --bg-fill /home/maki/Pictures/bg/20-Stacked-Macau.jpg
fi

