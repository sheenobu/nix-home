import json
import sys
import os

f = open(sys.argv[1])
out = sys.argv[2]
data = json.load(f)

for key in data["files"]:
    val = data["files"][key]
    try:
        os.makedirs(out + "/" + os.path.dirname(key))
    except:
        print "ignoring error"

    if type(val) == str or type(val) == unicode:
        print "Symlinking " + out + "/" + key
        os.symlink(val, out + "/" + key)

    if type(val) == dict:
        print "Creating file " + out + "/" + key
        with open(out + "/" + key, "w") as f:
            f.write(val["content"].encode('UTF-8'))

