require 'spec_helper'

describe Restcountry do
  it 'has a version number' do
    expect(Restcountry::VERSION).not_to be nil
  end

  it 'get capital Rome from country Italy' do
   	it = Restcountry::Country.find('Italy')
   	expect(it.capital).to eq('Rome')
  end

  it 'get capital Madrid from country Spain' do
   	spain = Restcountry::Country.find('Spain')
   	expect(spain.capital).to eq('Madrid')
  end
end
