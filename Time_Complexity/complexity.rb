def my_min_1(arr)
  arr.each do |ele|
    smallest = true 
    arr.each do |ele_2|
      if ele_2 < ele 
        smallest = false 
      end 
    end 
    return ele if smallest == true 
  end 
end
# time complexity = O(n ^2)

def my_min_2(arr)
  smallest = arr[0]
  arr.each do |ele|
    if ele < smallest 
      smallest = ele 
    end 
  end 
  smallest 
end 
# time complexity = O(n)

def largest_contiguous_subsum_1(arr)
  subs = []
  greatest_val = 0

  arr.each_with_index do |ele_1, i| #n^2
    arr.each_with_index do |ele_2, j|
      subs << arr[i..j]
    end
  end

  subs.each do |sub| # n
    greatest_val = sum(sub) if sum(sub) > greatest_val
  end

  greatest_val
end

def sum(arr)
  sum = 0
  arr.each do |ele| # n
    sum += ele
  end
  sum
end

# 2n + n^2
# n + n^2
# n^2

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

def largest_contiguous_subsum_2(arr)
    current_sum = 0
    best_sum = 0

    arr.each do |ele|
      current_sum += ele
      if current_sum > best_sum 
        best_sum = current_sum 
      end 
      if current_sum < 0
        current_sum = 0
      end 
    end

    best_sum
end 
#time complexity = O(n)

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum_2(list) # => 8 (from [7, -6, 7])


def first_anagram?(str_1, str_2)
  letters = str_1.split("")
  permutations = letters.permutation.to_a(str_1.length)
  joined = permutations.map { |perm| perm.join("") }
  joined
  joined.include?(str_2)
end
#time complexity = O(n!)


# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str_1, str_2)
  str_1.each_char do |ele|
    idx_2 = str_2.index(ele)
    if idx_2 != nil
      str_2[ele] = ""
    end
  end
  str_2.empty?
end 

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true


def third_anagram?(str_1, str_2)
  arr_1 = str_1.split("")
  arr_2 = str_2.split("")

  arr_1.sort == arr_2.sort
end
# time complexity = (n log n)

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str_1, str_2)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)

  str_1.each_char do |char|
    hash_1[char] += 1
  end 

  str_2.each_char do |char|
    hash_2[char] += 1
  end 

  hash_1 == hash_2
end 

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true