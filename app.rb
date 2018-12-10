require 'sinatra'
require_relative 'isbn.rb'

get '/' do
  erb :home
end
