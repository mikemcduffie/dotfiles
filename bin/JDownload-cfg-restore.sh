#!/usr/bin/env bash

# merge/ovewrite my JDownloader 2 settings (sorted by key, pretty print)

JDFOLDER=$(fd org.jdownloader.settings.GraphicalUserInterfaceSettings.json -p /Applications -x echo {//})


cat "$JDFOLDER/org.jdownloader.settings.GraphicalUserInterfaceSettings.json" |\
jq -S '. |= . + {
   "bannerenabled" : false,
   "premiumalertetacolumnenabled" : false,
   "premiumalertspeedcolumnenabled" : false,
   "premiumalerttaskcolumnenabled" : false,
   "premiumdisabledwarningflashenabled" : false,
   "premiumexpirewarningenabled" : false,
   "specialdealoboomdialogvisibleonstartup" : false,
   "specialdealsenabled" : false,
   "statusbaraddpremiumbuttonvisible" : false,
   "updatebuttonflashingenabled": false,
   "clipboardmonitored": false,
   "myjdownloaderviewvisible": false,
}' > "/Applications/JDownloader 2.0/cfg/temp.json" \
&& mv "/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json" \
"/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json.old" \
&& mv "/Applications/JDownloader 2.0/cfg/temp.json" "/Applications/JDownloader 2.0/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json"
#  ^^^ write update to temp.json, backup current cfg to .old, rename temp to cfg

