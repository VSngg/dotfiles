#!/bin/sh
man -k , | rofi -dmenu | awk '{print $1}' | xargs -r man -Tpdf | zathura -

