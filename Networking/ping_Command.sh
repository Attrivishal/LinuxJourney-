# Here we are seeing the ping command and why this is used in networking
# ping_Command.sh
1. we are using a ping command to  check the connectivity 
2. for check the latency
3. for check the packet loss
4. for check the network issues
# Examples of ping command usage:
1. ping google.com

# and there are some negative points of ping command
-> It can be blocked by firewalls.
-> It only tests ICMP reachability, not overall network performance.

ICMP -> Internet Control Message Protocol


----------------------------------------------------------------------------------------
Basic Connectivity Testing
bash
ping -c 4 8.8.8.8              # Send exactly 4 packets
ping -i 2 google.com           # Send every 2 seconds (default: 1)
ping -w 10 google.com          # Stop after 10 seconds total
ping -W 5 google.com           # Wait 5 seconds per reply
2. Network Quality Testing
bash
ping -s 1472 google.com        # Test MTU (Max Transmission Unit)
ping -f google.com             # Flood ping (stress test)
ping -l 100 google.com         # Preload 100 packets before waiting
ping -q google.com             # Quiet output (only statistics)
3. Advanced Troubleshooting
bash
ping -R google.com             # Record route (shows hops)
ping -I eth0 google.com        # Use specific interface
ping -4 google.com             # Force IPv4
ping -6 google.com             # Force IPv6
ping -n google.com             # Don't resolve DNS (numeric output)
ping -v google.com             # Verbose output
4. Security/Stealth
bash
ping -c 1 -s 65507 google.com  # Ping of Death (old attack)
ping -b 192.168.1.255          # Broadcast ping