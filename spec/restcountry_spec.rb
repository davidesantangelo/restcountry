require 'spec_helper'

describe Restcountry, :vcr do
  it 'get a response from api' do
    result = Restcountry::Country.all
    expect(result).to be_kind_of(Array)
    expect(result.first).to be_kind_of(Restcountry::Country)
  end

  it 'expect Kabul as first capital' do
    result = Restcountry::Country.all
    expect(result.first.capital).to eq('Kabul')
  end

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

  it 'get capital London from country United Kingdom' do
    country = Restcountry::Country.find('United Kingdom')
    expect(country.capital).to eq('London')
  end

  it 'get region Europe from country Ukraine' do
    country = Restcountry::Country.find('Ukraine')
    expect(country.region).to eq('Europe')
  end

  it 'get name Estonia from capital Tallinn' do
    country = Restcountry::Country.find_by_capital('Tallinn')
    expect(country.capital).to eq('Tallinn')
  end

  it 'get name from first country from language it' do
    countries = Restcountry::Country.find_by_lang('it')
    expect(countries.first.name).to eq('Holy See')
  end

  it 'get name from first country from callingcode 39' do
    countries = Restcountry::Country.find_by_callingcode('39')
    expect(countries.first.name).to eq('Italy')
  end

  it 'get name Armenia from first country of subregion "western asia"' do
    countries = Restcountry::Country.find_by_subregion('western asia')
    expect(countries.first.name).to eq('Armenia')
  end

  it 'get name from first country from countrycode it' do
    countries = Restcountry::Country.find_by_countrycode('it')
    expect(countries.first.name).to eq('Italy')
  end
end
