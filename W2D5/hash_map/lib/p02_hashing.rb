class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    each_with_index do |el, i|
      result += el.hash * i.hash
    end
    result
  end
end

class String
  def hash
    result = 0
    chars.each_with_index do |el, i|
      result += el.ord.hash * i.hash
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    each do |k,v|
      result += k.hash + v.hash
    end
    result
  end
end
