input = gets.chomp
arguments = input.scan(/\S+/)
sign = nil
result = arguments.reduce do |result, item|
  case item
  when "+"
    sign = "+"
  when "-"
    sign = "-"
  else
    if sign == "+"
      result = result.to_i + item.to_i
    else
      result = result.to_i - item.to_i
    end
  end
  result
end

puts result
