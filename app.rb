require 'sinatra'
require 'csv'
require 'aws-sdk'
require 'json'
require_relative 'isbn.rb'
require_relative 'csv.rb'
require_relative 'bucket_functions.rb'

load './local_ENV.rb' if File.exist?('./local_ENV.rb')

get '/' do
  erb :home
end

post '/home' do
  isbn = params[:isbn]
  csv_file = params[:csv_file]
  read = update_csv(csv_file).join(", ")
  redirect 'results?isbn=' + isbn + '&read=' + read + '&csv_file=' + csv_file
end

get '/results' do
  csv_file = params[:csv_file]
  isbn = params[:isbn]
  read = params[:read]
  isbn = isbn.upcase.tr("a-w", "").tr("y-z", "").tr('"', '').gsub("-", "").gsub(" ", "").each_char.to_a
  if isbn.length == 10
    result = check_ten(isbn.join(""))
  else
    result = check_thirteen(isbn.join(""))
  end
  write_new_isbn_to_bucket(isbn.join)
  write_to_bucket(csv_file)
  bucket_function = read_bucket()
  erb :results, locals: {isbn: isbn, result: result, read: read, bucket_function: bucket_function, csv_file: csv_file}
end
