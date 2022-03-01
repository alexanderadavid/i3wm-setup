#!/usr/bin/env python3
import subprocess
import os

outputNames = ["DP-3-2", "DP-2-2", "DP-2-1"]

def screens():
    output = [
        l for l in subprocess.check_output(["xrandr"]).decode("utf-8").splitlines()
    ]
    return [l.split()[0] for l in output if " connected " in l]


for screen in screens():
    # print (screen)
    if screen in outputNames:
        execStr = """
            xrandr --output %s --off
        """ % screen

        os.system(execStr)

