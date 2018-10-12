    workdir='/root'
    cpm_key='cpm_rsa.pub'
    CPM_USER='cpmuser'
    user=$CPM_USER
    dir_key='cpm'
    # install lvm and deps
    yum -y install lvm2
    # download public key
    cp /home/ec2-user/AWS/$cpm_key $workdir/$cpm_key
    useradd -m $user
    # install keyfile
    mkdir /home/$user/.ssh
    mv $workdir/$cpm_key /home/$user/.ssh/authorized_keys
    chown -R $user:$user /home/$user/.ssh
    chmod -R 700 /home/$user/.ssh
    chmod 600 /home/$user/.ssh/authorized_keys
    semanage fcontext -a -t ssh_home_t /home/$user/.ssh/authorized_keys
    restorecon /home/$user/.ssh/authorized_keys

    # update /etc/sudoers
    echo "$user ALL=(ALL) NOPASSWD: /sbin/lvdisplay, /sbin/lvcreate, /sbin/lvremove" | EDITOR='tee -a' visudo
