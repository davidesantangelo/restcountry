# Restcountry

This is a sample gem to wrap REST Countries API http://restcountries.eu

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

# Find all countries
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
