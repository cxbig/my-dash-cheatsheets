cheatsheet do
  title 'Ubuntu Server'
  docset_file_name 'UbuntuServer'
  keyword 'ubuntu-server'

  introduction 'Some basic information for play with Ubuntu Server'

  category do
    id 'apt-get'

    entry do
      name '### apt-get | Change resource mirror server'
      notes <<-'NOTE'
#### Check your Ubuntu version
```
cat /etc/issue
```

#### Backup config file
```
cp /etc/apt/sources.list /etc/apt/sources.list.old
```

#### Change the file
```
vi /etc/apt/sources.list
```

#### With this content
```
# oschina.net, Ubuntu 14.04
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

_For more mirror link in `oschina.net` click [here](http://mirrors.oschina.net/help/ubuntu.html)_
      NOTE
    end

    entry do
      name '### apt-get | Update'
      notes <<-'NOTE'
#### Create file
```
vi /root/apt.sh
```

#### Fill up the content
```
#!/bin/bash
apt-get update
apt-get upgrade -y
apt-get autoclean
```

#### Then, update Ubuntu Server by one command
```
sh /root/apt.sh
```
      NOTE
    end
  end

  category do
    id 'DPKG'

    entry do
      name '### DPKG | List all installed packages'
      notes <<-'NOTE'
```
dpkg --get-selections
```
      NOTE
    end
  end

  category do
    id 'PPA Management'

    entry do
      name '### PPA | Add & remove PPA library'
      notes <<-'NOTE'
#### Add a ppa library
```
sudo apt-get-repository ppa:user/app
```

#### Remove a ppa library itself only
```
sudo apt-get-repository --remove ppa:user/app
```

#### Remove a ppa library & installed applications
##### First, you need `ppa-purge` tool
``` 
sudo apt-get install -y ppa-purge
```

##### Then, remove the ppa library & installed applications
```
sudo ppa-purge ppa:user/app
```
      NOTE
    end
  end

  category do
    id 'System'

    entry do
      name '### System | Get last system reboot time'
      notes <<-'NOTE'
#### 1
```
last reboot
```

#### 2
```
who -b
```

#### 3
```
uptime
```
      NOTE
    end

    entry do 
      name '### System | Hard-drive free space'
      notes <<-'NOTE'
```
df -h
```
      NOTE
    end

    entry do
      name '### System | Folder size'
      notes <<-'NOTE'
```
du
  -h    // human readable
  -a    // include files
  -s    // summary only
```
      NOTE
    end
  end

  category do
    id 'User'

    entry do
      name '### User | Create'
      notes <<-'NOTE'
```
adduser cxbig
```
      NOTE
    end

    entry do
      name '### User | Add user to sudo group'
      notes <<-'NOTE'
```
usermod -a -G sudo cxbig
```
      NOTE
    end
  end


  category do
    id 'Mysql'

    entry do
      name '### Mysql | Install Mysql Server 5.6'
      notes <<-'NOTE'
#### Install command
```
apt-get install -y mysql-server-5.6
```
      NOTE
    end

    entry do
      name '### Mysql | Security configuration'
      notes <<-'NOTE'
#### Security command
```
mysql_secure_installation
```

_Just following the process, finish the configuration_
      NOTE
    end
  end

  category do
    id 'Apache2'

    entry do
      name '### Apache2 | Installation'
      notes <<-'NOTE'
```
apt-get install -y apache2
```
      NOTE
    end

    entry do
      name '### Apache2 | Basic VirtualHost configuration'
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

  category do
    id 'PHP'

    entry do
      name '### PHP | Installation'
      notes <<-'NOTE'
```
apt-get install -y php5 php5-adodb php5-cgi php5-curl php5-fpm php5-gd php5-geoip php5-imagick php5-intl php5-mcrypt php5-mysql php5-oauth php5-odbc php5-redis php5-sqlite php5-tidy php5-xdebug php5-xmlrpc libapache2-mod-php5
```
      NOTE
    end

    entry do
      name '### PHP | Get basic information'
      notes <<-'NOTE'
#### Get PHP version
```
php -v
```

#### Get enabled PHP module
```
php -m
```

#### Get PHP ini information
```
php -i
```
      NOTE
    end

    entry do
      name '### PHP | Enable `mcrypt` module'
      notes <<-'NOTE'
#### Enable module
```
php5enmod mcrypt
```

#### Restart apache2 service
```
service apache2 restart
```
      NOTE
    end
  end

end
