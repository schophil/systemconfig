function @backlights
  sudo sh -c "echo $argv > /sys/devices/platform/thinkpad_acpi/leds/tpacpi::kbd_backlight/brightness"
end
