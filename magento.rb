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
      name '### Common initialize'
      notes <<-'NOTE'
```
UPDATE `core_config_data` SET `value` = '{{base_url}}' WHERE `path` LIKE 'web%base_url';
UPDATE `core_config_data` SET `value` = 'dev@cxbig.info' WHERE `value` LIKE '%@%';
```
      NOTE
    end

    entry do
      name '### Admin template hints'
      notes <<-'NOTE'
#### Open hints
```
INSERT INTO core_config_data (`scope`, `scope_id`, `path`, `value`) SELECT 'websites', website_id, 'dev/debug/template_hints', 1 FROM core_store WHERE website_id <> 0 ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
INSERT INTO core_config_data (`scope`, `scope_id`, `path`, `value`) SELECT 'websites', website_id, 'dev/debug/template_hints_blocks', 1 FROM core_store WHERE website_id <> 0 ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
```

#### Close hints
```
INSERT INTO core_config_data (`scope`, `scope_id`, `path`, `value`) SELECT 'websites', website_id, 'dev/debug/template_hints', 0 FROM core_store WHERE website_id <> 0 ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
INSERT INTO core_config_data (`scope`, `scope_id`, `path`, `value`) SELECT 'websites', website_id, 'dev/debug/template_hints_blocks', 0 FROM core_store WHERE website_id <> 0 ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
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

  category do
    id 'Extension'

    entry do 
      name '### Shipping methods'
      notes <<-'NOTE'
- [Owebia Shipping 2](http://www.magentocommerce.com/magento-connect/owebia-shipping-2.html)
      NOTE
    end
  end


end
