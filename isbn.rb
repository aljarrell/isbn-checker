def check_ten(number)
  number = number.gsub("-", "").gsub(" ", "").split(",")
  check_digit = number.pop.to_i

  if number.length > 10
    return "invalid"
  else
    return "valid"

  end 
end
