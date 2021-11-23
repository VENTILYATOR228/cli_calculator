# frozen_string_literal: true

require 'test/unit'
require_relative './calculator'

class Spec < Test::Unit::TestCase
  def call_solve_problem(array)
    result = array[0]
    problem = array[1]
    math_problem = Calculator.new(problem)
    assert_equal(result, math_problem.solve_problem)
  end

  def test_solve_problem
    problems = [
      [2, '1+1'],
      [-1, '1+1-3'],
      [5, '526 + 179 - 700'],
      [2, '552 - 550'],
      [81, '71 + 30 - 20'],
      [1, '1+1- 1'],
      [64, '51 + 613 - 600'],
      [-2, '1 - 5 +2'],
      [6, '5 -3 +4'],
      [-9, '21 - 42 + 12'],
      [12, '3 - 6 -1+16'],
      [4, '41 - 32 - 5'],
      [4, '1+4-1'],
      [7, '1+6'],
      [-7, '1+ 4 - 12 '],
      [14, '5 - 3 + 12'],
      [111, '143 - 32'],
      [9, '1+8'],
      [-50, '14 - 64'],
      [14, '46 - 32'],
      [4, '1+1 + 2'],
      [-6, '1+1-3 -5'],
      [4, '526 + 179 -700-1'],
      [0, '552 - 550 - 2'],
      [51, '71 - 20 '],
      [0, '1- 1'],
      [604, '51 + 613 - 60'],
      [1, '1+3 - 5 +2'],
      [7, '5+1 -3 +4'],
      [-10, '21 -1- 42 + 12'],
      [21, '3 -3+ 6 -1+16'],
      [67, '41 -1+ 32 - 5'],
      [9, '1+4-1 + 5'],
      [0, '1+6 - 7'],
      [14, '1+ 4 -3 + 12 '],
      [12, '5 - 3 + 12 - 2'],
      [100, '143 - 32 - 11'],
      [2, '1+8 - 7'],
      [0, '14 - 64 + 50'],
      [10, '46 - 32 - 4']
    ]
    problems.each do |item|
      call_solve_problem(item)
    end
  end
end
