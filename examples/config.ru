# require 'rubygems'
# require 'rack'
# require 'rack/contrib'
# 
# app = proc do |env|
#   [200,  { 'Content-Type' => 'text/html' }, ['Hi there!'] ]
# end
# 
# use Rack::Profiler if ENV['RACK_ENV'] == 'development'
# # use Rack::ETag
# # use Rack::MailExceptions
# 
# run app

require "config/environment"

use Rails::Rack::LogTailer
use Rails::Rack::Static
run ActionController::Dispatcher.new