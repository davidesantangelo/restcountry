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
      response = Faraday.get("#{API_URL}/name/#{name}")
      response.success? ? new(JSON.parse(response.body).first) : []
    end

    def self.all
      response = Faraday.get("#{API_URL}/all")
      countries = response.success? ? JSON.parse(response.body) : []
      countries.map { |attributes| new(attributes) }
    end
  end
end