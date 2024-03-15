# Pico Debug Debian

How to configure Rasperry Pi Debug Probe in VSCode (C/C++).
Its a pain to configure on Linux.
It took me around 5 hours to get it runnning.

# Requirements

- Successfully compiled a sample project e.g. "blink"

Further information:  
https://datasheets.raspberrypi.com/pico/getting-started-with-pico.pdf
https://datasheets.raspberrypi.com/pico/pico-datasheet.pdf
https://datasheets.raspberrypi.com/pico/raspberry-pi-pico-c-sdk.pdf

- Debug Probe setup and running

https://github.com/raspberrypi/debugprobe/releases
https://www.raspberrypi.com/products/debug-probe/
https://raspberrypi.com/documentation/microcontrollers/debug-probe.html


# VSCode Plugins

- ms-vscode.cpptools-extension-pack
- ms-vscode.cmake-tools
- marus25.cortex-debug

# Instructions

Make sure follow packages are installed
```bash
apt install automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev
apt install usbutils libhidapi-dev gdb-multiarch
apt install python3 python3-pip python3-tk  # Project-Generator
```

Set user rights
```bash
usermod -aG dialout plugdev <USER>
id -nG <USER>
reboot
```

Install OpenOCD
Important: Use the `./configure` here described.
```bash
# if it already exists `make clean` or delete folder
git clone https://github.com/raspberrypi/openocd.git
cd openocd
./bootstrap
./configure --enable-picoprobe --enable-cmsis-dap --disable-werror
make -j4
sudo make install
```

Check the debug probe, this must be displayed as "CMSIS-DAP". Otherwise upgrade firmware.
```bash
lsusb | grep -i debug

# Output should look like this:
Bus 001 Device 004: ID 2e8a:000c Raspberry Pi Debug Probe (CMSIS-DAP)
```


Clone this project, or generate a new one
```bash
# This example project
git clone <placeholder>
# 
git clone https://github.com/raspberrypi/pico-project-generator.git
cd pico-project-generator
./pico_project.py --gui
# Make sure you select Debugger: "CMSIS-DAP Debug Probe"
```

Build the Project
Run the debugger.

# Issues

`<Placeholder>`

