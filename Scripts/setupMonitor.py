#!/usr/bin/env python3
import subprocess
import os


def screens():
    output = [
        l for l in subprocess.check_output(["xrandr"]).decode("utf-8").splitlines()
    ]
    return [l.split()[0] for l in output if " connected " in l]


for screen in screens():
    print (screen)
    if screen == "DP1-2":
        os.system("xra")
    if screen == "DP2-2" or screen == "DP2" or screen == "DP-1":
        os.system("setupMonitor")

