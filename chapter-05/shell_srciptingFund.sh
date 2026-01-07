📜 CHAPTER 5: Shell Scripting Fundamentals

1. What is Shell Scripting?
Shell: Command interpreter

Script: Sequence of commands in a file

Shell Script: Automates repetitive tasks

2. Basic Script Structure:
bash
#!/bin/bash
# ===================================
# Script: system_check.sh
# Author: Your Name
# Date: 2024-01-01
# Description: Checks system health
# Usage: ./system_check.sh
# ===================================

# Main script starts here
echo "Starting system check..."
echo "Date: $(date)"
echo "User: $(whoami)"
3. Making Scripts Executable:
chmod - Change Permissions
bash
# Permission numbers:
# r=4, w=2, x=1
# User Group Others
#  u   g    o

chmod +x script.sh          # Add execute permission
chmod 755 script.sh         # rwxr-xr-x (owner:rwx, others:r-x)
chmod 700 script.sh         # rwx------ (owner only)
chmod 644 script.sh         # rw-r--r-- (readable by all)

# Check permissions:
ls -l script.sh
4. Debugging Scripts:
set -x - Debug Mode
bash
#!/bin/bash
set -x  # Shows each command before execution

echo "Debug mode is ON"
ls -l
echo "Debug mode example"

# Output shows + before each command:
# + echo 'Debug mode is ON'
# + ls -l
set -e - Exit on Error
bash
#!/bin/bash
set -e  # Script stops if any command fails

echo "Step 1"
ls /nonexistent_folder  # This will fail
echo "Step 2"           # Never executes
set -o pipefail
bash
#!/bin/bash
set -o pipefail  # Pipeline fails if any part fails

# Without: false | true → success
# With: false | true → failure

ls /nonexistent | echo "test"  # Fails with pipefail
5. Essential Commands in Scripts:
ps - Process Status
bash
ps                         # Current shell processes
ps aux                     # ALL processes (detailed)
ps -ef                     # Alternative format
ps -u username             # User's processes
ps aux --sort=-%mem        # Sort by memory usage
ps aux | grep "nginx"      # Find specific process
grep - Search Text
bash
grep "error" logfile.txt           # Find "error" in file
grep -i "error" logfile.txt        # Case-insensitive
grep -r "TODO" /home/projects/     # Recursive search
grep -v "success" logfile.txt      # Invert match
grep -c "pattern" file.txt         # Count occurrences
grep -E "error|fail|critical"      # Multiple patterns

# Common patterns:
grep "^Start" file.txt      # Lines starting with "Start"
grep "end$" file.txt       # Lines ending with "end"
| Pipe Operator
bash
# Connects commands: output of first → input of second

ls -l | grep ".txt"               # List only txt files
cat logfile.txt | wc -l           # Count lines
ps aux | grep "python"            # Find python processes
df -h | grep "/dev/sda"           # Filter specific disk
history | grep "ssh"              # Search command history
awk - Text Processing
bash
# Extract specific columns
ls -l | awk '{print $9}'          # 9th column (filenames)
ps aux | awk '{print $1, $2, $11}' # User, PID, Command

# Filter based on condition
df -h | awk '$5 > 80 {print $1, $5}'  # Disks >80% full

# Using field separator
awk -F: '{print $1}' /etc/passwd  # Usernames only

# Sum values
echo -e "10\n20\n30" | awk '{sum+=$1} END {print sum}'
6. Complete Example Script:
bash
#!/bin/bash
# ===================================
# Script: server_monitor.sh
# Purpose: Monitor server health
# ===================================

set -euo pipefail

# Variables
LOG_FILE="/var/log/server_monitor.log"
ALERT_LEVEL=80

# Log function
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "=== Starting Server Monitor ==="

# Check CPU Load
LOAD=$(uptime | awk -F'load average:' '{print $2}')
log_message "Load Average: $LOAD"

# Check Memory
MEM_USAGE=$(free -m | awk '/^Mem:/ {printf "%.1f", $3/$2*100}')
log_message "Memory Usage: $MEM_USAGE%"

if (( $(echo "$MEM_USAGE > $ALERT_LEVEL" | bc -l) )); then
    log_message "ALERT: High memory usage!"
fi

# Check Disk
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
log_message "Root Disk Usage: $DISK_USAGE%"

# Check Services
SERVICES=("nginx" "mysql" "ssh")
for service in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$service"; then
        log_message "$service: ✓ Running"
    else
        log_message "$service: ✗ Stopped"
    fi
done

log_message "=== Monitor Complete ==="