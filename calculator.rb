SIGNS = %w[+ -].freeze

def split_problem(input)
  input.scan(/(\d+|\+|\-)/).flatten
end

def eval_math(a, sign, b)
  case sign
  when "+"
    a + b
  when "-"
    a - b
  end
end

def solve_problem(problem)
  problem_arr = split_problem(problem)
  sign = nil
  problem_arr.reduce do |result, item|
    result = result.to_i if sign.nil?
    unless SIGNS.include? item
      item = item.to_i
    end
    case item
    when *SIGNS
      sign = item
    when Integer
      result = eval_math(result, sign, item)
    end
    result
  end
end

puts  solve_problem(ARGV.join)