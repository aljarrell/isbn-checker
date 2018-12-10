def check_ten(number)
  number = number.to_s.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").each_char.to_a #removes hyphens, spaces, and tr letters a-w and y-z to empty strings so that x can still pass through as a check number
    #p "this is NUMBER #{number}"
  if number.length == 10
    check_number = number.pop #returns last number in the array
    check_number = check_number.gsub("x", "10").to_i
    #p "this is CHECK NUMBER #{check_number}"
    total = 0
    number.each_with_index do |num, index|
      total += (index + 1) * num.to_i #through each iteration it bumps up the index number and multiplies it to the number at that index and adds that to the total
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
