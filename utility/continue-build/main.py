#!/bin/python
import inotify.adapters
import subprocess

def main(path, cmd, pcwd):

    while True:
        i = inotify.adapters.InotifyTree('/home/pengzhan/Github/dlib-exper/')
        for event in i.event_gen():
            if event is not None:
                if (event[0].mask & inotify.constants.IN_MODIFY):
                    if (event[3].endswith('.swp')):
                        continue
                    print(event)

                    p = subprocess.Popen(["cmake", "--build", "."], cwd=pcwd)
                    p.wait()


if __name__ == "__main__":
    main("/home/pengzhan/Github/dlib-exper", "cmake --build .", "/home/pengzhan/Github/dlib-exper/examples/build")
