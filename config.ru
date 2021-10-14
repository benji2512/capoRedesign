require "./home"
require 'sinatra'

Sinatra::Application.run(Port: ENV['PORT'])