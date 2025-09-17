# Native PICO-8 for TG2040

This has been tested with quark OS and PICO-8 v0.2.7

## Clone this repo

`git clone`

## Use a raspbian chroot in order to extract some PICO-8 dependencies

```
sudo apt install qemu-user-static debootstrap
sudo debootstrap --arch=armhf --foreign bullseye /tmp/raspbian-rootfs http://raspbian.raspberrypi.org/raspbian
sudo cp /usr/bin/qemu-arm-static /tmp/raspbian-rootfs/usr/bin/
sudo chroot /tmp/raspbian-rootfs /debootstrap/debootstrap --second-stage
cp /tmp/raspbian-rootfs/lib/ld-linux-armhf.so.3 ./lib
cp /tmp/raspbian-rootfs/usr/lib/arm-linux-gnueabihf/libm.so.6 ./lib
cp /tmp/raspbian-rootfs/usr/lib/arm-linux-gnueabihf/libc.so.6 ./lib
```

## Compile SDL2-TG2040

- See https://github.com/sagotch/SDL2-TG2040
- Have a look at `README-TG2040.MD` and compile `libSDL2-2.0.so.0.2600.5` file.
- Copy the resulting file as `./lib/libSDL2-2.0.so.0`

## Add PICO-8 interpreter

- Download `raspi` release of pico-8
- Extract `pico8_dyn`, `pico8.dat` and `lexaloffle-pico8.png` file at the root of this repo
- Patch `pico8_dyn` in order to match the right interpreter
  ```
  patchelf --set-interpreter "/mnt/SDCARD/Apps/PICO-8/lib/ld-linux-armhf.so.3" ./pico8_dyn
  ```

## Add some carts

Splore is not fully working (yet?), but carts added in `./carts` will be listed.

## Copy files on the device

Copy this directory (without the `.git` directory).

## Run the app

PICO-8 will be listed in the Apps section of quark OS.