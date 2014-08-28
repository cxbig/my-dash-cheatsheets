cheatsheet do
  title 'Ubuntu Server'
  docset_file_name 'UbuntuServer'
  keyword 'ubuntu-server'

  introduction 'Some basic information for play with Ubuntu Server'

  category do
    id 'apt-get'

    entry do
      name 'apt-get | change resource mirror server'
      notes <<-'NOTE'
### Check your Ubuntu version

```
# cat /etc/issue
```

### Backup config file

```
# cp /etc/apt/sources.list /etc/apt/sources.list.old
```

### Change the file

```
# vi /etc/apt/sources.list
```

### by this content

```
deb http://mirrors.oschina.net/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.oschina.net/ubuntu/ trusty-backports main restricted universe multiverse
deb http://mirrors.oschina.net/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.oschina.net/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.oschina.net/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty-updates main restricted universe multiverse
```

_This sample is from `oschina.net`, for `Ubuntu 14.04`_

_For more mirror link in `oschina.net` click [here](http://mirrors.oschina.net/help/ubuntu.html)_
      NOTE
    end

    entry do
      name 'apt-get | update'
      notes <<-'NOTE'
### Create file and fill up the content

```
~# vi apt.sh

// file content:

#!/bin/bash
apt-get update
apt-get upgrade -y
apt-get autoclean
```

### Then, update Ubuntu Server by one command

```
~# sh apt.sh
```
      NOTE
    end
  end

  category do
    id 'user'

    entry do
      name 'User - Create'
      notes <<-'NOTE'
```
# adduser cxbig
```
      NOTE
    end
  end

  category do
    id 'apache2'

    entry do
      name 'Apache | Basic VirtualHost configuration'
      notes <<-'NOTE'
```
<VirtualHost *:80>
  ServerAdmin admin@sample.com
  ServerName localhost

  DirectoryIndex index.html
  DocumentRoot /var/www/html
  <Directory "/var/www/html">
    Options Indexes FollowSymLinks
    AllowOverride All
    Order allow,deny
    Allow from all
  </Directory>

  LogLevel warn
  ErrorLog  /var/www/html/error.log
  CustomLog /var/www/html/access.log combined
</VirtualHost>
```
      NOTE
    end
  end

end
