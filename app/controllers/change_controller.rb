class ChangeController < ApplicationController
  
  def index
  end  
  
  def result
     @coins = params[:id].to_i
     begin
       ChangeCalculator.coin_set = APP_CONFIG['coin_set']
       @change = ChangeCalculator.calc_min_change(@coins).sort   
     rescue ArgumentError
       # just return an empty result a bad param is given
       @change = ChangeCalculator.empty_change_set.sort
     end     
  end
end
