require 'sinatra'
require_relative 'isbn.rb'

get '/' do
  erb :home
end

post '/home' do
  isbn = params[:isbn]
  #p "ISBN LENGTH #{isbn.to_s.upcase.tr("a-w", "").tr("y-z", "").tr('"', '').gsub("-", "").gsub(" ", "").each_char.to_a.length}"
  redirect 'results?isbn=' + isbn
end

get '/results' do
  isbn = params[:isbn]
  isbn = isbn.upcase.tr("a-w", "").tr("y-z", "").tr('"', '').gsub("-", "").gsub(" ", "").each_char.to_a
  #p "ISBN #{isbn}"
  if isbn.length == 10
    result = check_ten(isbn.join(""))
    #p "this TEN RESULT #{result}"
  elsif isbn.length == 13
    result = check_thirteen(isbn.join(""))
    #p "this is THIRTEEN RESULT #{result}"
  end
  erb :results, locals: {isbn: isbn, result: result}
end
