require 'faraday'
require 'json'
require 'uri'

API_URL = 'https://restcountries.eu/rest/v1'

module Restcountry
  class Country
    attr_reader :name,
                :capital,
                :altSpellings,
                :relevance,
                :region,
                :subregion,
                :translations,
                :population,
                :latlng,
                :demonym,
                :area,
                :gini,
                :timezones,
                :borders,
                :nativeName,
                :callingCodes,
                :topLevelDomain,
                :alpha2Code,
                :alpha3Code,
                :currencies,
                :languages

    def initialize(attributes)
      @name = attributes['name']
      @capital = attributes['capital']
      @altSpellings = attributes['altSpellings']
      @relevance = attributes['relevance']
      @region = attributes['region']
      @subregion = attributes['subregion']
      @translations = attributes['translations']
      @population = attributes['population']
      @latlng = attributes['latlng']
      @demonym = attributes['demonym']
      @area = attributes['area']
      @gini = attributes['gini']
      @timezones = attributes['timezones']
      @borders = attributes['borders']
      @nativeName = attributes['nativeName']
      @callingCodes = attributes['callingCodes']
      @topLevelDomain = attributes['topLevelDomain']
      @alpha2Code = attributes['alpha2Code']
      @alpha3Code = attributes['alpha3Code']
      @currencies = attributes['currencies']
      @languages = attributes['languages']
    end

    def self.find(name, fulltext = false)
      countries = get_response('name', name + "?fullText=#{fulltext}")
      new(countries.first) unless countries.empty?
    end

    def self.find_by_name(name, fulltext = false)
      find(name, fulltext)
    end

    def self.find_by_currency(currency)
      countries = get_response('currency', currency)
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_capital(capital)
      countries = get_response('capital', capital)
      new(countries.first) unless countries.empty?
    end

    def self.find_by_region(region)
      countries = get_response('region', region)
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_subregion(subregion)
      countries = get_response('subregion', subregion)
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_lang(lang)
      countries = get_response('lang', lang)
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_callingcode(callingcode)
      countries = get_response('callingcode', callingcode)
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_countrycode(countrycode)
      countries = get_response(nil, "alpha?codes=#{countrycode}")
      countries.map { |attributes| new(attributes) }
    end

    def self.all
      countries = get_response('all')
      countries.map { |attributes| new(attributes) }
    end

    private

    private_class_method
    def self.get_response(api, action = nil)
      url = URI.parse(URI.encode("#{API_URL}#{api ? '/' + api : ''}/#{action}"))
      response = Faraday.get(url)
      response.success? ? JSON.parse(response.body) : []
    end
  end
end
