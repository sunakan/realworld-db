# Migration

```
$ make up
$ make bash

# Containerå†…
$ bundle install
$ bundle exec ridgepole --config config/database.yaml --file db/Schemafile --apply
```

# Export
```
$ make up
$ make bash

# Containerå†…
$ bundle exec ridgepole -c config/database.yaml --export -o db/Schemafile
```
