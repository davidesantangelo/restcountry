require 'faraday'
require 'json'

API_URL = "https://restcountries.eu/rest/v1"

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
      @name = attributes["name"]
      @capital = attributes["capital"]
      @altSpellings = attributes["altSpellings"]
      @relevance = attributes["relevance"]
      @region = attributes["region"]
      @subregion = attributes["subregion"]
      @translations = attributes["translations"]
      @population = attributes["population"]
      @latlng = attributes["latlng"]
      @demonym = attributes["demonym"]
      @area = attributes["area"]
      @gini = attributes["gini"]
      @timezones = attributes["timezones"]
      @borders = attributes["borders"]
      @nativeName = attributes["nativeName"]
      @callingCodes = attributes["callingCodes"]
      @topLevelDomain = attributes["topLevelDomain"]
      @alpha2Code = attributes["alpha2Code"]
      @alpha3Code = attributes["alpha3Code"]
      @currencies = attributes["currencies"]
      @languages = attributes["languages"]
    end

    def self.find(name)
      response = get_response('name', name)
      response.success? ? new(JSON.parse(response.body).first) : []
    end

    def self.find_by_name(name)
      find(name)
    end

    def self.find_by_currency(currency)
      response = get_response('currency', currency)
      countries = response.success? ? JSON.parse(response.body) : []
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_capital(capital)
      response = get_response('capital', capital)
      response.success? ? new(JSON.parse(response.body).first) : []
    end

    def self.find_by_region(region)
      response = get_response('region', region)
      countries = response.success? ? JSON.parse(response.body) : []
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_lang(lang)
      response = get_response('lang', lang)
      countries = response.success? ? JSON.parse(response.body) : []
      countries.map { |attributes| new(attributes) }
    end

    def self.find_by_callingcode(callingcode)
      response = get_response('callingcode', callingcode)
      countries = response.success? ? JSON.parse(response.body) : []
      countries.map { |attributes| new(attributes) }
    end

    def self.all
      response = get_response('all')
      countries = response.success? ? JSON.parse(response.body) : []
      countries.map { |attributes| new(attributes) }
    end
  private
    def self.get_response(api, action=nil)
      Faraday.get("#{API_URL}/#{api.to_s}/#{action}")
    end
  end
end
