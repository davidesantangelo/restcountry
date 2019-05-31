$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'restcountry'

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
