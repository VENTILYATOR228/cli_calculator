input = gets.chomp
arguments = input.scan(/\S+/)
sign = nil
arguments.reduce do |result, item|
  if sign == nil
    result = item.to_i
    return result
  end
  case item
  when "+"
    sign = "+"
  when "-"
    sign = "-"
  else
    item.to_i
    if sign == "+"
      result + item
    else
      result - item
    end
  end
end
