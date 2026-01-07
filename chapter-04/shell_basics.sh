💻 CHAPTER 4: Shell Basics - Essential Commands
1. Navigation Commands:
pwd - Print Working Directory
bash
pwd                        # Shows current directory
# Output: /home/username/projects

pwd -P                     # Show physical path (no symbolic links)
cd - Change Directory
bash
cd /home/username          # Absolute path
cd documents               # Relative path (go to documents folder)
cd ..                      # Go up one level
cd ~                       # Go to home directory
cd -                       # Go to previous directory
cd /                       # Go to root directory
2. File Operations:
ls - List Files
bash
ls                         # Basic list
ls -l                      # Long format (permissions, size, date)
ls -la                     # All files including hidden (.files)
ls -lh                     # Human readable sizes (KB, MB, GB)
ls -ltr                    # Sort by time reverse (newest last)
ls *.txt                   # List only txt files
ls -d */                   # List only directories
touch - Create/Update File
bash
touch file.txt             # Create empty file
touch file1.txt file2.txt  # Create multiple files
touch -a file.txt          # Update access time only
mkdir - Make Directory
bash
mkdir newfolder            # Create directory
mkdir -p dir1/dir2/dir3    # Create nested directories
mkdir -m 755 secure_dir    # Create with specific permissions
cat - Concatenate Files
bash
cat file.txt               # Display file content
cat > newfile.txt          # Create file (Ctrl+D to save)
cat file1.txt file2.txt    # Display multiple files
cat -n file.txt            # Show line numbers
3. System Information:
free - Memory Information
bash
free                       # Show memory in KB
free -h                    # Human readable (MB, GB)
free -g                    # Show in GB
free -m                    # Show in MB

# Understanding output:
# total: Total installed RAM
# used: Currently used memory
# free: Available memory
# shared/buffers/cache: Kernel usage
nproc - CPU Cores
bash
nproc                      # Number of CPU cores
# Output: 8 (means 8 CPU cores)

# Related commands:
lscpu                      # Detailed CPU information
cat /proc/cpuinfo          # Raw CPU data
df - Disk Space
bash
df                         # Basic disk usage
df -h                      # Human readable
df -h /home                # Check specific partition
df -i                      # Show inode usage

# Output columns:
# Filesystem, Size, Used, Avail, Use%, Mounted on
top - Process Monitor
bash
top                        # Interactive process viewer

# Key commands inside top:
# Press 'q' to quit
# Press 'M' to sort by memory
# Press 'P' to sort by CPU
# Press '1' to show all CPUs
# Press 'k' to kill process
# Press 'h' for help

# Better alternative: htop
sudo apt install htop     # Install first
htop                      # Colorful, user-friendly
Practice Session:
bash
# 1. Create a practice directory
mkdir linux_practice && cd linux_practice

# 2. Create files
touch file1.txt file2.txt file3.txt

# 3. List with details
ls -la

# 4. Check system info
echo "CPU Cores: $(nproc)"
free -h
df -h .

# 5. Create and view content
echo "Hello Linux World" > hello.txt
cat hello.txt

# 6. Monitor system
top   # Observe for 30 seconds, then press 'q'
