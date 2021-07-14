#!/usr/bin/python

import json
from subprocess import check_output
import os

out = check_output(["i3-msg", "-t", "get_workspaces"])

workspaces = json.loads(out.decode("utf-8"))
focused_workspace = filter(lambda x: x["focused"], workspaces)
print (workspaces[0]["output"])
