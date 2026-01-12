# Here we are seeing how  ss command works in networking
# ss_command.sh
-------------------------------------------------------------------
First what is SS?
Ans-> Socket Statictics (ss) is a command-line utility in Linux that provides detailed information about network sockets.


  Quick Points about ss command:

1. The ss command in Linux is used to display detailed information about network sockets. It is a powerful
  tool for network diagnostics and monitoring, providing insights into TCP, UDP, and other socket connections.  
2. The ss command is often used by system administrators and network engineers to troubleshoot network issues,
  monitor active connections, and analyze network performance.
3. It can display information about listening and non-listening sockets, established connections, and various
  socket states.
4. The ss command is considered a modern replacement for the older netstat command, offering faster performance
  and more detailed output.

ARCHITECTURE OF SS COMMAND
---------------------------------
      ----------------------------------------------------------------
      | User invokes ss command         |
      |   |                             |
      |   | 1. ss gathers socket info   |
      |   |---------------------------->|
      |   |                             |
      |   | 2. Kernel retrieves socket   |
      |   |    data                     |
      |   |<----------------------------|
      |   |                             |
      |   | 3. ss formats and displays   |
      |   |    the information          |
      |   |---------------------------->|
      |   |                             |
      ----------------------------------------------------------------
->> The ss command provides various options and filters to customize the output according to user needs.

Some advantages of using the ss command:
1. Speed: The ss command is faster than netstat, making it more efficient for real-time monitoring.
2. Detailed Information: It provides more granular details about socket states and connections.
3. Flexibility: The ss command offers a wide range of options and filters for customized output.
4. Modern Tool: As a modern replacement for netstat, it is actively maintained and updated


-> These are some commands of ss command usage:

1. Display all TCP connections
bash
ss -t                               # Show all TCP sockets    
2. Display all UDP connections
bash
ss -u                               # Show all UDP sockets
3. Display listening sockets
bash
ss -l                               # Show listening sockets
4. Display all connections with process information
bash
ss -p                               # Show process using the socket
5. Display summary statistics
bash
ss -s                               # Show summary statistics
6. Filter by state (e.g., established connections)
bash
ss -t state established             # Show established TCP connections
7. Display connections for a specific port
bash
ss -t sport = :80                   # Show TCP connections on port 80
8. Display all TCP/UDP and listening ports
bash
ss -tunlp                          # Show all TCP/UDP listening ports with process info
9. Display IPv4 or IPv6 sockets
bash
ss -4                               # Show only IPv4 sockets
ss -6                               # Show only IPv6 sockets
10. Display active TCP connections  wih process info
bash
ss -antp                    # Show all TCP connections with process info
