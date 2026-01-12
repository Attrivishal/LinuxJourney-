# Here are seeing how  traceroute command works in networking
# traceroute_command.sh
-------------------------------------------------------------------
1. we are using traceroute command to the routes the packets of our internet  that are running from our
destination to the source 
-> And also it shows the path that the packets take to reach the destination.
2. for check the latency at each hop
3. for identify where the network issues are occurring along the path
4. for network diagnostics and troubleshooting

<-- But there is a parameter  which is needed by this command-->
      it require the name or the IP address of the destination host

      ARCHITECTURE OF TRACEROUTE COMMAND
      ---------------------------------
      | Source Host                     |
      |   |                             |
      |   | 1. Send packet with low TTL |
      |   |---------------------------->|
      |   |                             |
      |   | 2. Intermediate Router 1    |
      |   |   decrements TTL, sends     |
      |   |   ICMP Time Exceeded back   |
      |   |<----------------------------|
      |   |                             |
      |   | 3. Increment TTL, repeat    |
      |   |---------------------------->|
      |   |                             |   
      |   | 4. Intermediate Router 2    |
      |   |   decrements TTL, sends     |
      |   |   ICMP Time Exceeded back   |
      |   |<----------------------------|
      |   |                             |
      |   | ...                         |
      |   |                             |
      |   |                             |
      |   | n. Destination Host        |
      |   |   receives packet, sends    |
      |   |   ICMP Echo Reply back      |
      |   |<----------------------------|
      ----------------------------------------------------------------


->> And there are some negative points of traceroute command
-> It can be blocked by firewalls or routers that do not send ICMP Time Exceeded
-> It may not accurately reflect the actual path taken by all types of traffic
-> Some routers may deprioritize or ignore traceroute packets, leading to incomplete results  

ICMP -> Internet Control Message Protocol
TTL  -> Time To Live
# Examples of traceroute command usage:
traceroute google.com

----------------------------------------------------------------------------------------


Now , Here are some actions of traceroute command:
1. Basic Traceroute
bash
traceroute google.com                # Basic traceroute to google.com
traceroute -n google.com             # Numeric output (no DNS resolution)
traceroute -m 20 google.com          # Set max hops to 20 (default is 30)
2. Customizing Probes
bash
traceroute -q 5 google.com           # Send 5 probes per hop (default is 3)
traceroute -w 3 google.com           # Set wait time to 3 seconds (default is 5)
traceroute -z 64 google.com          # Set packet size to 64 bytes (default is 60)
3. Using Different Protocols
bash
traceroute -I google.com             # Use ICMP ECHO instead of UDP (like ping)
traceroute -T google.com             # Use TCP SYN packets
traceroute -U google.com             # Use UDP packets (default behavior)
4. Advanced Options
bash
traceroute -A google.com             # Show AS (Autonomous System) numbers
traceroute -F google.com             # Do not fragment packets
traceroute -p 80 google.com          # Use destination port 80 (HTTP)
traceroute -s eth0 google.com        # Use specific source interface
traceroute -V                        # Show version information 
traceroute -h                        # Show help information
