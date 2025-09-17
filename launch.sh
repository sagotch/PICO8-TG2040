#!/bin/sh

LOG_FILE="/mnt/SDCARD/System/log/pico8.log"

PICO8_DIR=/mnt/SDCARD/Apps/PICO-8

# Provide libraries required by pico8_dyn
export LD_LIBRARY_PATH=$PICO8_DIR/lib

# Only suitable video backend is
export SDL_VIDEODRIVER=fbcon

$PICO8_DIR/pico8_dyn -root_path $PICO8_DIR/carts/ -splore > $LOG_FILE 2>&1
