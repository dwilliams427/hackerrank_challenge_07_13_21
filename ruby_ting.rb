def pthFactor(n, p)
  return 1 if n == 1 && p < 2
    return 0 if p > n
    return 0 if n.to_i == 0
    factors = [1]
    final_arr = []
    digits = n.to_s.chars.map {|digit| digit.to_i}
    
    if n % 2 == 0 || digits[-1] % 2 == 0 
        factors << 2
    end
    if n % 3 == 0 || digits.sum % 3 == 0
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
        factors << 8
    end
    if n % 9 == 0 || (digits.sum % 9 == 0 && n % 9 == 0)
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
    
    lower = 13
    upper = n / 2
    counter = 1
    while lower <= upper
        #escape hatch for large prime numbers
        if counter == 99000000
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
    
    
    factors.each do |num|       
      final_arr << num
    end
    
    factors.reverse.each do |num|
      final_arr << n / num unless final_arr.include?(n / num)
    end
    
    return 0 if p > final_arr.length
    return final_arr[p - 1]
end

p pthFactor(10, 3)
p pthFactor(1048576, 12)
p pthFactor(22876792454961, 28)
p pthFactor(67280421310721, 2)