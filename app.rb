require 'sinatra'
require 'csv'
require 'aws-sdk'
require 'json'
require_relative 'isbn.rb'
require_relative 'csv.rb'
require_relative 'aws.rb'



get '/' do
  erb :home
end

post '/home' do
  isbn = params[:isbn]
  csv_file = params[:csv_file]
  read = update_csv(csv_file).join(", ")
  s3.put_object(bucket: 'alan-isbn-bucket', body: isbn, key: "isbn.csv")
  redirect 'results?isbn=' + isbn + '&read=' + read
end

get '/results' do
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
