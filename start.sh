#!/bin/bash
useradd --system --uid $USER_ID -M --shell /usr/sbin/nologin $USER_NAME
echo -e $USER_PASSWORD"\n"$USER_PASSWORD"\n" | pdbedit -a -t -u $USER_NAME
sed -i -e '/valid users =/ s/= .*/= '$USER_NAME'/' /etc/samba/smb.conf
smbd --foreground
