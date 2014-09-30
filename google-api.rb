cheatsheet do
  title 'Google API'
  docset_file_name 'google-api'
  keyword 'gapi'

  introduction <<-'NOTE'
This cheatsheet contains everything for Google API
  NOTE

  category do
    id 'Map | Basis'
  end

  category do
    id 'Map | Utilities'

    entry do
      name '### Bind Google Map auto-complete function to input box'
      notes <<-'NOTE'
#### Add Google Map API script in head
```
  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
```

#### Then, add bind script after the input box
```
  function initialize() {
    var input = document.getElementById('searchTextField');
    var autocomplete = new google.maps.places.Autocomplete(input);
  }

  google.maps.event.addDomListener(window, 'load', initialize);
```
      NOTE
    end
  end

end
