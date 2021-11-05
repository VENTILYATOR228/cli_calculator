input = gets.chomp
arguments = input.scan(/\S+/)
sign = nil
run = 0
arguments.reduce do |result, item|
  # require 'pry'; binding.pry
  # run += 1
  # if run < 1
  #   result.to_i
  #   return result
  # end
  case item
  when "+"
    sign = "+"
    puts result
    result
  when "-"
    sign = "-"
    puts result
    result
  else
    if sign == "+"
      result = result.to_i + item.to_i
    else
      result = result.to_i - item.to_i
    end
  end
end
