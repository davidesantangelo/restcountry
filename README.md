# Restcountry

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/restcountry`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'restcountry'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install restcountry

## Usage

```ruby
require 'restcountry'

# Find all cauntries
countries = Restcountry::Country.all

# Find a country by name
country = Restcountry::Country.find('italy')

# Access the country's attributes
country.capital
#=> Rome

country.region
#=>Europe

country.callingCodes
#=> "39"

```
