#!/usr/bin/env python3


import json
import os
import sys


def install(quiet):
    with open(".rgdot.json", "r") as f:
        files  = json.load(f)
        files = files["files"]
    for i in files:
        path = os.path.expanduser(i["path"])
        path_to_symlink = os.path.expanduser(i["path_to_symlink"])
        os.symlink(path, path_to_symlink)
        if quiet == False :
            print("   \033[32m\033[1mCreated\033[0m symlink '{}' -> '{}'".format(path, path_to_symlink))


def uninstall(quiet):
    with open(".rgdot.json", "r") as f:
        files  = json.load(f)
        files = files["files"]
    for i in files:
        path_to_symlink = os.path.expanduser(i["path_to_symlink"])
        os.remove(path_to_symlink)
        if quiet == False:
            print("   \033[32m\033[1mRemoved\033[0m symlink '{}'".format(path_to_symlink))


def main():
    action = sys.argv[1]
    if action == "install":
        install(False)
    elif action == "uninstall":
        uninstall(False)
    else:
        print("Usage: python installer.py [install/uninstall]")


if __name__=="__main__":
    main()
