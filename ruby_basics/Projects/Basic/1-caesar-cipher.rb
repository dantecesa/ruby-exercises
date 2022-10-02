def caesar_cipher(input, shift) 
    result = input.map { |char| 
        num = char.ord
        
        # check if we have an A-Z or a-z letter
        if (num >= 65 && num <= 122)
            # uppercase out of bounds
            if (num <= 90 && num + shift > 90)
                offset = 91 - num
                num = 65 + shift - offset
            # lowercase out of bounds
            elsif (num <=122 && num + shift > 122)
                offset = 123 - num
                num = 97 + shift - offset
            # legal move, just do it.
            else
                num = num + shift
            end
        ## not a letter, let's preserve it
        else
            num = num
        end

        num.chr
    }.join("")
end

def get_input() 
    print "Please enter a string: "
    input = gets.chomp()
    print "& how much do you want to shift it by? "
    shift = gets

    print "Your new word is: "
    puts caesar_cipher(input.split(""), shift.to_i)
end

get_input()
