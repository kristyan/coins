class ChangeController < ApplicationController
  
  def index
  end  
  
  def result
     @coins = params[:id].to_i
     begin
       @change = ChangeCalculator.calc_min_change(@coins).sort   
     rescue ArgumentError
       # just return an empty result a bad param is given
       @change = ChangeCalculator::NO_CHANGE.sort
     end     
  end
end
