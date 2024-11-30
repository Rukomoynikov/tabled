# Tabled

[![Gem Version](https://badge.fury.io/rb/tabled.svg)](https://badge.fury.io/rb/tabled) ![CI is pasing for ruby 2.6 - 3.0](https://github.com/rukomoynikov/tabled/actions/workflows/linters.yml/badge.svg) ![Downloads](https://badgen.net/rubygems/dt/tabled)

Tabled is a versatile gem designed for rendering tabular data in a console. It offers various features to make data presentation simple and customizable.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Options](#options)
- [Examples](#examples)
- [Exporting Data](#exporting-data)
- [Printing CSV or JSON Files](#printing-csv-or-json-files)
- [Contributing](#contributing)

## Installation
```shell
bundle add tabled
# or
gem install tabled
```

## Usage
To use Tabled in your application, follow these steps:
1. Require the gem in your code:
   ```ruby
   require 'tabled'
   ```
2. Pass an array of rows to the application. Each row can contain any number of columns and optional footer text.

## Options
Tabled accepts the following options:

- `framed` (optional, default: true): Specify if the output should have frames.
- `row_separator` (optional, default: "-"): Set the character for row separators or set it to nil if you don't want to separate rows.
- `titles` (optional): Provide a list of column titles.

## Examples
Here are some examples to help you get started:

### Simple Data Structure

```ruby
data = [
  ["Helena", "20 years", "Female"],
  ["John", "18 years", "Male"],
  ["Alan", "23 years", "Male"],
]

Tabled.new(data, framed: false, row_separator: nil).print_to_console

Helena 20 years Female
John   18 years Male
Alan   23 years Male
```

### Using Footer Inside a Row

```ruby
data = [
  ["Helena", "20 years", "Female"],
  ["John", "18 years", "Male", { footer: "Legendary assassin John Wick (Keanu Reeves)." }],
  ["Alan", "23 years", "Male"],
]

Tabled.new(data, row_separator: nil).print_to_console

| Helena 20 years Female                       |
| John   18 years Male                         |
| Legendary assassin John Wick (Keanu Reeves). |
| Alan   23 years Male                         |
```

### Print Ruby CSV records

```ruby
csv = CSV.parse(<<~ROWS, headers: true)
  Bob,Engineering,1000
  Jane,Sales,2000
  John,Management,5000
ROWS

Tabled.from_csv(csv: csv, framed: true).print_to_console

| Bob  Engineering 1000 |
-------------------------
| Jane Sales       2000 |
-------------------------
| John Management  5000 |
-------------------------
```

## Exporting Data

You can export the data in CSV or JSON formats. By default, the file is saved in the current directory with the file name "tabled.csv" (CSV format).

```ruby
# Export to CSV
Tabled.new(data).export_to_file

# Export to JSON
Tabled.new(data, titles: ['Name', 'Age', 'Gender']).export_to_file(format: :json)

# Customize file name
Tabled.new(data, titles: ['Name', 'Age', 'Gender']).export_to_file(file_name: 'my_file.json')
```

## Printing CSV or JSON Files

As part of the gem, the *tabled* binary is included. You can run it like this:

```shell
tabled print path_to_[csv|json]_file
```

# Contributing
1. Fork it ( http://github.com/rukomoynikov/tabled/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

# Development process in Docker

Run `docker compose run --build --rm app bash` to get full packed dev environment for the gem developing.
