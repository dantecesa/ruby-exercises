def stock_picker(trades)
    biggest_delta = 0
    best_tuple = []
    
    trades.each_with_index { |trade, index|
        trades[index..trades.length].each_with_index { |nextTrade, index2|
            new_delta = nextTrade - trade
            
            if new_delta > biggest_delta
                biggest_delta = new_delta
                best_tuple = [index, index2 + 1]
            end
        }
    }
    best_tuple
end

pp stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12
