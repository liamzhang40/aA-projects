class Array

  def my_uniq
    hash = Hash.new(0)
    self.each do |el|
      hash[el] += 1
    end
    hash.keys
  end

  def two_sum
    res = []
    (0...self.length - 1).each do |i|
      (i + 1...self.length).each do |j|
        res << [i, j] if self[i] + self[j] == 0
      end
    end
    res
  end

  def my_transpose
    row = self.length
    col = self[0].length

    res = Array.new(col) {Array.new(row)}

    (0...row).each do |i|
      (0...col).each do |j|
        res[j][i] = self[i][j]
      end
    end

    res
  end
end


def stock_picker(arr)
  raise ArgumentError unless arr.is_a?(Array)
  most_profit = nil
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      if !most_profit || most_profit[1]-most_profit[0]< arr[j]-arr[i]
        most_profit = [i,j]
      end
    end
  end
  most_profit
end
