# Multiples of 3 and 5

# def is_suitable_num?(num)
#   num%3 == 0 || num%5 == 0
# end

# def return_array(num)
#   array = []
#   num.times do |x|
#     if is_suitable_num?(x)
#       array << x
#     end
#   end
#   array.inject(&:+)
# end

puts is_suitable_num?(5)
puts !is_suitable_num?(7)
puts return_array(100) == 2318
puts return_array(1000) == 233168

###############################################################################################################

# def return_fibonacci_array(num)
#   array = [1,1]
#   while (array[-1] + array[-2]) < num
#     array.push(array[-1] + array[-2])
#   end
#   array.select {|x| x.even?}
# end

# def sum_of_evens(array)
#   array.inject(&:+)
# end


p sum_of_evens(return_fibonacci_array(4000000)) == 4613732
p sum_of_evens(return_fibonacci_array(10000)) == 3382
p sum_of_evens(return_fibonacci_array(158934)) == 60696

###############################################################################################################

# def is_prime?(num)
#   (2..Math.sqrt(num)).each do |x|
#     return false if num%x == 0
#   end  
#   return true
# end

# def factors(num)
#   factors = []
#   (2..Math.sqrt(num)).each {|x| factors << x if num%x == 0}
#   factors
# end

# def largest_prime_factor(num)
#   array = factors(num).select!{|x| is_prime?(x)}
#   array.last
# end



p largest_prime_factor(600851475143) == 6857
p largest_prime_factor(120514157304) == 87179

##############################################################################################################

# Largest Palindrome product
# def largest_palindrome(start,finish)
#   array1 = (start..finish).to_a
#   array2 = (start..finish).to_a
#   array3 = []
#   array1.each do |x|
#     array2.each do |y|
#       z = (x*y)
#       array3.push(x*y) if z.to_s == z.to_s.reverse
#     end
#   end
#   array3.sort.last
# end

p largest_palindrome(100,999) == 906609

###############################################################################################################

# Smallest Multiple

p smallest_multiple(20) == 232792560

###############################################################################################################

# Sum Square Difference

p sum_square_difference == 25164150

###############################################################################################################

# 10001st prime

p target_prime == 104743

###############################################################################################################

# Largest product in a series

p largest_product == 40824

###############################################################################################################




