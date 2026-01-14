def bubble_sort(arr)
  n = arr.length

  loop do
    swapped = false
    i = 0

    loop do
      break if i >= n - 1

      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end

      i += 1
    end

    break if swapped == false
  end

  arr
end

p bubble_sort([3, 4, 78, 2, 0, 2])

