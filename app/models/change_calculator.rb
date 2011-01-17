module ChangeCalculator 
  
   EUR_COIN_SET = [50,20,10,5,2,1]
   USD_COIN_SET = [50,25,10,5,1]
   GBP_COIN_SET = [50,20,10,5,2,1]
   DEFAULT_COIN_SET = USD_COIN_SET
  
   
   # sets and validates the coin set 
   # raises and ArgumentError if the coin set in invalid
   # a coin set is invalid if it is empty, or if it does not contain the 1 coin.
   def self.coin_set=(coin_set)
     raise ArgumentError, "Invalid coin set: and empty coin set is not allowed" if coin_set.size == 0 
     raise ArgumentError, "Invalid coin set: a coin set must contain 1" unless coin_set.include? 1
     @@coin_set = coin_set
     # reverse sort the coin set
     @@coin_set.sort! {|x,y| y <=> x }
   end
   
   def self.coin_set
     @@coin_set
   end
   
   self.coin_set = DEFAULT_COIN_SET
   
   # generates an empty change set from the coin set
   def self.empty_change_set
     empty_change = {}
     coin_set.each{|x| empty_change[x] = 0}
     empty_change
   end  
   
   # returns a hash containing the optimal change denomination for a given change value from 1 to 99 cents.
   # raises and ArgumentError if change is not between 1 and 99 inclusive
   #
   # This method uses the current coin set and generates the change set such that the amount of coins is minimized.
   #
   # For example 98 cents using a coin set of [50,20,10,5,2,1] would return the following 
   # change hash 
   # 
   # {
   #   50 => 1,
   #   20 => 2,
   #   10 => 0,
   #   5 => 1,
   #   2 => 1,
   #   1 => 1
   #  }
   #
   # using a coin set of [50,25,10,5,1] would return the following
   # 
   # {
   #   50 => 1,
   #   25 => 1,
   #   10 => 2,
   #   5 => 0,
   #   1 => 3
   # }     
   def self.calc_change(change, change_set = empty_change_set)
       
       raise ArgumentError, "Invalid change amount passed: #{change}" if change < 0 || change > 99

       coin_set.each do |coin|
          if change >= coin
             change_set[coin] = change/coin
             # recursively calculate the change
             calc_change change%coin, change_set 
             return change_set
          end
       end
       change_set   
   end
end
