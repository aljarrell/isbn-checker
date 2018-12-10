def check_ten(number)
  number = number.to_s.tr("a-z", "").gsub("-", "").gsub(" ", "").each_char.to_a
    p "this is NUMBER #{number}"
  if number.length != 10
    return "invalid"
  else
    return "valid"
  end

end
