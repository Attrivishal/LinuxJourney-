
--------------------------------------------------------------------
Understanding File Types and Permission Symbols in Linux
--------------------------------------------------------------------
In Linux, every file and directory has a specific type and associated permission symbols that define access rights. Here’s a quick reference to help you understand these symbols.
--------------------------------------------------------------------
    file symbol       |      File type
-----------------------|--------------------------------------
          -           |        Regular file
          d           |        Directory
          l           |        Symbolic link
          c           |        Character device file
          b           |        Block device file
          p           |        Named pipe (FIFO)
          s           |        Socket file
-----------------------|--------------------------------------
Permission Symbols:
r = read
w = write
x = execute
- = no permission
Examples:
ls -l file.txt
→ -rw-r--r-- 1 user group 0 Jun 1 12:00 file.txt
ls -ld /home/user
→ drwxr-xr-x 5 user group 4096 Jun 1 12:00 /home/user
ls -l link -> target
→ lrwxrwxrwx 1 user group 7 Jun 1 12:00 link -> target
--------------------------------------------------------------------

1. Socket (s) = Enable the communication between two  processes.
2. Named Pipe (p) = Used for inter-process communication (IPC).
3. Block Device (b) = Used for devices that read/write data in blocks (e.g., hard drives).
4. Character Device (c) = Used for devices that read/write data character by character (e.g., keyboards). 
--------------------------------------------------------------------