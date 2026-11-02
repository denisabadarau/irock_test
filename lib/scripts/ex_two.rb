class Scripts::ExTwo
    def run
        for number in 1..100
            if (number % 15).zero?
                puts "FizzBuzz"
            elsif (number % 3).zero?
                puts "Fizz"
            elsif (number % 5).zero?
                puts "Buzz"
            else
                puts number
            end
        end
    end
end
