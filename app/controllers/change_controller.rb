class ChangeController < ApplicationController
  def index
  end  
  def result
     @coins = params[:id].to_i
     begin
       @change = ChangeCalculator.calc_min_change(@coins).sort   
     rescue ArgumentError
       @change = ChangeCalculator::NO_CHANGE.sort
     end     
  end
end
