import json
import re
import sys
import time
import os

dark = os.environ["color0"]
darkish = os.environ["color1"]
light = os.environ["color7"]
medium = os.environ["color12"]
alt = os.environ["color2"]
border = os.environ["color3"]

fileName = "/home/alex/.config/Code/User/settings.json"
wb = "workbench.colorCustomizations"

with open(fileName, "r+") as f:
    fString = f.read()
    fString = re.sub(r"\\\n", "", fString)
    fString = re.sub(r"//.*\n", "\n", fString)

    data = json.loads(fString)
    for color in data[wb]:
        if color == "editorGroup.border":
            data[wb][color] = dark
        elif color == "tab.activeBorder":
            data[wb][color] = medium
        elif color == "sideBar.border":
            data[wb][color] = border
        elif color == "sideBar.foreground":
            data[wb][color] = light
        elif color == "statusBar.background":
            data[wb][color] = alt
        elif color == "statusBar.noFolderBackground":
            data[wb][color] = alt
        elif color == "statusBar.foreground":
            data[wb][color] = dark
        elif color == "statusBar.noFolderForeground":
            data[wb][color] = dark
        elif color == "tab.inactiveForeground":
            data[wb][color] = light
        elif color == "statusBar.foreground":
            data[wb][color] = dark
        elif color == "statusBar.border":
            data[wb][color] = dark
        elif color == "peekView.border":
            data[wb][color] = border
    f.seek(0)
    json.dump(data, f, indent=4)
    f.truncate()
