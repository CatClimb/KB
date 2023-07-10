#一、扩容流程
分区 /dev/sda3
lvcreate /dev/sda3
vgextend OneDisk /dev/sda3
lvextend -l 100%FREE /dev/mapper/OneDisk-ArchlinuxRoot
==下面的命令是resize的意思==
xfs_growfs /dev/mapper/OneDisk-ArchlinuxRoot