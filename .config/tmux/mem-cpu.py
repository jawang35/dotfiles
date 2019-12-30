#!/usr/bin/env python3
import argparse
import os


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('colors', type=str, nargs=3)
    colors = parser.parse_args().colors

    command = 'tmux-mem-cpu-load -i1 -g0 -m2 -t0'
    stats = os.popen(command).readlines()[0].split()
    mem = float(stats[0][:-1])
    cpu = float(stats[1][:-1])

    if mem < 30:
        mem_color = colors[0]
    elif mem < 80:
        mem_color = colors[1]
    else:
        mem_color = colors[2]

    if cpu < 30:
        cpu_color = colors[0]
    elif cpu < 80:
        cpu_color = colors[1]
    else:
        cpu_color = colors[2]

    print(f'#[fg={mem_color}]M:{mem:3.0f}%#[default] '
          f'#[fg={cpu_color}]C:{cpu:3.0f}%#[default]')


if __name__ == '__main__':
    main()
