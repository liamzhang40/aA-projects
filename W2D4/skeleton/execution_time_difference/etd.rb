def my_min(list) # O(n^2) complexity
  my_smallest_variable = list[0]
  list.each do |num1|
    list.each_index do |idx|
      if list[idx] < my_smallest_variable
        my_smallest_variable = list[idx]
      end
    end
  end
  my_smallest_variable
end

def my_min(list) # O(n)
  my_smallest_variable = nil
  list.each do |num|
    if my_smallest_variable.nil? || num < my_smallest_variable
      my_smallest_variable = num
    end
  end
  my_smallest_variable
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

def largest_contiguous_subsum(arr) # O(n^3)
  res = nil
  (0...arr.length - 1).each do |i|
    (i...arr.length).each do |j|
      if res.nil? || (arr[i..j].inject(&:+) > res)
        res = arr[i..j].inject(&:+)
      end
    end
  end
  res
end

def largest_contiguous_subsum(arr) # O(n)
  maxsofar = arr[0]
  currentmax = arr[0]

  arr.each do |num|
    maxsofar = (maxsofar > currentmax) ? maxsofar : currentmax
    currentmax = (num > currentmax + num) ? num : currentmax + num
  end
  # p currentmax
  maxsofar
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])
