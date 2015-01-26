cheatsheet do
  title 'MySQL'
  docset_file_name 'mysql'
  keyword 'cxbig_mysql'

  introduction <<-'NOTE'
> MySQL snippets
  NOTE

  category do
    id 'Command line skills'

    entry do 
      name '### Import database with SQL file'
      notes <<-'NOTE'
```
mysql -uroot -proot sample_db < sample_db.sql
```
      NOTE
    end

    entry do 
      name '### Import database with Gzip file'
      notes <<-'NOTE'
```
gunzip < sample_db.sql.gz | mysql -uroot -proot sample_db
```
      NOTE
    end 

    entry do 
      name '### Export database to SQL file'
      notes <<-'NOTE'
```
mysqldump -uroot -proot sample_db > sample_db.sql
```
      NOTE
    end

    entry do 
      name '### Export database with gzip compress'
      notes <<-'NOTE'
```
mysqldump -uroot -proot sample_db | gzip -9 > sample_db.sql.gz
```
      NOTE
    end


  end

end