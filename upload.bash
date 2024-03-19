 #!/bin/bash
 # Uploads your Project to RP2040 through PicoProbe

regex='^build\/.+.elf$'

files=$(find build -maxdepth 1  -regex "$regex" -printf "%f\n")
files_count=$(echo -n "$files" | grep -c '^')

if [[ $files_count -gt 1 ]]; then
  echo "Multiple files found:"
  echo "$files"
  echo "Upload canceled!"
elif [[ $files_count -lt 1 ]]; then
  echo "No files found to upload"
  echo "example: build/*.elf"
else
  openocd -f interface/cmsis-dap.cfg -f target/rp2040.cfg -c "adapter speed 5000" -c "program build/$files verify reset exit" 
fi