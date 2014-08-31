# Encoding: UTF-8

require 'simplecov'
require 'coveralls'
require 'rspec'

Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  Coveralls::SimpleCov::Formatter
]
SimpleCov.minimum_Coverage 95
SimpleCov.start
