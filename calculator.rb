def split_string_in_array_to_array(input)
  string = input.reduce { |string, item| resut + item }
  string.scan(/\S+/)
end

def split_string_to_array(input)
  input.scan(/\S+/)
end

def split_array_or_string(input)
  case input
  when Array
    split_string_in_array_to_array(input)
  when String
    split_string_to_array(input)
  end
end

def eval_math(input)
  sign = nil
  arguments = split_array_or_string(input)
  result = arguments.reduce do |result, item|
    result = result.to_i
    if item != "+" && item != "-"
      item = item.to_i
    end
    case item
    when String
      if item == "+"
        sign = "+"
      elsif item == "-"
        sign = "-"
      end
    when Integer
      if sign == "+"
        result = result + item
      elsif sign == "-"
        result = result - item
      end
    end
    result
  end
end

print "#{split_string_in_array_to_array(ARGV)}\n"
puts  eval_math(ARGV)
string = "14 - 43 + 21 - 4"
print "#{split_string_to_array(string)}\n"
puts eval_math(string)
