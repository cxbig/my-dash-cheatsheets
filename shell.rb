cheatsheet do
  title 'Shell commands'
  docset_file_name 'shell'
  keyword 'shell'

  introduction 'Record anything about shell'

  category do
    id 'wget'

    entry do
      name '### Default usage'
      notes <<-'NOTES'
```
wget URL
```
      NOTES
    end

    entry do 
      name '### Restrict redirect'
      notes <<-'NOTES'
```
wget --max-redirect=0 URL
```
      NOTES
    end
  end
end