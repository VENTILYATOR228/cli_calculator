input = ARGV
problem = input.reduce { |problem, item| problem + " " + item }
result = eval(problem)
puts result
