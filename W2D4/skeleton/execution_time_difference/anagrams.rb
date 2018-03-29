def first_anagram?(anagram, margana) # O(n!)
  anagram.chars.permutation.to_a.map do |sub_array|
    sub_array.join('')
  end.include?(margana)
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

def second_anagram?(anagram, margana) # O(n^2)
  a_arr = anagram.chars
  m_arr = margana.chars
  anagram.chars.each_index do |i|
    margana.chars.each_index do |j|
      if anagram[i] == margana[j]
        a_arr.delete_at(a_arr.index(anagram[i]))
        m_arr.delete_at(m_arr.index(anagram[j]))
      end
    end
  end
  a_arr.empty? && m_arr.empty?
end

# p second_anagram?("gizmo", "sally")
# p second_anagram?("elvis", "lives")

def third_anagram?(anagram, margana) # O(n * log(n)) dominates linear growth
  anagram.chars.sort == margana.chars.sort # linear according to stackoverflow
end

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")

def fourth_anagram?(anagram, margana) # O(n + n)
  a_hash = Hash.new(0)
  m_hash = Hash.new(0)

  anagram.chars.each do |char|
    a_hash[char] += 1
  end

  margana.chars.each do |char|
    m_hash[char] += 1
  end
  a_hash == m_hash
end

# p fourth_anagram?("gizmo", "sally")
# p fourth_anagram?("elvis", "lives")

def fourth_anagram_bonus_round?(anagram, margana)
  hash = Hash.new(0)

  anagram.chars.each do |char|
    hash[char] += 1
  end

  margana.chars.each do |char|
    hash[char] -= 1
  end

  hash.values.all?(&:zero?)
end


p fourth_anagram_bonus_round?("gizmo", "sally")
p fourth_anagram_bonus_round?("elvis", "lives")
