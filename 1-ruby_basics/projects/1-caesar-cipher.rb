def caesar_cipher(text_to_shift, shift_factor, result = '')
    text_to_shift.map { |char| 
        num = char.ord
        
        # Check we have A-Z or a-z, if not, just pass through
        if num.between?(65, 122)
            # A-Z? or a-Z?
            base = num < 91 ? 65 : 97

            # If our shift goes past "Z" || "z", we need to calc. by how much and add to respective "A" or "a".
            if (num.between?(65, 91) && num + shift_factor > 91 || num.between?(97, 122) && num + shift_factor > 122)
                num = base + shift_factor - (base + 26 - num)
            else
                num += shift_factor
            end
        end
        result += num.chr
    }
    result
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
