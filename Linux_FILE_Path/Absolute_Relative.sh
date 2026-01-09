# Here we seeing about the Absolute and Relative file paths in Linux
---------------------------------------------------------------------
Understanding Absolute and Relative File Paths in Linux
---------------------------------------------------------------------
1. Absolute Path: An absolute path is the complete path from the root directory (/) to the target file or directory. It always starts with a forward slash (/).
  Example: /home/user/documents/file.txt
2. Relative Path: A relative path is the path relative to the current working directory. It does not start with a forward slash (/).
  Example: If the current directory is /home/user, the relative path to documents/file.txt would be documents/file.txt
3. Special Notations:
  - . (dot): Represents the current directory.
    Example: ./file.txt refers to file.txt in the current directory.
  - .. (double dot): Represents the parent directory.
    Example: ../file.txt refers to file.txt in the parent directory.
4. Home Directory Shortcut: The tilde (~) represents the home directory of the current user.
    Example: ~/documents/file.txt refers to /home/username/documents/file.txt
5. Combining Paths: You can combine absolute and relative paths to navigate the file system.
    Example: If you are in /home/user and want to access /home/user/documents
    you can use the relative path documents/file.txt or the absolute path /home/user/documents/file.txt
--------------------------------------------------------------------  