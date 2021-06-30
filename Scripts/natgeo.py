#!/usr/bin/python

try:
    # For Python 3.0 and later
    from urllib.request import urlopen
except ImportError:
    # Fall back to Python 2's urllib2
    from urllib2 import urlopen

from bs4 import BeautifulSoup
import os

import socket

REMOTE_SERVER = "www.google.com"


def is_connected():
    try:
        host = socket.gethostbyname(REMOTE_SERVER)
        socket.create_connection((host, 80), 2)
        return True
    except:
        pass
    return False


def main():

    while not is_connected():
        print("waiting for connection...")

    webpage = urlopen(
        "https://www.nationalgeographic.com/photography/photo-of-the-day/"
    ).read()
    # print(webpage)
    soup = BeautifulSoup(webpage, "html.parser")

    for tag in soup.find_all("meta"):
        if tag.get("property", None) == "og:image":
            image = tag.get("content", None)
        elif tag.get("property", None) == "og:title":
            title = tag.get("content", None)

    title = (title + ".jpg").replace(" ", "_")

    os.system("curl --output %s %s" % ("~/Pictures/NatGeo/" + title, image))

    # os.system('feh --bg-fill %s' % "~/Pictures/NatGeo/" + title)
    os.system("wal -i %s" % "~/Pictures/NatGeo/" + title)

    # -scale 10% -scale 1000%

    os.system(
        "convert -gravity center -scale 3840x2416 %s /usr/share/pixmaps/lock_screen.png"
        % ("~/Pictures/NatGeo/" + title)
    )

    os.system("sh /home/alex/Scripts/colors.sh")


if __name__ == "__main__":
    main()
