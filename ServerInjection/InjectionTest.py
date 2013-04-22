#!/usr/bin/python


import os
import re
import banner, footer, amazon, popup

INSERT_AD = re.compile ('(?P<pre>.*<\s*HTML[^<]*>)(?P<post>.*)', re.IGNORECASE | re.MULTILINE | re.DOTALL)

#body = "<body><h1 class='parseasinTitle '><span id='btAsinTitle'  >Wondfo Pregnancy Test Strips, 25-count</span></body>"

with open ("input.html", "r") as myfile:
    body=myfile.read().replace('\n', '')

tmp = INSERT_AD.match(body)

print tmp

pre = tmp.group('pre')
post = tmp.group('post')

original = open("original.html", "w")
mod = open("mod.html", "w")

original.write(pre + post)
mod.write( pre + banner.get("this")  + popup.get(body) + footer.get("this") + post)

amazon.get(body)

