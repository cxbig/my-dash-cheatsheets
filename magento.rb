cheatsheet do
  title 'Magento'
  docset_file_name 'magento'
  keyword 'mage'

  introduction <<-'NOTE'
This is collection of Magento, list all shortcuts
  NOTE

  category do
    id 'MySQL snapshot'

    entry do
      name '### Base URL'
      notes <<-'NOTE'
```
UPDATE `core_config_data`
SET `value` = '{{base_url}}'
WHERE `scope` = 'default'
  AND `path` in ('web/unsecure/base_url', 'web/secure/base_url');
```
      NOTE
    end
  end

  category do
    id 'Session'

    entry do
      name '### Get quote session'
      notes <<-'NOTE'
#### Front-end
```
Mage::getSingleton('checkout/session')->getQuote();
```

#### Admin
```
Mage::getSingleton('adminhtml/session_quote')->getQuote();
```
      NOTE
    end
  end

  category do
    id 'System'

    entry do
      name '### Config validation'
      notes <<-'NOTE'
#### Validation

For each field, you can add a Validation definition

```
<validate>...</validate>
```
      NOTE
    end

    entry do
      name '### Config validation list'
      notes <<-'NOTE'
#### Validation list

```
validate-number
validate-zero-or-greater
```

_to be continue..._
      NOTE
    end
  end
end
