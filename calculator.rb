input = gets.chomp
arguments = input.scan(/\S+/)
numbers = arguments.select.with_index { |_, num| num.even? }.map(&:to_i)
signs = arguments.select.with_index { |_, sign| sign.odd? }

case signs.first
when "+"
  puts numbers.reduce { |sum, num| sum + num  }
when "-"
  puts numbers.reduce { |substraction, num| substraction - num }
else
  puts "Please, enter + or -"
end
