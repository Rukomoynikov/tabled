# frozen_string_literal: true

require_relative './lib/tabled'

STAR_WARS_CHARACTERS = [
  {
    name: 'Luke Skywalker',
    height: '172',
    mass: '77',
    hair_color: 'blond',
    skin_color: 'fair',
    eye_color: 'blue',
    birth_year: '19BBY',
    gender: 'male'
  },
  {
    name: 'C-3PO',
    height: '167',
    mass: '75',
    hair_color: 'n/a',
    skin_color: 'gold',
    eye_color: 'yellow',
    birth_year: '112BBY',
    gender: 'n/a'
  },
  {
    name: 'R2-D2',
    height: '96',
    mass: '32',
    hair_color: 'n/a',
    skin_color: 'white, blue',
    eye_color: 'red',
    birth_year: '33BBY',
    gender: 'n/a'
  },
  {
    name: 'Darth Vader',
    height: '202',
    mass: '136',
    hair_color: 'none',
    skin_color: 'white',
    eye_color: 'yellow',
    birth_year: '41.9BBY',
    gender: 'male'
  },
  {
    name: 'Leia Organa',
    height: '150',
    mass: '49',
    hair_color: 'brown',
    skin_color: 'light',
    eye_color: 'brown',
    birth_year: '19BBY',
    gender: 'female'
  },
  {
    name: 'Owen Lars',
    height: '178',
    mass: '120',
    hair_color: 'brown, grey',
    skin_color: 'light',
    eye_color: 'blue',
    birth_year: '52BBY',
    gender: 'male'
  },
  {
    name: 'Beru Whitesun lars',
    height: '165',
    mass: '75',
    hair_color: 'brown',
    skin_color: 'light',
    eye_color: 'blue',
    birth_year: '47BBY',
    gender: 'female'
  },
  {
    name: 'R5-D4',
    height: '97',
    mass: '32',
    hair_color: 'n/a',
    skin_color: 'white, red',
    eye_color: 'red',
    birth_year: 'unknown',
    gender: 'n/a'
  },
  {
    name: 'Biggs Darklighter',
    height: '183',
    mass: '84',
    hair_color: 'black',
    skin_color: 'light',
    eye_color: 'brown',
    birth_year: '24BBY',
    gender: 'male'
  },
  {
    name: 'Obi-Wan Kenobi',
    height: '182',
    mass: '77',
    hair_color: 'auburn, white',
    skin_color: 'fair',
    eye_color: 'blue-gray',
    birth_year: '57BBY',
    gender: 'male'
  }
].freeze

print "Printing without any params: \n"

data = STAR_WARS_CHARACTERS.map do |character|
  [character[:name], character[:height], character[:gender]]
end

Tabled.new(data).print_to_console

# ---------------------------------
# | Luke Skywalker     172 male   |
#   ---------------------------------
# | C-3PO              167 n/a    |
#   ---------------------------------
# | R2-D2              96  n/a    |
#   ---------------------------------
# | Darth Vader        202 male   |
#   ---------------------------------
# | Leia Organa        150 female |
#   ---------------------------------
# | Owen Lars          178 male   |
#   ---------------------------------
# | Beru Whitesun lars 165 female |
#   ---------------------------------
# | R5-D4              97  n/a    |
#   ---------------------------------
# | Biggs Darklighter  183 male   |
#   ---------------------------------
# | Obi-Wan Kenobi     182 male   |
#   ---------------------------------

print "\n\n############################\n\n"
print "Printing without frame: \n"

data = STAR_WARS_CHARACTERS.map do |character|
  [character[:name], character[:height], character[:gender]]
end

Tabled.new(data, framed: false).print_to_console

# Luke Skywalker     172 male
# ---------------------------------
# C-3PO              167 n/a
# ---------------------------------
# R2-D2              96  n/a
# ---------------------------------
# Darth Vader        202 male
# ---------------------------------
# Leia Organa        150 female
# ---------------------------------
# Owen Lars          178 male
# ---------------------------------
# Beru Whitesun lars 165 female
# ---------------------------------
# R5-D4              97  n/a
# ---------------------------------
# Biggs Darklighter  183 male
# ---------------------------------
# Obi-Wan Kenobi     182 male
# ---------------------------------

print "\n\n############################\n\n"
print "Printing without frame: and row separator\n"

data = STAR_WARS_CHARACTERS.map do |character|
  [character[:name], character[:height], character[:gender]]
end

Tabled.new(data, framed: false, row_separator: nil).print_to_console

# Luke Skywalker     172 male
# C-3PO              167 n/a
# R2-D2              96  n/a
# Darth Vader        202 male
# Leia Organa        150 female
# Owen Lars          178 male
# Beru Whitesun lars 165 female
# R5-D4              97  n/a
# Biggs Darklighter  183 male
# Obi-Wan Kenobi     182 male
