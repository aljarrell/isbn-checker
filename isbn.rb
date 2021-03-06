def check_ten(number)
  number = number.to_s.upcase.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").each_char.to_a #removes hyphens, spaces, and tr letters a-w and y-z to empty strings so that x can still pass through as a check number
    #p "this is NUMBER #{number}"
  if number.length == 10
    check_number = number.pop #returns last number in the array
    check_number = check_number.gsub("X", "10").to_i
    #p "this is CHECK NUMBER #{check_number}"
    total = 0
    number.each_with_index do |num, index|
      total += (index + 1) * num.to_i #through each iteration it bumps up the index number and multiplies it to the number at that index and adds that to the total
    end
      if (total % 11) == check_number
        return "Valid"
      else
        return "Invalid"
      end
  else
    return "Invalid"
  end
end


def check_thirteen(number)
  number = number.to_s.tr("a-z", "").gsub("-", "").gsub(" ", "").each_char.to_a
    if number.length == 13
      check_number = number.pop
      check_number = check_number.to_i
      total = 0
        number.each_with_index do |num, index|
          num = num.to_i
          if index.odd?
            total += (num * 3)
          elsif index.even? #index position 0 is an even number
            total += (num * 1)
          end
        end
      final_calc = (10 - (total % 10)) % 10
      #p "this is FINAL CALC #{final_calc}"
        if final_calc == check_number
          return "Valid"
        else
          return "Invalid"
        end
    else
      return "Invalid"
    end
end
