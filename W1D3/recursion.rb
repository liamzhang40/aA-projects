require 'byebug'
def range(min, max)
  return [] if min >= max
  [min] + range(min + 1, max)
end

def exp1(b, e)
  return 1 if e == 0
  b * exp(b, e - 1)
end

def exp2(b, e)
  return 1 if e == 0

  if e.even?
    exp2(b, e / 2) * exp2(b, e / 2)
  else
    b * (exp2(b, (e - 1) / 2) ** 2)
  end
end

def deep_dup(arr)
  arr.map do |sub_arr|
    if sub_arr.is_a? Array
      deep_dup(sub_arr)
    else
      sub_arr
    end
  end
end

def fib(n)
  return [0, 1].take(n) if n <= 2
  fib(n - 1) + [fib(n - 1).last(2).reduce(&:+)]
end

def subsets(arr)
  # # byebug
  # return [[]] if arr.empty?
  # last_el = arr.pop
  # previous_sets = subsets(arr)
  # previous_sets + previous_sets.map {|sub_arr| sub_arr + [last_el]}
  return [[]] if arr.empty?
  last_el = arr.pop
  previous_sets = subsets(arr)
  previous_sets + previous_sets.map {|sub_set| sub_set + [last_el]}
end

def permutation(arr)
  return [[]] if arr.empty?
  length = arr.length
  last_el = arr.pop
  res = []
  # debugger
  previous_per = permutation(arr)
  previous_per.each do |sub_per|
    length.times do |idx|
      res << sub_per[0...idx] + [last_el] + sub_per[idx..-1]
    end
  end
  res
end

def bsearch(nums, target)
  middle = nums.length / 2
  debugger
  return middle if nums[middle] == target
  return nil if nums.empty?

  if nums[middle] > target
    debugger
    side = nums.take(middle)
    bsearch(side, target)
  else
    debugger
    side = nums.drop(middle + 1)
    previous_mid = bsearch(side, target)
    previous_mid + middle + 1 if previous_mid
  end
end

def merge_sort(arr, &prc)
  prc ||= Proc.new {|first, second| first <=> second}
  return arr if arr.length <= 1
  middle = arr.length / 2
  left, right = arr.take(middle), arr.drop(middle)

  sorted_left, sorted_right = merge_sort(left, &prc), merge_sort(right, &prc)
  merge(sorted_left, sorted_right, &prc)
end

def merge(left, right, &prc)
  res = []
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1 || 0
      res << left.shift
    when 1
      res << right.shift
    end
  end

  res + left + right
end
