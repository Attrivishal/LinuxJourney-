Linux Permissions & Process Management
📁 FILE PERMISSIONS
chmod - Change Permissions
text
rwx rwx rwx
│    │    │
User Group Others
(u)  (g)   (o)
Symbolic Method:

bash
chmod u=rwx file        # User: read+write+execute
chmod g=rx file         # Group: read+execute  
chmod o=r file          # Others: read only

chmod +x script.sh      # Add execute for all
chmod -w file.txt       # Remove write for all

chmod -R u=rwx folder/  # Recursive
Numeric Method (0-7):

bash
chmod 755 file    # rwxr-xr-x (User:7, Group:5, Others:5)
chmod 644 file    # rw-r--r-- (6,4,4)
chmod 777 file    # rwxrwxrwx (DANGEROUS!)
Quick Numbers:

0 = ---

1 = --x

2 = -w-

3 = -wx

4 = r--

5 = r-x

6 = rw-

7 = rwx

👤 OWNERSHIP
chown - Change Owner/Group
bash
chown user file          # Change owner
chown :group file        # Change group
chown user:group file    # Change both
chown -R user:group dir/ # Recursive
Example:

bash
sudo chown vishal:root script.sh
sudo chown -R www-data:www-data /var/www/
⚡ PROCESS MANAGEMENT
ps - Show Processes
bash
ps                  # Your processes
ps aux              # ALL processes (most used)
ps -ef              # Full format
ps -u username      # User's processes
ps aux | grep nginx # Find specific
kill - Terminate Processes
bash
kill -1 PID    # SIGHUP - Reload config
kill -2 PID    # SIGINT - Ctrl+C (graceful)
kill -9 PID    # SIGKILL - Force kill
kill -15 PID   # SIGTERM - Graceful (default)

# Find PID then kill:
ps aux | grep firefox
kill -9 1234

# Kill by name:
pkill firefox
killall chrome
Signals:

-1 = Reload service

-2 = Interrupt (like Ctrl+C)

-9 = Force kill (use as last resort)

-15 = Ask nicely to stop

🎯 QUICK REFERENCE
File: -rwxr-xr-- 1 vishal users 4096 Jan 1 10:00 file.sh

Type: - (file), d (directory)

Perms: rwx (user), r-x (group), r-- (others)

Links: 1

Owner: vishal

Group: users

Size: 4096 bytes

Common:

bash
chmod 755 script.sh    # Executable
chmod 644 config.conf  # Config file  
chmod 600 secret.txt   # Private
sudo chown user:group file
Process:

bash
ps aux | grep [process]
kill -15 PID   # Try first
kill -9 PID    # Last resort
Remember: -R for recursive, sudo for system files!