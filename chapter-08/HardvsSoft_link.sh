# Here we are seeing about the Hard link and Soft link in Linux
---------------------------------------------------------------------
Understanding Hard Links and Soft Links (Symbolic Links) in Linux
---------------------------------------------------------------------
In Linux, links are used to create references to files. There are two types of links: hard links and soft links (symbolic links). Here’s a quick overview of both:
--------------------------------------------------------------------- 
1. Hard Links:
  - A hard link is a direct reference to the physical data on the disk.
  - Multiple hard links can point to the same inode (data block) on the disk.
  - Deleting the original file does not delete the data as long as there is at least one hard link pointing to it.
  - Hard links cannot span across different file systems or partitions.
  - Hard links cannot be created for directories (to avoid circular references).
  - Example command to create a hard link:
    ```bash
    ln original_file.txt hard_link.txt
    ```
---------------------------------------------------------------------
2. Soft Links (Symbolic Links):
  - A soft link, or symbolic link, is a special type of file that points to another file or directory by its path.
  - Deleting the original file will break the symbolic link, making it point to a non-existent file.
  - Soft links can span across different file systems or partitions.
  - Soft links can be created for directories.
  - Example command to create a soft link:
    ```bash
    ln -s /path/to/original_file.txt soft_link.txt
  ```
---------------------------------------------------------------------
Comparison Summary:
---------------------------------------------------------------------
| Feature               | Hard Link                     | Soft Link (Symbolic Link)      |
|-----------------------|-------------------------------|--------------------------------|
| Reference Type        | Direct reference to inode     | Reference by file path         |
| Deletion Behavior     | Data remains if links exist   | Link breaks if original deleted|
| Cross File Systems    | Not allowed                   | Allowed                        |
| Directory Linking     | Not allowed                   | Allowed                        |
---------------------------------------------------------------------
Usage Scenarios:
- Use hard links when you need multiple references to the same file within the same file system and want to ensure data persistence.
- Use soft links when you need to link files across different file systems or want to link directories.
---------------------------------------------------------------------
Commands to View Links:
- To view hard links, use:
  ```bash
  ls -l
  ```
  The link count is shown in the second column.
- To view symbolic links, use:
  ```bash
  ls -l
  ```
  Symbolic links are indicated by an 'l' at the beginning of the permissions string.
---------------------------------------------------------------------
Examples:
```bash
# Creating a hard link
ln original_file.txt hard_link.txt  
# Creating a soft link
ln -s /path/to/original_file.txt soft_link.txt

---------------------------------------------------------------------