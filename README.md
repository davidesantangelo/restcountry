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

## License
The restcountry GEM is released under the MIT License.
```
Copyright (c) 2015 Davide Santangelo

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
