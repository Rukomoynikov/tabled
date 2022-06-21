
[![Gem Version](https://badge.fury.io/rb/tabled.svg)](https://badge.fury.io/rb/tabled) ![CI is pasing for ruby 2.6 - 3.0](https://github.com/rukomoynikov/tabled/actions/workflows/linters.yml/badge.svg) ![Downloads](https://badgen.net/rubygems/dt/tabled)


# Description
Library can be used to render your data to a console. Though it's quite simple, but has many features. 

# How to use
1. Install the gem `bundle add tabled` or `gem install tabled`
2. Add to the application `require 'tabled''`
3. Pass to the application array of rows. Each row may have any amount of columns and optional footer text.

### Params for Tabled instance
Tabled accepts two params. Data which is prohibited and options.   
Available options:
1. `framed` - optional, default is true
2. `row_separator` - optional, default is `-`. Can be `nil` if you don't need separate rows.
3. `titles` - optional parameter with list of columns titles

More examples in [demo.rb](./demo.rb)

### Simple data structure
```ruby
data = [
  ["Helena", "20 years", "Female"],
  ["John", "18 years", "Male"],
  ["Alan", "23 years", "Male"],
]

Tabled.new(data, framed: false, 
           row_separator: nil).print_to_console
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
  ["John", "18 years", "Male", { footer: "Legendary assassin John Wick (Keanu Reeves)." }],
  ["Alan", "23 years", "Male"],
]

Tabled.new(data, row_separator: nil).print_to_console
```

Result
```shell
----------------------------------------------------------------
| Helena 20 years Female                                       |
| John   18 years Male                                         |
| Legendary assassin John Wick (Keanu Reeves).                 |
| Alan   23 years Male                                         |
----------------------------------------------------------------
```

# Printing CSV files to console
As a part of the gem `tabled` binary is included. So, you can basicaly run it like:
```shell
tabled print path_to_csv_file
```

# Contributing
1. Fork it ( http://github.com/rukomoynikov/tabled/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
