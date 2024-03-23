#!/usr/bin/env python3
import subprocess
import os

outputNames = ["DP-3-2", "DP-2-2", "DP-2-1", "HDMI-1"]

def screens():
    output = [
        l for l in subprocess.check_output(["xrandr"]).decode("utf-8").splitlines()
    ]
    return [l.split()[0] for l in output if " connected " in l]


for screen in screens():
    # print (screen)
    if screen in outputNames:
        execStr = """
            xrandr --output eDP-1 --primary --mode 1920x1200 --pos 0x840 --rotate normal \
            --output %s --mode 3840x2160 --pos 1920x0 --rotate normal
        """ % screen

        os.system(execStr)

