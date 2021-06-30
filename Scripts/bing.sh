#!/bin/sh

DATE=`date +%Y-%m-%d`

urlpath=$( \
curl "https://www.bing.com/HPImageArchive.aspx?format=rss&idx=0&n=1&mkt=en-US" \
| xmllint --xpath "/rss/channel/item/link/text()" - \
| sed 's/1366x768/1920x1080/g' \
)

echo "https://www.bing.com$urlpath"

curl --output ~/Pictures/Bing/$DATE.jpg "https://www.bing.com$urlpath"

convert -scale 3840x2160 ~/Pictures/Bing/$DATE.jpg /usr/share/backgrounds/lightdm.png

wal -i ~/Pictures/Bing/$DATE.jpg

sh /home/alex/Scripts/codeColors.sh

#test this with 'msgcat --color=test'