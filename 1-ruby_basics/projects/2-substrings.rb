def substrings(string, dictionary) 
    result = Hash.new(0)
    string = string.downcase.split(" ")

    string.each { |search_string|
        dictionary.each { |word| result[word] += 1 if search_string.include?(word)}
    }
    result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
puts substrings("below", dictionary)