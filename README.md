# lmdb.cr

Lmdb client for [Crystal](http://crystal-lang.org/).

- crystal: 0.20.0

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  lmdb.cr:
    github: maiha/lmdb.cr
```

## Usage


```crystal
require "lmdb"

env = Lmdb::Environment.new("foo")
...
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/maiha/lmdb.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) maiha - creator, maintainer
