⚡ CHAPTER 6: Advanced Commands
1. curl vs wget
curl - Client URL (API Testing)
bash
# Basic usage
curl https://api.github.com

# Common options:
curl -I https://google.com          # Show headers only
curl -v https://example.com         # Verbose (see handshake)
curl -o output.html https://site.com # Save to file
curl -L http://redirect.com         # Follow redirects
curl -X POST -d 'data' URL          # POST request
curl -H "Content-Type: application/json" URL

# Real examples:
# Check website status
curl -s -o /dev/null -w "%{http_code}\n" https://google.com

# API call with authentication
curl -H "Authorization: Bearer YOUR_TOKEN" https://api.example.com
wget - Web Get (Downloads)
bash
# Basic download
wget https://example.com/file.zip

# Common options:
wget -O new_name.zip https://url/file.zip  # Rename file
wget -c https://url/file.zip               # Continue broken download
wget -r -l 2 https://site.com              # Recursive (2 levels deep)
wget --limit-rate=200k https://url/file.zip # Limit speed
wget -q https://url/file.zip               # Quiet mode

# Download and process:
wget -qO- https://logs.com/access.log | grep "404"
2. find - File Search Mastery
Basic Syntax:
bash
find [where] [what to find] [what to do]
Common Patterns:
bash
# By name
find /home -name "*.txt"            # Case-sensitive
find /home -iname "*.TXT"           # Case-insensitive

# By type
find /var -type d -name "log*"      # Directories only
find /home -type f                  # Files only

# By size
find / -type f -size +100M          # Files >100MB
find /home -type f -size -10k       # Files <10KB
find / -type f -size +500M -size -1G # Between 500MB-1GB

# By time
find /var/log -mtime -7             # Modified last 7 days
find /backup -mtime +30             # Modified >30 days ago
find /tmp -mmin -60                 # Modified last 60 minutes

# By permissions
find / -type f -perm 777            # World-writable (DANGER!)
find /home -type f ! -perm 644      # Not 644 permissions
Find and Execute:
bash
# Delete old files
find /tmp -name "*.tmp" -delete

# Copy matching files
find /home -name "*.jpg" -exec cp {} /backup/photos/ \;

# List with details
find /etc -type f -name "*.conf" -exec ls -lh {} \;

# Count files
find /home -type f -name "*.txt" | wc -l
3. sudo - SuperUser DO
Basic Usage:
bash
sudo command                      # Run as root
sudo -i                           # Login as root shell
sudo su -                         # Switch to root (login shell)
sudo -u username command          # Run as specific user
sudo -l                           # List allowed commands
sudo su - Explained:
bash
# Breakdown:
# sudo   - Execute as root
# su     - Switch user
# -      - Login shell (loads user's environment)

# Examples:
whoami                           # Returns: yourusername
sudo su -                        # Switch to root
whoami                           # Now returns: root
pwd                              # Now: /root (not your home)
sudoers File (Be Careful!):
bash
# NEVER edit directly!
# ALWAYS use: sudo visudo

# Sample entries:
# Allow user all commands:
username    ALL=(ALL:ALL) ALL

# Allow specific commands without password:
username    ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart nginx

# Allow for specific group:
%developers ALL=(ALL) /usr/bin/git
4. Process Management:
Monitoring Processes:
bash
ps aux                           # Show all processes
ps aux | grep "nginx"            # Find specific process
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head  # Top memory

# Process states:
# R - Running
# S - Sleeping
# D - Disk sleep (uninterruptible)
# Z - Zombie
# T - Stopped
Killing Processes:
bash
# Graceful shutdown
kill PID                         # SIGTERM (15)
kill -15 PID                     # Same as above

# Force kill (last resort)
kill -9 PID                      # SIGKILL (cannot be caught)

# Kill by name
pkill process_name
killall process_name
5. Signals and trap:
Common Signals:
bash
# List signals:
kill -l

# Important ones:
# 1) SIGHUP    - Hangup (reload config)
# 2) SIGINT    - Interrupt (Ctrl+C)
# 3) SIGQUIT   - Quit (Ctrl+\)
# 9) SIGKILL   - Force kill (cannot be trapped)
# 15) SIGTERM  - Graceful termination
# 18) SIGCONT  - Continue paused process
# 19) SIGSTOP  - Pause process
trap Command:
bash
# Syntax: trap 'commands' SIGNALS

# Basic example:
#!/bin/bash
trap "echo 'Script interrupted!'; exit" INT TERM

echo "Running... (Press Ctrl+C to test)"
sleep 30
echo "Finished normally."
Practical trap Example:
bash
#!/bin/bash
# Script with cleanup

temp_file="/tmp/myscript.$$"

# Cleanup function
cleanup() {
    echo "Cleaning up temporary files..."
    rm -f "$temp_file"
    echo "Cleanup complete."
}

# Set trap
trap cleanup EXIT INT TERM HUP

# Main script
echo "Creating temp file: $temp_file"
echo "Data" > "$temp_file"
sleep 10
echo "Script completed."






