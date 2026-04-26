case $(sysctl -n kern.memorystatus_vm_pressure_level) in 1) echo " ";; 2) echo "MEM ⚠️";; 4) echo "MEM 🚨";; esac
