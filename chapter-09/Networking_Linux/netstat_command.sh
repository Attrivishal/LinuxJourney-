# Here we are seeing how  netstat command works in networking
# netstat_command.sh
-------------------------------------------------------------------
First what is NETSTAT?
Ans-> Network Statistics (netstat) is a command-line utility in Linux that provides information about
network connections, routing tables, interface statistics, masquerade connections, and multicast memberships. 
  Quick Points about netstat command:
1. The netstat command in Linux is used to display network connections, routing tables, interface statistics,
  masquerade connections, and multicast memberships. It is a powerful tool for network diagnostics and monitoring.
2. The netstat command is often used by system administrators and network engineers to troubleshoot network issues,
  monitor active connections, and analyze network performance.
3. It can display information about TCP and UDP connections, including listening and non-listening sockets,
  established connections, and various socket states.
4. The netstat command provides various options and filters to customize the output according to user needs.

ARCHITECTURE OF NETSTAT COMMAND
---------------------------------
      ----------------------------------------------------------------
      | User invokes netstat command    |
      |   |                             |
      |   | 1. netstat gathers network   |
      |   |    connection info          |
      |   |---------------------------->|
      |   |                             |
      |   | 2. Kernel retrieves socket   |
      |   |    data                     |
      |   |<----------------------------| 
      |   |                             |
      |   | 3. netstat formats and       |
      |   |    displays the information  |
      |   |---------------------------->| 
      |   |                             |
      ----------------------------------------------------------------
->> The netstat command provides various options and filters to customize the output according to user needs
Some advantages of using the netstat command:
1. Comprehensive Information: The netstat command provides a wide range of information about network connections
  and statistics.
2. Troubleshooting: It is a valuable tool for diagnosing network issues and monitoring active connections.
3. Versatility: The netstat command can display information about various protocols, including TCP, UDP, and more.
4. Widely Available: The netstat command is available on most Linux distributions by default.

-> These are some commands of netstat command usage:
1. Display all active connections
bash
netstat -a                           # Show all active connections
2. Display listening ports
bash
netstat -l                           # Show listening ports
3. Display TCP connections
bash
netstat -t                           # Show TCP connections
4. Display UDP connections
bash
netstat -u                           # Show UDP connections
5. Display routing table
bash
netstat -r                           # Show routing table
6. Display network interface statistics
bash
netstat -i                           # Show network interface statistics
7. Display process using the socket
bash
netstat -p                           # Show process using the socket
8. Display numerical addresses instead of resolving hostnames
bash
netstat -n                           # Show numerical addresses
9. Display statistics for each protocol
bash
netstat -s                           # Show protocol statistics   
10. Display all TCP/UDP and listening ports
bash
netstat -tunlp                       # Show all TCP/UDP listening ports with process info
11. Continuously display network connections
bash
netstat -c                           # Continuously display network connections
----------------------------------------------------------------------------------------
