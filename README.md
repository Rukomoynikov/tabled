[![Gem Version](https://badge.fury.io/rb/tabled.svg)](https://badge.fury.io/rb/tabled)

# Description
This library can be used to render your data to a console. It's quite simple and has many features

# How to use
1. Install the gem `bundle add tabled` or `gem install tabled`
2. Add to the application `require 'tabled''`
3. Pass to the application array of rows. Each row may have any amount of columns and optional footer text.

### Simple data structure
```ruby
data = [
  ["Helena", "20 years", "Female"],
  ["John", "18 years", "Male"],
  ["Alan", "23 years", "Male"],
]

Tabled.new(data).print_to_console
```

Result
```shell
Helena  20 years  Female
John    18 years  Male
Alan    23 years  Male
```

### Using footer inside a row
```ruby
data = [
  ["Helena", "20 years", "Female"],
  ["John", "18 years", "Male", { footer: "Legendary assassin John Wick (Keanu Reeves) retired from his violent career after marrying the love of his life." }],
  ["Alan", "23 years", "Male"],
]

Tabled.new(data).print_to_console
```

Result
```shell
Helena  20 years  Female

John    18 years  Male
Legendary assassin John Wick.

Alan    23 years  Male
```

# Contributing
1. Fork it ( http://github.com/rodhilton/console_table/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request