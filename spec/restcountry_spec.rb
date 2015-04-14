require 'spec_helper'
require 'vcr'

describe Restcountry do
  
  it 'get a response from api' do
    VCR.use_cassette 'find_by_name' do
      result = Restcountry::Country.all
      expect(result).to be_kind_of(Array)
      expect(result.first).to be_kind_of(Restcountry::Country)
    end
  end

  it 'has a version number' do
    expect(Restcountry::VERSION).not_to be nil
  end

  it 'get capital Rome from country Italy' do
    VCR.use_cassette 'find' do
   	  country = Restcountry::Country.find('Italy')
   	  expect(country.capital).to eq('Rome')
    end
  end

  it 'get capital Madrid from country Spain' do
    VCR.use_cassette 'find' do
   	  country = Restcountry::Country.find('Spain')
   	  expect(country.capital).to eq('Madrid')
    end
  end

  it 'get region Europe from country Ukraine' do
    VCR.use_cassette 'find' do
      country = Restcountry::Country.find('Ukraine')
      expect(country.region).to eq('Europe')
    end
  end

  it 'get name Estonia from capital Tallinn' do
    VCR.use_cassette 'find_by_capital' do
      country = Restcountry::Country.find_by_capital('Tallinn')
      expect(country.capital).to eq('Tallinn')
    end
  end

  it 'get name from first country from language it' do
    VCR.use_cassette 'find_by_lang' do
      countries = Restcountry::Country.find_by_lang('it')
      expect(countries.first.name).to eq('Italy')
    end
  end

  it 'get name from first country from callingcode 39' do
    VCR.use_cassette 'find_by_callingcode' do
      countries = Restcountry::Country.find_by_callingcode('39')
      expect(countries.first.name).to eq('Italy')
    end
  end
end
