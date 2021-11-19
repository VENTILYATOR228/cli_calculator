SIGNS = %w[+ - * /].freeze
STOP = "stop"
BPN_SIGNS = %w[+ - * / ( ) stop].freeze

def split_problem(input)
  input.scan(/(\d+|\+|\-|\*|\/|\(|\))/).flatten
end

def search_for_instruction(item)
  horisontal = ["stop", "+", "-", "*", "/", "(", ")"]
  vertical = ["stop", "+", "-", "*", "/", "("]
  interaction_matrix = [
                        [4, 1, 1, 1, 1, 1, 5],
                        [2, 2, 2, 1, 1, 1, 2],
                        [2, 2, 2, 1, 1, 1, 2],
                        [2, 2, 2, 2, 2, 1, 2],
                        [2, 2, 2, 2, 2, 1, 2],
                        [5, 1, 1, 1, 1, 1, 3]
                      ]
  vert_index = vertical.find_index(@temp.last)
  hor_index = horisontal.find_index(item)
  interaction_matrix[vert_index][hor_index]
end

def to_back_polish_notation(input)
  @temp = []
  result = []
  problem = split_problem(input)
  problem.push(STOP)
  @temp.push(STOP)
  until problem.empty?
    if (BPN_SIGNS.include? problem.first) == false
      result.push(problem.shift)
    end
    case search_for_instruction(problem.first)
    when 1
      @temp.push(problem.shift)
    when 2
      result.push(@temp.pop)
    when 3
      problem.shift
      @temp.pop
    when 4
      problem.shift
      @temp.shift
      return result
    when 5
      return "Syntax error"
    end
  end
end

def eval_math(b, sign, a)
  case sign
  when "+"
    a + b
  when "-"
    a - b
  when "/"
    a / b
  when "*"
    a * b
  end
end

def solve_problem(input)
  polish_problem_arr = to_back_polish_notation(input)
  sign = nil
  polish_problem_arr.each do |item|
    unless SIGNS.include? item
      item = item.to_i
    end
    case item
    when Integer
      @temp.push(item)
    when *SIGNS
      sign = item
      eval_result = eval_math(@temp.pop, sign, @temp.pop)
      @temp.push(eval_result)
    end
  end
  puts @temp.first
end

puts solve_problem(ARGV.join)
