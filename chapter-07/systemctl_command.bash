Complete systemctl Command Guide
What is systemctl?
systemctl is the command-line tool for controlling the systemd system and service manager. It's used to manage system services, view their status, and control the system state.

BASIC SERVICE MANAGEMENT
Starting & Stopping Services
bash
# Start a service
sudo systemctl start service_name

# Stop a service  
sudo systemctl stop service_name

# Restart a service (stop then start)
sudo systemctl restart service_name

# Reload configuration (without restarting)
sudo systemctl reload service_name

# Restart if running, start if not running
sudo systemctl try-restart service_name
Checking Service Status
bash
# Detailed status of a service
sudo systemctl status service_name

# Check if service is currently active
systemctl is-active service_name

# Check if service failed to start
systemctl is-failed service_name
⚙️ AUTO-START MANAGEMENT (BOOT TIME)
Enable/Disable Services
bash
# Enable service to start at boot
sudo systemctl enable service_name

# Disable service from starting at boot  
sudo systemctl disable service_name

# Enable AND start immediately
sudo systemctl enable --now service_name

# Disable AND stop immediately
sudo systemctl disable --now service_name
Check Auto-start Status
bash
# Check if service is enabled at boot
systemctl is-enabled service_name

# List all enabled services
systemctl list-unit-files --state=enabled

# List all disabled services
systemctl list-unit-files --state=disabled
🔒 LOCKING SERVICES (MASK/UNMASK)
Prevent Service Start
bash
# Mask service - prevents ALL starts (even manual)
sudo systemctl mask service_name

# Unmask service - allow service to be started
sudo systemctl unmask service_name
Important: Masking creates a symbolic link to /dev/null, making the service impossible to start until unmasked.

📊 VIEWING SERVICES
List Services
bash
# List all running services
systemctl list-units --type=service

# List all services (including inactive)
systemctl list-units --type=service --all

# List only failed services
systemctl list-units --state=failed

# List services with descriptions
systemctl list-units --type=service --all --no-pager
View Service Details
bash
# Show all properties of a service
systemctl show service_name

# Show specific property
systemctl show service_name -p ActiveState

# Show service dependencies
systemctl list-dependencies service_name
🔧 SYSTEM CONTROL COMMANDS
System Power Management
bash
# Shutdown the system
sudo systemctl poweroff

# Reboot the system  
sudo systemctl reboot

# Reboot ignoring logged-in users
sudo systemctl -i reboot

# Suspend to RAM
sudo systemctl suspend

# Hibernate to disk
sudo systemctl hibernate
System State
bash
# Enter rescue mode (single user)
sudo systemctl rescue

# Enter emergency mode
sudo systemctl emergency
📡 SOCKET MANAGEMENT
Socket Services
bash
# List all sockets
systemctl list-sockets

# List sockets with types
systemctl --show-types list-sockets

# Show socket details
systemctl status socket_name.socket
🔄 SYSTEMD RELOAD
bash
# Reload systemd after service file changes
sudo systemctl daemon-reload

# Reload or restart service
sudo systemctl reload-or-restart service_name