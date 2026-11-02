class Scripts::ExTwo
    def ex2
        # ex 2
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

    def ex3(text)
        # Replace all numbers in a string with NUMBER string. Example: “abc 123 def 345 6” =&gt; ”abc NUMBER def NUMBER NUMBER”
        output_string = text.gsub(/\d+/, "NUMBER")
        puts output_string
    end

    def ex4
        # ex 4
        # There is a salaries table, and it has the following columns: employee_id, organisation_id,
        # amount, date (each employee can have more than one salary depending on date).
        # a. Find a maximum salary for each employee in SQL.
        # b. Find an average salary for each organisation in SQL.  

        # a. SELECT MAX(amount) AS max_salary, ecployee_id from salaries GROUP BY employee_id;
        # b. SELECT AVG(amount) AS avg_salary, organisation_id from salaries GROUP BY organisation;
    end

    def ex5
        # ex 5
        # Please write a js function: f(1, 5) -> 6, and then f(1)(5) -> 6
        # function f(a, b) {
        #     if (b !== undefined) {
        #         return a + b;
        #     } else {
        #         return function(b) {
        #             return a + b;
        #         };
        #     }
        # }
    end

    def ex6(number)
        # Write a script in Ruby that takes a positive number as an input. The program should take every
        # single digit of this number, and sum them until only a 1 digit number is left. Example input:
        # 31337 Output: 8, because 3+1+3+3+7=17 and 1+7=8.

        while number > 9
            number = number.to_s.chars.map(&:to_i).sum
        end

        puts number
    end
end
