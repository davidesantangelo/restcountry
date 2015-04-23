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
country = Restcountry::Country.find_by_name('italy')

# Access the country's attributes
country.capital
#=> Rome

country.region
#=> Europe

country.callingCodes
#=> "39"

# Find a country by capital
country = Restcountry::Country.find_by_capital('Rome')

country.name
#=> Italy

countries = Restcountry::Country.find_by_lang('it')

countries.first
#=> Italy

```
## Attributes

name, 
capital, 
altSpellings, 
relevance, 
region, 
subregion, 
translations, 
population, 
latlng, 
demonym, 
area, 
gini, 
timezones, 
borders, 
nativeName, 
callingCodes, 
topLevelDomain, 
alpha2Code, 
alpha3Code, 
currencies, 
languages

## Credits
Many thanks to Fayder Florez for his implementation of the API.

## Related projects

* [gocountries](https://github.com/alediaferia/gocountries).

* 
## License
The restcountry GEM is released under the MIT License.

