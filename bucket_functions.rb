require 'aws-sdk'
require 'csv'
require_relative 'isbn.rb'


def read_bucket()
    s3 = Aws::S3::Client.new(
                access_key_id: ENV['S3_KEY'],
                secret_access_key: ENV['S3_SECRET'],
                region: ENV['S3_Region'],
                )
    bucket = ENV['S3_BUCKET']
    file = ENV['S3_File']  
    resp = s3.get_object(bucket: bucket, key: file)
    read_arr = Array.new
    CSV.parse(resp.body) do |row|
        p "THIS IS ROW #{row}"
        number = row[1].to_s.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").gsub("\"", "").gsub("\]", "").gsub("/[", "").gsub(",", "") 
            if number.length == 10
                read_arr.push([number + " is " + check_ten(number)])
            else
                read_arr.push([number + " is " + check_thirteen(number)])
            end 
    end 
    p "THIS IS READ_ARR #{read_arr}"
    read_arr
end 

def write_to_bucket(file)
    s3 = Aws::S3::Client.new(
                access_key_id: ENV['S3_KEY'],
                secret_access_key: ENV['S3_SECRET'],
                region: ENV['S3_Region'],
                )
    bucket = ENV['S3_BUCKET']  
    resp = s3.get_object(bucket: bucket, key: ENV['S3_File'])
    s3 = Aws::S3::Resource.new(
                access_key_id: ENV['S3_KEY'],
                secret_access_key: ENV['S3_SECRET'],
                region: ENV['S3_Region'],
                )
    CSV.read(file, "r") do |row|
        CSV.open(resp.body, "wb") do |csv|
            csv << row 
        end 
    end 
    obj = s3.bucket(bucket).object(ENV['S3_File'])
    obj.upload_file(file)
end 

def write_new_isbn_to_bucket(isbn)
    s3 = Aws::S3::Client.new(
                access_key_id: ENV['S3_KEY'],
                secret_access_key: ENV['S3_SECRET'],
                region: ENV['S3_Region'],
                )
    bucket = ENV['S3_BUCKET']
    file = ENV['S3_File']  
    resp = s3.get_object(bucket: bucket, key: file)
    s3 = Aws::S3::Resource.new(
                access_key_id: ENV['S3_KEY'],
                secret_access_key: ENV['S3_SECRET'],
                region: ENV['S3_Region'],
                )
    File.open(file, "a+") do |csv|
        csv << "\n" + "placeholder, " + isbn
    end 
    obj = s3.bucket(bucket).object(ENV['S3_File'])
    obj.upload_file(ENV['S3_File'])
end 