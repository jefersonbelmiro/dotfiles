#!/usr/bin/env python3

import os
import signal
import subprocess
import random
import glob
import time 
import argparse

def parse_args() : 
    parser = argparse.ArgumentParser(description='Random update wallpaper')
    parser.add_argument('path', help='path with wallpaper files')
    parser.add_argument('--delay', default=900, type=int, help='delay for update')
    parser.add_argument('--screens', default=1, type=int, help='screens to set wallpaper')
    return parser.parse_args()

def die_mother_fucker_die(proc) :
    if proc.poll() == None:
        os.killpg(os.getpgid(proc.pid), signal.SIGTERM) 

def create_cmd(files, screens) :
    cmd = ['/usr/bin/env', 'feh']
    for index in random.sample(range(0, len(files)), screens) :
        cmd.append('--bg-fill')
        cmd.append(files[index])
    return cmd

def create_process(cmd) :
    return subprocess.Popen(
        cmd, 
        stdout=subprocess.PIPE, 
        shell=False,
        preexec_fn=os.setsid
    ) 

def get_files(path) :
    return glob.glob(os.path.realpath(path) + '/*')

def main() :
    args = parse_args()
    files = get_files(args.path)
    while True: 
        cmd = create_cmd(files, args.screens)
        proc = create_process(cmd)
        time.sleep(args.delay)
        die_mother_fucker_die(proc)

if __name__ == "__main__":
    main()
