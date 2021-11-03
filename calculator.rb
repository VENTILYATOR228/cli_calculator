def sum(first_num, second_num)
  first_num + second_num
end

def substract (first_num, second_num)
  first_num - second_num
end

first_number = gets.chomp.to_i
second_number = gets.chomp.to_i

puts "The sum is #{ sum(first_number, second_number) }"
puts "The substraction is #{ substract(first_number, second_number) }"
