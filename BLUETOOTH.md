# Bluetooth Issues

Yes, you installed LMDE without checking whether bluetooth works, you're an
idiot, but you *did* find a fix.

## The issue

In the system tray, you'd right click the Bluetooth icon and click
`Turn Bluetooth On`, but this would take the Bluetooth icon from the system
tray, and attempting to open the app manually from `System Settings`, it would
immediately crash. It just did not want to open.

When you'd check `System Reports`, the `System information` tab would list
effectively nothing for bluetooth, almost as if it wasn't plugged in at all.

Running `sudo systemctl status bluetooth` would show a bunch of errors, similar
to [this Reddit comment](https://www.reddit.com/r/archlinux/comments/yu9az9/bluetooth_errors_since_2_days_ago/iznh0yv/).

## The fix

Open `/etc/bluetooth/main.conf` and set `Experimental=true`.

You may need to run `sudo systemctl restart bluetooth`

You may also need to run `sudo modprobe -r btusb && sudo modprobe btusb`
