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
```sql
UPDATE `core_config_data` SET `value` = '{{base_url}}' WHERE `path` LIKE 'web%base_url';
UPDATE `core_config_data` SET `value` = 'dev@cxbig.info' WHERE `value` LIKE '%@%';
UPDATE `core_config_data` SET `value` = '86400' WHERE `path` = 'admin/security/session_cookie_lifetime';
UPDATE `core_config_data` SET `value` = 1 WHERE `path` = 'design/head/demonotice';
UPDATE `core_cache_option` SET `value` = 0;
UPDATE `admin_user` SET `password` = 'cff47226563c170d12b798dc0949b704fdee59d0646d47678efaf61e98862028:lj' WHERE `username` = 'admin'; -- admin password is 'admin123'
```

#### Admin security
```sql
INSERT INTO `core_config_data` (`scope`, `scope_id`, `path`, `value`) VALUES ('default', 0, 'admin/security/session_cookie_lifetime', 8640000), ('default', 0, 'admin/security/lockout_failures', 0), ('default', 0, 'admin/security/password_lifetime', 36500) ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
```
      NOTE
    end

    entry do
      name '### Admin template hints'
      notes <<-'NOTE'
#### Open hints
```sql
INSERT INTO core_config_data (`scope`, `scope_id`, `path`, `value`) SELECT 'websites', website_id, 'dev/debug/template_hints', 1 FROM core_store WHERE website_id <> 0 ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
INSERT INTO core_config_data (`scope`, `scope_id`, `path`, `value`) SELECT 'websites', website_id, 'dev/debug/template_hints_blocks', 1 FROM core_store WHERE website_id <> 0 ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);
```

#### Close hints
```sql
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

```xml
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
```sql
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

    entry do
      name '### Configurable product super attribute check'
      notes <<-'NOTE'
```sql
SELECT
  `p`.`entity_id`,
  `p`.`sku`,
  concat(
      if(`p`.`has_options` = 1, 'Y', 'N'),
      '|',
      if(`p`.`required_options` = 1, 'Y', 'N')
  ) 'has_and_required_options',
  concat('[', `se`.`attribute_set_id`, ']', `se`.`attribute_set_name`),
  group_concat(
      concat('[', `su`.`attribute_id`, ']', `a`.`attribute_code`)
      ORDER BY `su`.`attribute_id` ASC
      SEPARATOR ' | '
  ) 'super_attributes'
FROM
  `catalog_product_super_attribute` `su`
  JOIN
  `catalog_product_entity` `p`
    ON `p`.`entity_id` = `su`.`product_id`
      AND `p`.`type_id` = 'configurable'
  JOIN
  `eav_attribute_set` `se`
    ON `se`.`attribute_set_id` = `p`.`attribute_set_id`
  JOIN
  `eav_attribute` `a`
    ON `a`.`attribute_id` = `su`.`attribute_id`
WHERE
  `su`.`product_id` IN ( ** your product ids ** )
GROUP BY
  `su`.`product_id`
ORDER BY
  `p`.`attribute_set_id` ASC;
```
      NOTE
    end

    entry do
      name '### Find product by url_key'
      notes <<-'NOTE'
```sql
SELECT
  `p`.`entity_id`,
  `p`.`sku`,
  `u`.`store_id`,
  `u`.`value` 'url_key'
FROM
  `catalog_product_entity_varchar` `u`
  JOIN
  `catalog_product_entity` `p`
    ON `p`.`entity_id` = `u`.`entity_id`
WHERE
  `u`.`value` LIKE '% **your url_key** %';
```
      NOTE
    end

    entry do
      name '### Check product special price'
      notes <<-'NOTE'
```sql
SELECT
  `p`.`entity_id`                      AS 'ID',
  `p`.`sku`                            AS 'SKU',
  `price_decimal`.`value`              AS 'Price',
  `special_price_decimal`.`value`      AS 'Special Price',
  `special_from_date_datetime`.`value` AS 'Special Price From Date',
  `special_to_date_datetime`.`value`   AS 'Special Price To Date'

FROM `catalog_product_entity` `p`
  # Join price
  JOIN `catalog_product_entity_decimal` AS `price_decimal`
    ON `price_decimal`.`entity_id` = `p`.`entity_id` AND `price_decimal`.`store_id` = 0
  JOIN `eav_attribute` AS `price_eav`
    ON `price_eav`.`attribute_id` = `price_decimal`.`attribute_id` AND
       `price_eav`.`attribute_code` = 'price'

  # Join special_price
  JOIN `catalog_product_entity_decimal` AS `special_price_decimal`
    ON `special_price_decimal`.`entity_id` = `p`.`entity_id` AND `special_price_decimal`.`store_id` = 0
  JOIN `eav_attribute` AS `special_price_eav`
    ON `special_price_eav`.`attribute_id` = `special_price_decimal`.`attribute_id` AND
       `special_price_eav`.`attribute_code` = 'special_price'

  # Join special_from_date
  JOIN `catalog_product_entity_datetime` AS `special_from_date_datetime`
    ON `special_from_date_datetime`.`entity_id` = `p`.`entity_id` AND `special_from_date_datetime`.`store_id` = 0
  JOIN `eav_attribute` AS `special_from_date_eav`
    ON `special_from_date_eav`.`attribute_id` = `special_from_date_datetime`.`attribute_id` AND
       `special_from_date_eav`.`attribute_code` = 'special_from_date'

  # Join special_to_date
  JOIN `catalog_product_entity_datetime` AS `special_to_date_datetime`
    ON `special_to_date_datetime`.`entity_id` = `p`.`entity_id` AND `special_to_date_datetime`.`store_id` = 0
  JOIN `eav_attribute` AS `special_to_date_eav`
    ON `special_to_date_eav`.`attribute_id` = `special_to_date_datetime`.`attribute_id` AND
       `special_to_date_eav`.`attribute_code` = 'special_to_date'

WHERE `p`.`entity_id` = ?;
```
      NOTE
    end

    entry do
      name '### Cron Schedule Statistic'
      notes <<-'MD'
#### Run this SQL to show each cron job execution status

```sql
SELECT
  `job_code` 'job code',
  concat(floor(round(avg(UNIX_TIMESTAMP(`finished_at`) - UNIX_TIMESTAMP(`executed_at`))) / 60), ':', lpad(round(avg(UNIX_TIMESTAMP(`finished_at`) - UNIX_TIMESTAMP(`executed_at`))) % 60, 2, 0)) 'Average Execution Time (sec)',
  count(`executed_at`) 'executed',
  count(`finished_at`) 'finished',
  concat(round(count(`finished_at`) / count(`executed_at`) * 100, 2), ' %') 'successful rate'
FROM
  `cron_schedule`
GROUP BY
  `job_code`
ORDER BY
  `job_code`;
```
      MD
    end

  end


  category do
    id 'PHP version issue'

    entry do
      name '### iconv\_set\_encoding error after PHP 5.6'
      notes <<-'MD'
```php
// UTF-8

if (PHP_VERSION_ID < 50600) {
    iconv_set_encoding('internal_encoding', 'UTF-8');
} else {
    ini_set('global_charset', 'UTF-8');
}

// $origenc

if (PHP_VERSION_ID < 50600) {
    iconv_set_encoding('internal_encoding', $origenc);
} else {
    ini_set('global_charset', $origenc);
}

// $oenc

if (PHP_VERSION_ID < 50600) {
    iconv_set_encoding('internal_encoding', $oenc);
} else {
    ini_set('global_charset', $oenc);
}
```
      MD
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
