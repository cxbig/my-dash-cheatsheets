cheatsheet do
  title 'n98-magerun.phar'
  docset_file_name 'n98-magerun'
  keyword 'n98'

  introduction <<-'NOTE'
**n98-magerun.phar** is a powerful Magento CLI tool

Github: [netz98/n98-magerun](https://github.com/netz98/n98-magerun)

version: `1.91.0`
  NOTE

  category do
    id 'Usage'

    entry do
      name 'Download'
      notes <<-'NOTE'
#### Use wget
```
wget https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar
```

#### Use curl
```
curl -o n98-magerun.phar https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar
```
      NOTE
    end

    entry do
      name 'Usage'
      notes <<-'NOTE'
```
/path/to/n98-magerun.phar [options] command [argument]
```
      NOTE
    end
  end

  category do
    id 'Common options'

    entry do
      command '--help'
      command '-h'
      name 'Display this help message.'
    end

    entry do
      command '--quiet'
      command '-q'
      name 'Do not output any message.'
    end

    entry do
      command '--verbose'
      command '--v|vv|vvv'
      name 'Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug.'
    end

    entry do
      command '--version'
      command '-V'
      name 'Display this application version.'
    end

    entry do
      command '--ansi'
      name 'Force ANSI output.'
    end

    entry do
      command '--no-ansi'
      name 'Disable ANSI output.'
    end

    entry do
      command '--no-interaction'
      command '-n'
      name 'Do not ask any interactive question.'
    end

    entry do
      command '--root-dir'
      name 'Force magento root dir. No auto detection.'
    end

    entry do
      command '--skip-config'
      name 'Do not load any custom config.'
    end
  end

  category do
    id 'Available commands'

    entry do
      command 'help'
      name 'Displays help for a command'
    end

    entry do
      command 'install'
      name 'Install magento'
    end

    entry do
      command 'list'
      name 'Lists commands'
    end

    entry do
      command 'mysql-client'
      name 'Opens mysql client by database config from `local.xml`'
    end

    entry do
      command 'open-browser'
      name 'Open current project in browser _(experimental)_'
    end

    entry do
      command 'script'
      name 'Runs multiple n98-magerun command'
    end

    entry do
      command 'self-update'
      command 'selfupdate'
      name 'Updates `n98-magerun.phar` to the latest version.'
    end

    entry do
      command 'shell'
      name 'Runs n98-magerun as shell'
    end

    entry do
      command 'uninstall'
      name 'Uninstall magento (drops database and empties current folder or folder set via installationFolder)'
    end
  end

  category do
    id 'Admin'

    entry do
      command 'admin:notifications'
      name 'Toggles admin notifications'
    end

    entry do
      command 'admin:user:change-password'
      name 'Changes the password of a adminhtml user.'
    end

    entry do
      command 'admin:user:create'
      name 'Create admin user.'
    end

    entry do
      command 'admin:user:delete'
      name 'Delete the account of a adminhtml user.'
    end

    entry do
      command 'admin:user:list'
      name 'List admin users.'
    end
  end

  category do
    id 'Cache'

    entry do
      command 'cache:clean'
      name 'Clean magento cache'
    end

    entry do
      command 'cache:disable'
      name 'Disables magento caches'
    end

    entry do
      command 'cache:enable'
      name 'Enables magento caches'
    end

    entry do
      command 'cache:flush'
      name 'Flush magento cache storage'
    end

    entry do
      command 'cache:list'
      name 'Lists all magento caches'
    end

    entry do
      command 'cache:report'
      name 'View inside the cache'
    end

    entry do
      command 'cache:view'
      name 'Prints a cache entry'
    end
  end

  category do
    id 'Composer'

    entry do
      command 'composer:diagnose'
      name 'Diagnoses the system to identify common errors.'
    end

    entry do
      command 'composer:init'
      name 'Creates a basic `composer.json` file in current directory.'
    end

    entry do
      command 'composer:install'
      name 'Installs the project dependencies from the `composer.lock` file if present, or falls back on the `composer.json`.'
    end

    entry do
      command 'composer:require'
      name 'Adds required packages to your `composer.json` and installs them.'
    end

    entry do
      command 'composer:search'
      name 'Search for packages.'
    end

    entry do
      command 'composer:update'
      name 'Updates your dependencies to the latest version according to `composer.json`, and updates the `composer.lock` file.'
    end

    entry do
      command 'composer:validate'
      name 'Validates a `composer.json`'
    end
  end

  category do
    id 'Config'

    entry do
      command 'config:delete'
      name 'Deletes a store config item'
    end

    entry do
      command 'config:dump'
      name 'Dump merged xml config'
    end

    entry do
      command 'config:get'
      name 'Get a core config item'
    end

    entry do
      command 'config:search'
      name 'Search system configuration descriptions.'
    end

    entry do
      command 'config:set'
      name 'Set a core config item'
    end
  end

  category do
    id 'Customer'

    entry do
      command 'customer:change-password'
      name 'Changes the password of a customer.'
      notes <<-'NOTE'
#### Usage:
```
 customer:change-password [email] [password] [website]
```

#### Arguments:
```
 email                 Email
 password              Password
 website               Website of the customer
```
      NOTE
    end

    entry do
      command 'customer:create'
      name 'Creates a new customer/user for shop frontend.'
    end

    entry do
      command 'customer:create:dummy'
      name 'Generate dummy customers. You can specify a count and a locale.'
    end

    entry do
      command 'customer:delete'
      name 'Delete Customer/s'
    end

    entry do
      command 'customer:info'
      name 'Loads basic customer info by email address.'
    end

    entry do
      command 'customer:list'
      name 'Lists customers'
    end
  end

  category do
    id 'DB'

    entry do
      command 'db:console'
      name 'Opens mysql client by database config from `local.xml`'
    end

    entry do
      command 'db:create'
      name 'Create currently configured database'
    end

    entry do
      command 'db:drop'
      name 'Drop current database'
    end

    entry do
      command 'db:dump'
      name 'Dumps database with mysqldump cli client according to informations from `local.xml`'
    end

    entry do
      command 'db:info'
      name 'Dumps database informations'
    end

    entry do
      command 'db:import'
      name 'Imports database with mysql cli client according to database defined in `local.xml`'
    end

    entry do
      command 'db:maintain:check-tables'
      name 'Check database tables'
    end

    entry do
      command 'db:query'
      name 'Executes an SQL query on the database defined in `local.xml`'
    end
  end

  category do
    id 'Design'

    entry do
      command 'design:demo-notice'
      name 'Toggles demo store notice for a store view'
    end
  end

  category do
    id 'Dev'

    entry do
      command 'dev:class:lookup'
      name 'Resolves a grouped class name'
    end

    entry do
      command 'dev:code:model:method'
      name 'Code annotations: Reads the columns from a table and writes the getter and setter methods into the class file for `@methods`.'
    end

    entry do
      command 'dev:console'
      name 'Opens PHP interactive shell with initialized `Mage::app()` _(Experimental)_'
    end

    entry do
      command 'dev:ide:phpstorm:meta'
      name 'Generates meta data file for `PhpStorm` auto completion'
    end

    entry do
      command 'dev:log'
      name 'Toggle development log (`system.log`, `exception.log`)'
    end

    entry do
      command 'dev:log:db'
      name 'Turn on/off database query logging'
    end

    entry do
      command 'dev:log:size'
      name 'Get size of log file'
    end

    entry do
      command 'dev:module:create'
      name 'Create and register a new magento module.'
      notes <<-'NOTE'
#### Usage:

```
 dev:module:create [options] vendorNamespace moduleName [codePool]
```

#### Arguments:

```
 vendorNamespace       Namespace (your company prefix)
 moduleName            Name of your module.
 codePool              Codepool (local,community) (default: "local")
```

#### Options:

```
 --add-blocks          Adds blocks
 --add-helpers         Adds helpers
 --add-models          Adds models
 --add-setup           Adds SQL setup
 --add-all             Adds blocks, helpers and models
 --modman              Create all files in folder with a modman file.
 --add-readme          Adds a readme.md file to generated module
 --add-composer        Adds a composer.json file to generated module
 --author-name         Author for readme.md or composer.json
 --author-email        Author for readme.md or composer.json
 --description         Description for readme.md or composer.json
```
      NOTE
    end

    entry do
      command 'dev:module:dependencies:from'
      name 'Show list of modules which depend on %s module'
    end

    entry do
      command 'dev:module:dependencies:on'
      name 'Show list of modules which given module depends on'
    end

    entry do
      command 'dev:module:list'
      name 'List all installed modules'
    end

    entry do
      command 'dev:module:observer:list'
      name 'Lists all registered observers'
    end

    entry do
      command 'dev:module:rewrite:conflicts'
      name 'Lists all magento rewrite conflicts'
    end

    entry do
      command 'dev:module:rewrite:list'
      name 'Lists all magento rewrites'
    end

    entry do
      command 'dev:profiler'
      name 'Toggles profiler for debugging'
    end

    entry do
      command 'dev:report:count'
      name 'Get count of report files'
    end

    entry do
      command 'dev:setup:script:attribute'
      name 'Creates attribute script for a given attribute code'
    end

    entry do
      command 'dev:symlinks'
      name 'Toggle allow symlinks setting'
    end

    entry do
      command 'dev:template-hints'
      name 'Toggles template hints'
      notes <<-'NOTE'
#### Usage:
```
 dev:template-hints [--on] [--off] [store]
```

#### Arguments:
```
 store                 Store code or ID
```

#### Options:
```
 --on                  Switch on
 --off                 Switch off
```
      NOTE
    end

    entry do
      command 'dev:template-hints-blocks'
      name 'Toggles template hints block names'
    end

    entry do
      command 'dev:theme:duplicates'
      name 'Find duplicate files (templates, layout, locale, etc.) between two themes.'
    end

    entry do
      command 'dev:theme:list'
      name 'Lists all available themes'
    end

    entry do
      command 'dev:translate:admin'
      name 'Toggle inline translation tool for admin'
    end

    entry do
      command 'dev:translate:export'
      name 'Export inline translations'
    end

    entry do
      command 'dev:translate:set'
      name 'Adds a translation to core_translate table. _Globally for locale_'
    end

    entry do
      command 'dev:translate:shop'
      name 'Toggle inline translation tool for shop'
    end
  end

  category do
    id 'EAV'

    entry do
      command 'eav:attribute:list'
      name 'Lists all EAV attributes'
    end

    entry do
      command 'eav:attribute:remove'
      name 'Removes attribute for a given attribute code'
    end

    entry do
      command 'eav:attribute:view'
      name 'View informations about an EAV attribute'
    end
  end

  category do
    id 'Extension'

    entry do
      command 'extension:download'
      name 'Download magento-connect package'
    end

    entry do
      command 'extension:install'
      name 'Install magento-connect package'
    end

    entry do
      command 'extension:list'
      name 'List magento connection extensions'
    end

    entry do
      command 'extension:search'
      name 'Search magento connection extensions'
    end

    entry do
      command 'extension:upgrade'
      name 'Upgrade magento-connect package'
    end

    entry do
      command 'extension:validate'
      name 'Reads Magento Connect Config, and checks that installed package files are really there'
    end
  end

  category do
    id 'Index'

    entry do
      command 'index:list'
      name 'Lists all magento indexes'
    end

    entry do
      command 'index:reindex'
      name 'Reindex a magento index by code'
    end

    entry do
      command 'index:reindex:all'
      name 'Reindex all magento indexes'
    end
  end

  category do
    id 'Local-config'

    entry do
      command 'local-config:generate'
      name 'Generates `local.xml` config'
    end
  end

  category do
    id 'Media'

    entry do
      command 'media:dump'
      name 'Creates an archive with content of media folder.'
    end
  end

  category do
    id 'Script'

    entry do
      command 'script:repo:list'
      name 'Lists all scripts in repository'
    end

    entry do
      command 'script:repo:run'
      name 'Run script from repository'
    end
  end

  category do
    id 'System'

    entry do
      command 'sys:check'
      name 'Checks Magento System'
    end

    entry do
      command 'sys:cron:history'
      name 'Last executed cronjobs with status.'
    end

    entry do
      command 'sys:cron:list'
      name 'Lists all cronjobs'
    end

    entry do
      command 'sys:cron:run'
      name 'Runs a cronjob by job code'
    end

    entry do
      command 'sys:info'
      name 'Prints infos about the current magento system.'
    end

    entry do
      command 'sys:maintenance'
      name 'Toggles maintenance mode.'
    end

    entry do
      command 'sys:modules:list'
      name 'List all installed modules'
    end

    entry do
      command 'sys:setup:change-version'
      name 'Change module setup resource version'
    end

    entry do
      command 'sys:setup:compare-versions'
      name 'Compare module version with `core_resource` table.'
    end

    entry do
      command 'sys:setup:incremental'
      name 'List new setup scripts to run, then runs one script'
    end

    entry do
      command 'sys:setup:run'
      name 'Runs all new setup scripts.'
    end

    entry do
      command 'sys:store:config:base-url:list'
      name 'Lists all base urls'
    end

    entry do
      command 'sys:store:list'
      name 'Lists all installed store-views'
    end

    entry do
      command 'sys:url:list'
      name 'Get all urls.'
    end

    entry do
      command 'sys:website:list'
      name 'Lists all websites'
    end
  end
end
