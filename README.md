# README

1) Script to apply applications to each wholesaler for testing purposes
```
Wholesaler.all.each do |wholesaler|
  wholesaler.templates.create(class_name: 'JimcorDwellingApplication', title: 'Jimcor Dwelling Insurance Application')
end
```


