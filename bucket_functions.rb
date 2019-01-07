require 'aws-sdk'
require 'csv'

load './local_ENV.rb' if File.exist?('./local_ENV.rb')


def bucket_stuff()
    s3 = Aws::S3::Client.new(
                access_key_id: ENV['S3_KEY'],
                secret_access_key: ENV['S3_SECRET'],
                region: ENV['S3_Region'],
                )
    bucket = ENV['S3_BUCKET']
    file = ENV['S3_File']  
    resp = s3.get_object(bucket: bucket, key: ENV['S3_File'])
    validlist = Array.new
    isbnlist = Array.new 
    multiarray = CSV.parse(resp.body)
    multiarray.each do |row|
        #p "this is ROW #{row}"
    end
end 
