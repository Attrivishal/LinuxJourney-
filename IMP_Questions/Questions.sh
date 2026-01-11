Linux Filesystem
"A developer says their app can't find config file at /etc/app/config.conf. What do you check first?"

"Why would you check /var/log/ when an application crashes?"

"How do absolute and relative paths differ in cron jobs?"

"What's in /home vs /root and why does it matter?"

"How would you list all files including hidden ones in a directory?"
---------------------------------------------------------------------------------------------------------------
Permissions & Ownership
"A script runs as root but not as a regular user. What permissions would you check?"

"Why is chmod 777 dangerous for web directories?"

"How do you give group write permission without affecting others?"

"What's the difference between hard links and symbolic links for configuration files?"

"How does umask 022 affect newly created files?"

-----------------------------------------------------------------------------------------------------------
Processes & Services
"A service shows 'Active: failed' in systemctl status. What's your next step?"

"When would you use kill -9 vs regular kill?"

"How do you find which process is using port 8080?"

"What does 'Z' status mean in ps aux output?"

"How do you make a service start automatically on boot?"

Real Cloud Scenarios:
"Can't SSH to EC2 instance - where do you start?"

"Web server returns 503 error - what Linux commands do you run?"

"Disk full alert on EBS volume - what do you check first?"

"High CPU alarm - how do you identify the culprit process?"

"Application not starting after instance reboot - what do you check?"

Troubleshooting Steps:
"Walk me through debugging a down Apache service"

"How do you check why a database service won't start?"

"What logs do you check when a user can't connect to a service?"

"How do you monitor real-time system performance?"

"What commands show disk I/O issues?"

-----------------------------------------------------------------------------------------------------------------
Security & Permissions:
"Why shouldn't services run as root user?"

"How do you check file permissions recursively in a directory?"

"What's wrong with having world-writable files in /tmp?"

"How do you verify which user a process is running as?"

"Why check /etc/passwd and /etc/shadow permissions?"

--------------------------------------------------------------------------------------------------------

Process Management:
"How do you change a running process's priority?"

"What's the difference between ps aux and ps -ef?"

"How do you find parent process ID of a service?"

"What does 'D' state mean in process status?"

"How do you handle a process that won't terminate?"

---------------------------------------------------------------------------------------------------------
Service Management:
"How do you check service dependencies?"

"What's the difference between systemctl enable and systemctl start?"

"Where are systemd service files located?"

"How do you reload a service after config change?"

"What does systemctl daemon-reload do?"

---------------------------------------------------------------------------------------------------------
Log Investigation:
"How do you view last 50 lines of a log file?"

"How do you search for errors in logs?"

"What's in /var/log/messages vs /var/log/syslog?"

"How do you rotate logs manually?"

"Why check /var/log/secure for authentication issues?"