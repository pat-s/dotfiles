# unstrut
sudo mount -t cifs -o credentials=/home/pjs/.credentials,uid=1000,file_mode=0775,dir_mode=0775,gid=100,sec=ntlm,vers=1.0,dom=ads.uni-jena.de,forcegid //141.35.159.70/home_geoinf     /mnt/geoinf_home

# unstrut
sudo mount -t cifs -o credentials=/home/pjs/.credentials,uid=1000,file_mode=0775,dir_mode=0775,gid=100,sec=ntlm,vers=1.0,dom=ads.uni-jena.de,forcegid //141.35.159.70/home_web     /mnt/geoinf_web

# lossa
sudo mount -t cifs -o credentials=/home/pjs/.credentials,uid=1000,file_mode=0775,dir_mode=0775,gid=100,sec=ntlm,vers=1.0,dom=ads.uni-jena.de,forcegid //141.35.159.90/data     /mnt/lossa

# venus
sudo sshfs -o reconnect,idmap=user,transform_symlinks,identityFile=~/.ssh/id_rsa,allow_other,cache=yes,kernel_cache,compression=no,default_permissions,uid=1000,gid=100,umask=0 patrick@141.35.159.80:/ /mnt/venus

# jupiter
sudo sshfs -o reconnect,idmap=user,transform_symlinks,identityFile=~/.ssh/id_rsa,allow_other,cache=yes,kernel_cache,compression=no,default_permissions,uid=1000,gid=100,umask=0 patrick@141.35.159.87:/ /mnt/jupiter

# geo01
# sudo sshfs -o reconnect,idmap=user,transform_symlinks,identityFile=~/.ssh/id_rsa,allow_other,cache=yes,kernel_cache,compression=no,default_permissions,uid=1000,gid=100,umask=0 bi28yuv@geo01.rz.uni-jena.de:/   /mnt/geo01

# cluster
sudo sshfs -o reconnect,idmap=user,transform_symlinks,identityFile=~/.ssh/id_rsa,allow_other,cache=yes,kernel_cache,compression=no,default_permissions,uid=1000,gid=100,umask=0 patrick@141.35.158.107:/ /mnt/cluster


