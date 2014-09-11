cheatsheet do
  title 'Magento'
  docset_file_name 'magento'
  keyword 'mage'

  introduction <<-'NOTE'
This is collection of Magento, list all shortcuts
  NOTE

  category do
    id 'Session'

    entry do
      name '### Quote session'
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
end
