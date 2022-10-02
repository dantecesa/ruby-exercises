def caesar_cipher(text_to_shift, shift_factor) 
    text_to_shift.map { |char| 
        num = char.ord
        
        # check if we have an A-Z or a-z letter
        if (num >= 65 && num <= 122)
            # uppercase out of bounds
            if (num <= 90 && num + shift_factor > 90)
                offset = 91 - num
                num = 65 + shift_factor - offset
            # lowercase out of bounds
            elsif (num <=122 && num + shift_factor > 122)
                offset = 123 - num
                num = 97 + shift_factor - offset
            # legal move, just do it.
            else
                num = num + shift_factor
            end
        ## not a letter, let's preserve it
        else
            num = num
        end

        num.chr
    }.join("")
end

def collectUserInput()
    print "Please enter a string: "
    user_input = gets.chomp().split("")
    print "& how much do you want to shift it by? "
    user_shift_val = gets.to_i
    
    return {text_to_shift: user_input, shift_factor: user_shift_val }
end

def encrypt_input()     
    input = collectUserInput()
    result = caesar_cipher(input[:text_to_shift], input[:shift_factor])
    
    puts "Your shifted result is: #{result}"
end

encrypt_input()
