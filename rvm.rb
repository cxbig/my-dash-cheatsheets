cheatsheet do
  title 'RVM'
  docset_file_name 'rvm'
  keyword 'rvm'

  introduction <<-'NOTES'
About how to use RVM

This cheatsheet comes from [http://cheat.errtheblog.com/s/rvm](http://cheat.errtheblog.com/s/rvm)
  NOTES

  category do
    id 'Installation'

    entry do
      name '### Install RVM'
      notes <<-'NOTES'
See [https://rvm.io/rvm/install/](https://rvm.io/rvm/install/)

```
curl -L get.rvm.io | bash -s stable
```

On `OS X` you can use `RailsInstaller` which will bring all dependencies for you:

- installer: [https://github.com/railsinstaller/railsinstaller-nix/downloads](https://github.com/railsinstaller/railsinstaller-nix/downloads)
- background: [http://www.engineyard.com/blog/2012/railsinstaller-for-os-x/](http://www.engineyard.com/blog/2012/railsinstaller-for-os-x/)
      NOTES
    end
  end

end