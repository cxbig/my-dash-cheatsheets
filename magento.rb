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
#### Base URL
```
UPDATE `core_config_data` SET `value` = '{{base_url}}' WHERE `path` LIKE 'web%base_url';
UPDATE `core_config_data` SET `value` = 'dev@cxbig.info' WHERE `value` LIKE '%@%';
UPDATE `core_config_data` SET `value` = '86400' WHERE `path` = 'admin/security/session_cookie_lifetime';
```

#### Admin security
```
INSERT INTO `core_config_data` (`scope`, `scope_id`, `path`, `value`) VALUES ('default', 0, 'admin/security/session_cookie_lifetime', 8640000), ('default', 0, 'admin/security/lockout_failures', 0), ('default', 0, 'admin/security/password_lifetime', 36500) ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
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
    id 'SQL'

    entry do
      name '### Product list with attribute'
      notes <<-'NOTE'
```
SELECT
  `cpe`.`entity_id` 'product id',
  `cpe`.`sku` 'sku',
  `eav_attribute_set`.`attribute_set_name` 'product type',
  `cpev_name`.`value` 'product name',
  concat(`cpei_o_brand`.`value`, '|', `eaov_o_brand`.`value`) 'o_brand',
  concat(`cpei_o_ligne`.`value`, '|', `eaov_o_ligne`.`value`) 'o_ligne',
  concat(`cpei_o_color_configurable`.`value`, '|', `eaov_o_color_configurable`.`value`) 'o_color_configurable'

FROM `catalog_product_entity` `cpe`
  JOIN `eav_attribute_set`
    ON `eav_attribute_set`.`attribute_set_id` = `cpe`.`attribute_set_id`

  JOIN `catalog_product_entity_varchar` `cpev_name`
    ON `cpe`.`entity_id` = `cpev_name`.`entity_id`
      AND `cpev_name`.`store_id` = 0
  JOIN `eav_attribute` `ea_name`
    ON `ea_name`.`attribute_id` = `cpev_name`.`attribute_id`
      AND `ea_name`.`attribute_code` = 'name'

  JOIN `catalog_product_entity_int` `cpei_o_brand`
    ON `cpe`.`entity_id` = `cpei_o_brand`.`entity_id`
      AND `cpei_o_brand`.`store_id` = 0
  JOIN `eav_attribute` `ea_o_brand`
    ON `ea_o_brand`.`attribute_id` = `cpei_o_brand`.`attribute_id`
      AND `ea_o_brand`.`attribute_code` = 'o_brand'
  JOIN `eav_attribute_option_value` `eaov_o_brand`
    ON `cpei_o_brand`.`store_id` = `eaov_o_brand`.`store_id`
      AND `cpei_o_brand`.`value` = `eaov_o_brand`.`option_id`

  JOIN `catalog_product_entity_int` `cpei_o_ligne`
    ON `cpe`.`entity_id` = `cpei_o_ligne`.`entity_id`
      AND `cpei_o_ligne`.`store_id` = 0
  JOIN `eav_attribute` `ea_o_ligne`
    ON `ea_o_ligne`.`attribute_id` = `cpei_o_ligne`.`attribute_id`
      AND `ea_o_ligne`.`attribute_code` = 'o_ligne'
  JOIN `eav_attribute_option_value` `eaov_o_ligne`
    ON `cpei_o_ligne`.`store_id` = `eaov_o_ligne`.`store_id`
      AND `cpei_o_ligne`.`value` = `eaov_o_ligne`.`option_id`

  JOIN `catalog_product_entity_int` `cpei_o_color_configurable`
    ON `cpe`.`entity_id` = `cpei_o_color_configurable`.`entity_id`
      AND `cpei_o_color_configurable`.`store_id` = 0
  JOIN `eav_attribute` `ea_o_color_configurable`
    ON `ea_o_color_configurable`.`attribute_id` = `cpei_o_color_configurable`.`attribute_id`
      AND `ea_o_color_configurable`.`attribute_code` = 'o_color_configurable'
  JOIN `eav_attribute_option_value` `eaov_o_color_configurable`
    ON `cpei_o_color_configurable`.`store_id` = `eaov_o_color_configurable`.`store_id`
      AND `cpei_o_color_configurable`.`value` = `eaov_o_color_configurable`.`option_id`

WHERE `cpe`.`entity_id` IN ( product_ids );
```
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
