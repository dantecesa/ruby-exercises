def bubble_sort(arr)
    sort_counter = nil

    while (sort_counter != false)
        sort_counter = false

        arr.each_with_index { |val, index|
            if index < arr.length-1
                if val > arr[index + 1]
                    arr[index] = arr[index + 1]
                    arr[index + 1] = val
                    sort_counter = true
                end
            end
        }
    end
    arr
end

pp bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]
