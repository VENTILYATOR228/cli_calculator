# frozen_string_literal: true
class Calculator

  def initialize(problem)
    @problem = split_problem(problem)
  end

  def values
    @values ||= to_back_polish_notation
  end

  SIGNS = %w[+ - * /].freeze
  STOP = 'stop'
  BPN_SIGNS = (SIGNS + [STOP] + %w[( )]).freeze

  def solve_problem
    @problem = to_back_polish_notation
    sign = nil
    @problem.each do |item|
      item = item.to_i if !SIGNS.include? item
      case item
      when Integer
        @stack_helper.push(item)
      when *SIGNS
        sign = item
        eval_result = eval_math(@stack_helper.pop, sign, @stack_helper.pop)
        @stack_helper.push(eval_result)
      end
    end
    @stack_helper.first
  end

  def to_back_polish_notation
    @stack_helper = []
    result = []
    @problem
    @problem.push(STOP)
    @stack_helper.push(STOP)
    until @problem.empty?
      result.push(@problem.shift) if !BPN_SIGNS.include? @problem.first
      case search_for_instruction(@problem.first)
      when 1
        @stack_helper.push(@problem.shift)
      when 2
        result.push(@stack_helper.pop)
      when 3
        @problem.shift
        @stack_helper.pop
      when 4
        @problem = result
        @stack_helper.shift
        return @problem
      when 5
        return 'Syntax error'
      end
    end
  end

  private

  def split_problem(input)
    input.scan(/(^\-\d+|\d+|\+|\-|\*|\/|\(|\))/).flatten
  end

  def eval_math(b, sign, a)
    case sign
    when '+'
      a + b
    when '-'
      a - b
    when '/'
      a / b
    when '*'
      a * b
    end
  end

  def search_for_instruction(item)
    horisontal = ['stop', '+', '-', '*', '/', '(', ')']
    vertical = ['stop', '+', '-', '*', '/', '(']
    interaction_matrix = [
      [4, 1, 1, 1, 1, 1, 5],
      [2, 2, 2, 1, 1, 1, 2],
      [2, 2, 2, 1, 1, 1, 2],
      [2, 2, 2, 2, 2, 1, 2],
      [2, 2, 2, 2, 2, 1, 2],
      [5, 1, 1, 1, 1, 1, 3]
    ]
    vert_index = vertical.find_index(@stack_helper.last)
    hor_index = horisontal.find_index(item)
    interaction_matrix[vert_index][hor_index]
  end

end
