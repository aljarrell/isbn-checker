require 'csv'
require_relative 'isbn.rb'

def update_csv(file)
  updated_isbn = []
  isbn = CSV.read(file, 'r', headers:true)
    isbn.each do |row|
      new = row[1].to_s.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "")
      #puts "THIS IS NEW #{new}"
      if new.length == 10
        updated_isbn.push([row[1], check_ten(new)])
        #p "this is UPDATED ISBN TEN #{row}"
      else
        updated_isbn.push([row[1], check_thirteen(new)])
        #p "this is UPDATED ISBN THIRTEEN "
      end
    end
      CSV.open("isbn_rewrite.csv", "w") do |new_row|
        new_row << ["ISBN", "VALIDITY"]
        updated_isbn.each do |item|
          new_row << item
        end
      end
end
