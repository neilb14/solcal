require 'rubygems'
require 'bundler/setup'

$:.unshift File.expand_path('../../lib', __FILE__)
require 'solcal'

Bundler.require(:default, :test)