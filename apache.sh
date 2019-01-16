
vim /etc/httpd/conf/httpd.conf


NameVirtualHost *:80
<VirtualHost *:80>
        ServerName server.panoptiko.com
        ProxyPreserveHost On
        ProxyPass / http://localhost:5000/
        ProxyPassReverse / http://localhost:5000/
</VirtualHost>
<VirtualHost *:80>
        ServerName vilchesfm.cl
        ServerAlias www.vilchesfm.cl
        ProxyPreserveHost On
        ProxyPass / http://localhost:8000/
        ProxyPassReverse / http://localhost:8000/
</VirtualHost>
