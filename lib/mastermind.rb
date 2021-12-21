require_relative "code"
require 'byebug'
class Mastermind


    def initialize(length)
        @secret_code = Code.random(length)
    end


    def print_matches(code)
        # debugger
        p @secret_code.num_exact_matches(code)
        p @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        p 'Enter a code'
        code = gets.chomp
        code1 = Code.from_string(code)
        print_matches(code1)
        @secret_code
        # debugger
        p @secret_code == code1 
    end
end
