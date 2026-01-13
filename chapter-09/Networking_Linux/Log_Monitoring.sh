# Here we are seeing log analysis & monitoring using basic Linux commands
------------------------------------------------------------------------------------
1. so logs  files is used to store the data from application such as events, processes and messages.
2. And these data is helpfull in monitoring and troubleshooting the system.
3. Common log files are stored in /var/log/ directory.

# So there are some common log files in Linux system:
1-> Boot: In this  all logs related to system boot process are stored.
  File location: /var/log/boot.log
2-> Chron: This log file contains information about scheduled tasks and cron jobs.
  File location: /var/log/cron.log
3-> Secure: This log file contains security-related messages, including authentication attempts and sudo usage.
  File location: /var/log/secure
4-> Messages: This log file contains general system messages, including kernel messages and other system events.
  File location: /var/log/messages
5-> Maillog: This log file contains information about mail server activity.
  File location: /var/log/maillog
6->httpd/: This directory contains log files related to the Apache web server.
  File location: /var/log/httpd/ 


# Now we will see some basic commands to monitor and analyze log files:
1. tail: This command is used to view the last few lines of a log file.
  Example: tail -n 50 /var/log/messages
  (This command will display the last 50 lines of the messages log file.)
2. grep: This command is used to search for specific patterns or keywords in log files.
    Example: grep "error" /var/log/secure
    (This command will search for the keyword "error" in the secure log file.)
3. less: This command is used to view log files one page at a time.
    Example: less /var/log/boot.log
    (This command will open the boot log file in a paginated view.)
4. cat: This command is used to display the entire contents of a log file.
    Example: cat /var/log/cron.log
    (This command will display the entire contents of the cron log file.)

---------------------------------------------------------------------------------------