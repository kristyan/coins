module ChangeCalculator 
  
   DEFAULT_COIN_SET = [50,25,20,10,5,2,1]
   
   # set or get the coin set
   mattr_accessor :coin_set
   self.coin_set = DEFAULT_COIN_SET
   
   # generates an empty change set from the coin set
   def self.empty_change_set
     empty_change = {}
     coin_set.each{|x| empty_change[x] = 0}
     empty_change
   end   
    
   # returns a hash containing the optimal change denomination for a given change value from 1 to 99 cents.
   # This method assumes change can only consist of 1,2,5,10,20 and 50 cent coins, and generates the change set
   # such that the amount of coins is minimized.
   #
   # For example 98 cents would return the following change hash (ie. 1*50c + 2*20c + 1*5c + 1*2c + 1*1c  )
   # 
   # {
   #   50 => 1,
   #   20 => 2,
   #   10 => 0,
   #   5 => 1,
   #   2 => 1,
   #   1 => 1
   #  }       
   def self.calc_min_change(change, change_map = empty_change_set )
       
       raise ArgumentError, "Invalid change amount passed: #{change}" if change < 0 || change > 99

       coin_set.each do |coin|
          if change >= coin
             change_map[coin] = change/coin
             # recursively calculate the change
             calc_min_change(change%coin, change_map )
             return change_map
          end
       end
       change_map   
   end
end
