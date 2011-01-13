module ChangeCalculator 
  
   
   # empty change set
   NO_CHANGE = {
     50 => 0,
     20 => 0,
     10 => 0,
     5 => 0,
     2 => 0,
     1 => 0
   }
    
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
   def self.calc_min_change(change, change_map = NO_CHANGE.dup )
      
       raise ArgumentError, "Invalid change amount passed: #{change}" if change < 0 || change > 99
        
       if change >= 50
         change_map[50] = change/50
         calc_min_change(change%50, change_map )
       elsif change >= 20 
         change_map[20] = change/20
         calc_min_change(change%20, change_map )
       elsif change >= 10 
         change_map[10] = change/10
         calc_min_change(change%10, change_map )
       elsif change >= 5 
         change_map[5] = change/5
         calc_min_change(change%5, change_map )
       elsif change >= 2 
         change_map[2] = change/2
         calc_min_change(change%2, change_map )
       elsif change == 1
         change_map[1] = change
       end 
       change_map        
   end

end
