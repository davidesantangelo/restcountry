require 'spec_helper'

describe Restcountry do
  it 'has a version number' do
    expect(Restcountry::VERSION).not_to be nil
  end

  it 'get capital Rome from country Italy' do
   	country = Restcountry::Country.find('Italy')
   	expect(country.capital).to eq('Rome')
  end

  it 'get capital Madrid from country Spain' do
   	country = Restcountry::Country.find('Spain')
   	expect(country.capital).to eq('Madrid')
  end

  it 'get region Europe from country Ukraine' do
    country = Restcountry::Country.find('Ukraine')
    expect(country.region).to eq('Europe')
  end

  it 'get name Estonia from capital Tallinn' do
    country = Restcountry::Country.find_by_capital('Tallinn')
    expect(country.capital).to eq('Tallinn')
  end
end
