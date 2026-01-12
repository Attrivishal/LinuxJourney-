📁 FILE & DIRECTORY COMMANDS
Command	Description	Example
pwd	Print working directory	pwd → /home/user
cd	Change directory	cd /tmp
cd ..	Go to parent directory	cd ..
ls	List files	ls
ls -l	Long listing format	ls -l
ls -ltr	Sort by time reversed (latest last)	ls -ltr
touch	Create empty file	touch file.txt
mkdir	Make directory	mkdir new_folder
rm	Remove file	rm file.txt
rm -rf	Remove directory force	rm -rf folder/ 
cp	Copy file	cp src.txt dest.txt
mv	Move/rename file	mv old.txt new.txt

--------------------------------------------------------------------
📄 FILE VIEWING/EDITING
Command	Description	Example
cat	Concatenate & display files	cat file.txt
vi/vim	Text editor	vi file.txt
nano	Simple text editor	nano file.txt
head	Show first 10 lines	head -20 file.txt
tail	Show last 10 lines	tail -f log.txt
more	Page through file	more large.txt
less	Better version of more	less file.txt

--------------------------------------------------------------------
🔍 SEARCH & FILTER COMMANDS
Command	Description	Example
grep	Search text patterns	grep "error" log.txt
grep -r	Recursive search	grep -r "TODO" ./
find	Find files	find . -name "*.txt"
awk	Text processing	awk '{print $1}' file.txt
sed	Stream editor	sed 's/old/new/g' file.txt

--------------------------------------------------------------------
📊 SYSTEM MONITORING
Command	Description	Example
free -g	Memory usage in GB	free -g
nproc	Number of CPU cores	nproc
df -h	Disk space human readable	df -h
top	Real-time process viewer	top
htop	Better top (install)	htop
ps -ef	Show all processes	ps -ef
ps aux	Detailed process info	ps aux
uptime	System uptime & load	uptime

--------------------------------------------------------------------
🌐 NETWORK COMMANDS
Command	Description	Example
curl	Transfer data from URLs	curl https://api.github.com
wget	Download files	wget https://site.com/file.zip
ping	Test network connectivity	ping google.com
ifconfig	Network interface config	ifconfig
ip addr	Modern network info	ip addr show
netstat	Network statistics	netstat -tulpn
ss	Socket statistics	ss -tulpn

--------------------------------------------------------------------
⚙️ PERMISSIONS & PROCESSES
Command	Description	Example
chmod	Change file permissions	chmod 755 script.sh
chown	Change file owner	chown user:group file.txt
sudo	Execute as superuser	sudo apt update
kill	Terminate process	kill 1234
kill -9	Force kill process	kill -9 1234
pkill	Kill by process name	pkill firefox

--------------------------------------------------------------------
🔧 SCRIPTING & DEBUGGING
Command	Description	Example
#!/bin/bash	Shebang for bash script	First line in script
set -x	Debug mode (print commands)	set -x in script
set -e	Exit on error	set -e in script
set -o pipefail	Exit if any pipe fails	set -o pipefail
trap	Catch signals	trap "echo Exiting" EXIT

--------------------------------------------------------------------
📦 PACKAGE MANAGEMENT
Command	Description	Example
apt update	Update package list (Ubuntu)	sudo apt update
apt install	Install package (Ubuntu)	sudo apt install git
yum install	Install (RHEL/CentOS)	sudo yum install httpd
dpkg -i	Install .deb file	sudo dpkg -i package.deb
rpm -i	Install .rpm file	sudo rpm -i package.rpm

--------------------------------------------------------------------
🔍 FIND & LOG COMMANDS
Command	Description	Example
find . -name	Find by name	find . -name "*.log"
find . -type f	Find only files	find . -type f -size +1M
find . -mtime	Find by modification time	find . -mtime -7
journalctl	System logs	journalctl -f
dmesg	Kernel messages	dmesg | tail -20