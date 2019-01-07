require 'sinatra'
require 'csv'
require 'aws-sdk'
require 'json'
require_relative 'isbn.rb'
require_relative 'csv.rb'
require_relative 'bucket_functions.rb'

get '/' do
  erb :home
end

post '/home' do
  isbn = params[:isbn]
  csv_file = params[:csv_file]
  read = update_csv(csv_file).join(", ")
  redirect 'results?isbn=' + isbn + '&read=' + read
end

get '/results' do
  bucket_function = bucket_stuff()
  isbn = params[:isbn]
  read = params[:read]
  isbn = isbn.upcase.tr("a-w", "").tr("y-z", "").tr('"', '').gsub("-", "").gsub(" ", "").each_char.to_a
  #p "CSV FILE #{csv_file}"
  if isbn.length == 10
    result = check_ten(isbn.join(""))
  else
    result = check_thirteen(isbn.join(""))
  end

  erb :results, locals: {isbn: isbn, result: result, read: read}
end
