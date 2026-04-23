case $(sysctl -n kern.memorystatus_vm_pressure_level) in 2) echo "MEM ⚠️";; 4) echo "MEM 🚨";; esac
