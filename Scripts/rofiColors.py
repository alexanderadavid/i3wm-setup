import fileinput
import os
import sys

dark = os.environ["color0"]
darkish = os.environ["color1"]
light = os.environ["color7"]
medium = os.environ["color12"]
alt = os.environ["color2"]
border = os.environ["color3"]

path = "/home/alex/.config/rofi/config.rasi"

for line in fileinput.input(path, inplace=True):
    if len(line.split()) > 0 and line.split()[0] == "background:":
        sys.stdout.write("\tbackground:\t\t\t\t\t %s;\n" % dark)
    else:
        sys.stdout.write("%s" % (line))
