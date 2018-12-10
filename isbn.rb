def check_ten(number)
  number = number.to_s.tr("a-z", "").gsub("-", "").gsub(" ", "").each_char.to_a
    p "this is NUMBER #{number}"
  if number.length == 10
    check_number = number.pop.to_i #returns last number in the array as an integer
    total = 0
    number.each_with_index do |num, index|
      total += (index + 1) * num.to_i #through each iteration it bumps up the index number and multiplies it to the given number
    end
      if (total % 11) == check_number 
        return "valid"
      else
        return "invalid"
      end
  else
    return "invalid"
  end

end
