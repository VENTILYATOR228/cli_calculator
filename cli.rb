require './calculator'

math_problem = Calculator.new(ARGV.join)
print math_problem.solve_problem
