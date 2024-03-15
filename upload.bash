 #!/bin/bash
 # Uploads your Project to RP2040 through PicoProbe

file="pdd.elf"

openocd -f interface/cmsis-dap.cfg -f target/rp2040.cfg -c "program build/$file verify reset exit"