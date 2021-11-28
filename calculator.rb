# frozen_string_literal: true

class Calculator
  SIGNS = %w[+ - * /].freeze
  STOP = 'stop'
  BPN_SIGNS = ([STOP] + SIGNS + %w[( )]).freeze
  HOR = BPN_SIGNS.freeze
  VERT = ([STOP] + SIGNS + %w[(]).freeze
  BPN_MATRIX = [
    [4, 1, 1, 1, 1, 1, 5],
    [2, 2, 2, 1, 1, 1, 2],
    [2, 2, 2, 1, 1, 1, 2],
    [2, 2, 2, 2, 2, 1, 2],
    [2, 2, 2, 2, 2, 1, 2],
    [5, 1, 1, 1, 1, 1, 3]
  ].freeze

  def initialize(problem)
    @problem = split_problem(problem)
  end

  def results_memo
    @results_memo ||= solve_problem
  end

  def solve_problem
    @bpn_eval_stack = []
    back_polish_notation.each { |item| bpn_algorithm(item) }
    @bpn_eval_stack.first
  end

  def back_polish_notation
    @bpn_conversion_stack = [STOP]
    bpn_order_stack = []
    problem_arr = @problem.push(STOP)
    until problem_arr.empty?
      bpn_order_stack.push(problem_arr.shift) unless BPN_SIGNS.include? problem_arr.first
      case search_for_bpn_instruction(problem_arr.first)
      when 1
        @bpn_conversion_stack.push(problem_arr.shift)
      when 2
        bpn_order_stack.push(@bpn_conversion_stack.pop)
      when 3
        problem_arr.shift
        @bpn_conversion_stack.pop
      when 4
        return bpn_order_stack
      when 5
        return 'Syntax error'
      end
    end
  end

  private

  def split_problem(input)
    input.scan(%r{(^-\d+|\d+|\+|-|\*|/|\(|\))}).flatten
  end

  def bpn_algorithm(item)
    item = item.to_i unless SIGNS.include? item
    case item
    when Integer
      @bpn_eval_stack.push(item)
    when *SIGNS
      sign = item
      eval_result = eval_math(@bpn_eval_stack.pop, sign, @bpn_eval_stack.pop)
      @bpn_eval_stack.push(eval_result)
    end
  end

  def eval_math(second_element, sign, first_element)
    case sign
    when '+' then first_element + second_element
    when '-' then first_element - second_element
    when '/' then first_element / second_element
    when '*' then first_element * second_element
    end
  end

  def search_for_bpn_instruction(item)
    vert_index = VERT.find_index(@bpn_conversion_stack.last)
    hor_index = HOR.find_index(item)
    BPN_MATRIX[vert_index][hor_index]
  end
end
