def check_ten(number)
  number = number.to_s.gsub("-", "").gsub(" ", "").each_char.to_a
  check_digit = number.pop.to_i
p "this is NUMBER #{number}"
  if number.length > 10
    return "invalid"
  else

    return "valid"

  end

end
