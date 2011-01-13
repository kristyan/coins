module ChangeCalculator 
   
   NO_CHANGE = {
     50 => 0,
     20 => 0,
     10 => 0,
     5 => 0,
     2 => 0,
     1 => 0
   }
        
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
