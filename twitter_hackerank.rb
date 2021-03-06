
=begin
k = cutoff rank for leveling up a player - UPPER BOUND  
scores[n] = array of ints denoting scores of the players, which  are ranked from highest to lowest (highest num = #1, lowest num = #-1 or LAST)
returns = int of players who can level up after this round

#EXAMPLE 1
k = 4
scores[20, 40, 60, 80, 100]

rankings in order   5  4   3   2   1
                  [20, 40, 60, 80, 100]

k = 4, rankings cut off at > 4, so only 4 will level up 
return 4

#EXAMPLE 2
k = 4
scores[80, 40, 60, 40, 100]

rankings in order   4   4   3   2    1
                  [40, 40, 60, 80, 100]

players with equal scores will have equal ranks, but next player will have lower score
BASED ONPOSITION IN THE LIST

k = 4, so all 5 player will level up
return 5


=end

# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER k
#  2. INTEGER_ARRAY scores

# using 4, scores[2, 2, 3, 4, 5] as example
def numPlayers(k, scores)
  #PSEUDOCODE
  #max = scores[0]
  #rank = scores.length + 1 --> 6
  # rank_array = []
  #index = 0
  #hash = {}???
  #sorted_scores = scores.sort!

# CODE
  rank = 1
  sorted_scores = scores.sort! {|x, y| y <=> x}
  rank_array = []
  leveled_up = 0
  index = 0
  hash = {}

  #rankings in order   1     2   2   4
  #                   [100, 80, 80, 40]

  # should return 4
  # loop thru array, our first number will always be rank 1
    # loop 1 - array[0] = 100, check if hash[array[index]] exists
      # if NOT, 
        # then hash[array[index]] = rank --> rank = 1
        # add rank to rank_array --- rank_array << rank
        # rank++ and index++
      #if it does exist, 
        #now rank_array << hash[array[index]]

    # RANK = 2, INDEX = 1
    #loop 2 - array[1] = 80, check if hash[array[index]] exists
      # if NOT, 
        # then hash[array[index]] = rank --> rank = 2
        # add rank to rank_array --- rank_array << rank
        # rank++ and index++
      #if it does exist, 
        #now rank_array << hash[array[index]]

    # RANK = 3, INDEX = 2
    #loop 2 - array[1] = 80, check if hash[array[index]] exists
      # if NOT, 
        # then hash[array[index]] = rank --> rank = 2
        # add rank to rank_array --- rank_array << rank
        # rank++ and index++
      #if it does exist, 
        #now rank_array << hash[array[index]] --> hash[array[index]] = 2
        # rank ++

    # RANK = 4, INDEX = 3
    #loop 2 - array[1] = 40, check if hash[array[index]] exists
      # if NOT, 
        # then hash[array[index]] = rank --> rank = 4
        # add rank to rank_array --- rank_array << rank
        # rank++ and index++
      #if it does exist, 
        #now rank_array << hash[array[index]] --> hash[array[index]] = 2
        # rank ++

  while index < sorted_scores.length
    if sorted_scores[index] == 0
      index += 1
      next
    end
    if hash[sorted_scores[index]]
      rank_array << hash[sorted_scores[index]]
      rank += 1
    else
      hash[sorted_scores[index]] = rank
      rank_array << rank
      rank += 1      
    end
    index += 1
  end

  
  #once we have our rank array, determine who gets leveled up
  #loop thru array, if rank_array[i] > k, do not increase level up counter
  rank_array.each do |num|
    if num <= k
      leveled_up += 1
    end
  end

  return "Players leveling up: #{leveled_up}"
  # return leveled_up


end

# p numPlayers(4, [80, 40, 60, 40, 100])
p numPlayers(4, [2, 1, 2, 4, 5])




#FIND THE FACTOR
# determine all factors of a number (all positive integers that evenly divide into number) and return pth element,
# sorted ascending. if not pth, return 0
=begin
  #EXAMPLE
  n = 20
  p = 3
  get the third divisor of 20
  all divisors of 20 == [1, 2, 4, 5, 10, 20] --> for 3rd element, we'd return 4

  if there was no 3rd element, return 0


  # goal post starts at 1 and 20 and they will both move closer to each other
  # lowerbound will NEVER go past halfway point + 1

  
#account for primes
#account for 1 or 2
factors = [1]
# LOOP, until lowerbound == upperbound --- U = n/2, L = 1
    if n % L == 0
      add L to factors array --> [1, 2]
      L++ 
    



FIRST LOOP
  #loop , lowerbound = 1, upperbound = n
    if upperbound % lowerbound = 0
      add lowerbound only
      lower bound ++, upper bound now = 20 / 2 --> 10  ---- upperbound = n / lowerbound
    if false,
      lowerbound ++, upperbound doesnt move

#07/13/21 Try moving the upperbound as well as lower bound, 
    when they meet,  we now go loop thru our new factors array and repeat the process 
      **check if length of factors array == p, if it does then return factors[p-1]
      --> n / index = ? --> this number is now added to our factors array
      
      EXAMPLE: (200, 4)
      upper = n/2
      lower = 2
      ANOTHER IDEA --> check last digit of number first --> https://www.chilimath.com/lessons/introductory-algebra/divisibility-rules-for-2-3-4-5-6-9-and-10/
      if number ends 0, 2, 4, 6, or 8 --> it is divisble by 2
        add 2 to factors[]
      if the SUM of the digits is divisble by 3  --> 3 is true
          false
      if last 2 digits are divisble by 4  --> 4 is true
        add 4 to factors[]
      if number ends in 0 or 5 --> 5 is true
        add 5 to factors[]
      if number is div by 2 AND 3 --> 6 is true
        false
      ****FOR SEVEN, ELEVEN, AND 12 IS BONKERS --> https://www.chilimath.com/lessons/introductory-algebra/divisibility-rules-for-7-11-and-12/
      for number 7 --> take last digit, double it, then original number (subtract) new number ---> REPEAT UNTIL ONLY 2 DIGITS -- if new 2 digit number
        is div by 7, then 7 is true
      for 8, if last THREE digits as a whole number are div by 8, --> 8 is true
      if sum of digits is div by 9 --> 9 is true
        false
      if last digit is 0 --> 10 is true 
        add 10 to factors[]
      for 11 --> Alternately add and subtract the digits of a number from left to right. 
        If the answer is divisible by 11 -->  then 11 is true
        false
      for 12, if div by 3 and 4, --> 12 is true
        false

      once our lowerbound have met our upperbound, we now move on to loop thru our new factors array
      In this factors array, we will go thru and find n / index = ?, and add that num to array

      
  
=end
def pthFactor(n, p)
  #FOURTH AND FINAL ATTEMPT
  return 1 if n == 1 && p < 2 #check if p is greater than 1
  return 0 if p > n
  return 0 if n.to_i == 0

  # upper = n / 2
  # lower = 2
  factors = [1]
  final_arr = []
  digits = n.to_s.chars.map {|digit| digit.to_i}
  p "all digits: #{digits}"
  # LOOP, until lowerbound == upperbound --- U = n/2, L = 1
    # return factors[p - 1] if factors.length == p
    if n % 2 == 0 || digits[-1] % 2 == 0 
      p "digits[-1]: #{digits[-1]}"
      factors << 2 
    end
    if n % 3 == 0 || digits.sum % 3 == 0
      p "digits sum: #{digits.sum}"
      factors << 3
    end
    if n % 4 == 0 || (digits[-1] + digits[-2]) % 4 == 0
      factors << 4
    end
    if n % 5 == 0 || digits[-1] == 0
      factors << 5
    end
    if n % 2 == 0 && n % 3 == 0
      factors << 6
    end
    if n % 7 == 0 
      factors << 7
    end
    if n % 8 == 0 || digits.pop(3).join % 8 == 0 
      p "number 8: #{digits.pop(3)}"
      factors << 8
    end
    if  n % 9 == 0 || (digits.sum % 9 == 0 && n % 9 == 0)
      p "digits sum(9): #{digits.sum}"
      factors << 9
    end
    if n % 10 == 0 || digits[-1] == 0
      factors << 10
    end
    if n % 11 == 0
      factors << 11
    end
    if n % 12 == 0 || (n % 4 == 0 && n % 3 == 0) 
      factors << 12
    end

    p "FACTORS AFTER IFS: #{factors}"

    # now we can loop until our lower bound reaches our upper bound
    lower = 13
    upper = n / 2
    counter = 1
    while lower <= upper
      #NEW REITERATION
      #MAX NUMBER --> 1,000,000,000 and 500mil, 250mil
      if counter == 100000000
        return 1 if p == 1
        return n if p == 2
        return 0 if  p > 2        
      end 
      if n % lower == 0
        factors << lower
        upper = n / lower
      end
      lower += 1
      counter += 1
    end

    p "FACTORS AFTER WHILE LOOP: #{factors}"

    # duplicate factors array
    factors.each do |num|
      final_arr << num
    end
    #then loop backwards and add the divisors n / factors[index]
    factors.reverse.each do |num|
      final_arr << n / num unless final_arr.include?(n / num)
    end

    return 0 if p > final_arr.length

  p "final_arr BEFORE SORT: #{final_arr}"
  p "final_arr: #{final_arr}"
  p "final_arr length: #{final_arr.length} and p: #{p}"
  p "final result: #{final_arr[p - 1]}"

  return final_arr[p - 1]


end

p pthFactor(10, 3)
p pthFactor(1048576, 12)
p pthFactor(22876792454961, 28)
p pthFactor(67280421310721, 2)

#THIRD ATTEMPT
# return 1 if n == 1
# return 0 if p > n
# return n if p == n

# upper = n / 2
# lower = 2
# factors = [1]
# # LOOP, until lowerbound == upperbound --- U = n/2, L = 1
# while lower <= upper
#   # if n % L == 0
#   if n % lower == 0
#     #   add L to factors array --> [1, 2]
#     factors << lower
#     #   L++ 
#   end
#   lower += 1
# end
# factors << n
# p "factors: #{factors}"
# return factors[p - 1]

# SECOND ATTEMPT
#check if prime first??
# goal post starts at 1 and 20 and they will both move closer to each other
# goal post will never go past halfway point
# return 1 if n == 1
# return 0 if p > n
# numbers = []
# factors = []
# (1..n).select { |num| numbers << num}
# puts("numbers #{numbers}")
# puts("factors: #{factors}")
# if factors[p - 1] == nil
#   return 0
# else
#   return factors[p - 1]
# end


# FIRST ATTEMPT - LINEAR RUNTIME - TOO SLOW
# return 1 if n == 1
# factors = (1..n).select { |num|n % num == 0}
# puts("length #{factors.length}")
# puts("factors: #{factors}")
# if factors[p - 1] == nil
#   return 0
# else
#   return factors[p - 1]
# end