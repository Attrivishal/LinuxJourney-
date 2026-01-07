🏗️ CHAPTER 3: Linux Architecture
Simplified View:

User → Applications → Shell → Kernel → Hardware
                ↓
            Libraries


Detailed Components:

1. Kernel (The Brain)
bash
# Controls everything - the core of Linux
# Types: Monolithic (Linux), Microkernel (MacOS)

# Check kernel info:
uname -a                     # Kernel version
cat /proc/version           # Detailed info
2. Shell (Command Interpreter)
bash
# Your interface to the kernel
# Types: Bash (most common), Zsh, Fish

# Check your shell:
echo $SHELL                 # Show current shell
ps -p $$                   # Process ID of shell
3. System Libraries
bash
# Common functions for applications
# Example: glibc (GNU C Library)

# Location:
ls -l /lib/x86_64-linux-gnu/libc*

4. Hardware Layer
# Physical components managed by kernel
# Accessed through device drivers



Important Directories Explained:
bash
/                 # Root - Starting point
├── /bin          # Essential binaries (ls, cp, mkdir)
├── /etc          # Configuration files
├── /home         # User home directories
├── /var          # Variable data (logs, databases)
│   └── /var/log  # System logs
├── /tmp          # Temporary files (cleared on reboot)
├── /usr          # User programs
├── /boot         # Boot files
├── /dev          # Device files
└── /proc         # Virtual filesystem (process info)
