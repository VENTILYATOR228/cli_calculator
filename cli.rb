# frozen_string_literal: true

require './calculator'

math_problem = Calculator.new(ARGV.join)
puts math_problem.result
