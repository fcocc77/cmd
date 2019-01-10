yum -y install tigervnc-server

pkill Xvnc

service='/etc/systemd/system/vncserver.service'

echo "[Unit]
Description=Remote desktop service (VNC)
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/sbin/runuser -l root -c '/usr/bin/vncserver %i -geometry 1280x1024'


[Install]
WantedBy=multi-user.target" > $service

vncpasswd

systemctl enable vncserver
systemctl start vncserver



