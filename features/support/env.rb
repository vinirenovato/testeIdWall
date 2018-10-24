require 'rspec'
require 'page-object'
require 'data_magic'
require 'httparty'
require 'byebug'

page = lambda {|klass| klass.new}

Before do
  @page = page
end
