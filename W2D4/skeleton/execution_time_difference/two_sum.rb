require 'byebug'

def bad_two_sum?(arr, sum) # O(n^2)
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == sum
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target) #, first = 0, second = arr.length - 1) # O(log(n)) i think
  arr = arr.sort
  # return true if arr[first] + arr[second] == target
  # return false if second < first
  # # byebug
  # if arr[first] + arr[second] > target
  #   old_second = second
  #   second = ((second - first) / 2.0).floor
  #   second -= 1 if old_second == second
  #   okay_two_sum?(arr, target, first, second)
  # elsif arr[first] + arr[second] < target
  #   old_first = first
  #   first += ((second - first) / 2.0).ceil
  #   first += 1 if old_first == first
  #   return okay_two_sum?(arr, target, first, second)
  # end
  start_idx = 0
  end_idx = arr.length - 1

  until start_idx == end_idx # the REAL O(n* log(n)) from sorting
    sum = arr[start_idx] + arr[end_idx]
    return true if sum == target
    if sum > target
      end_idx -= 1
    else
      start_idx += 1
    end
  end

  false

end
# see above
# def alright_two_sum?(arr, target) # O(n)
#   start_idx = 0
#   end_idx = arr.length - 1
#
#   until start_idx == end_idx
#     sum = arr[start_idx] + arr[end_idx]
#     return true if sum == target
#     if sum > target
#       end_idx -= 1
#     else
#       start_idx += 1
#     end
#   end
#
#   false
# end

arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def hash_two_sum?(arr, target) # O(n)
  hash = Hash.new(false)
  arr.each do |el|
    return true if hash[el]

    hash[target - el] = true

  end
  false

end

p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false
