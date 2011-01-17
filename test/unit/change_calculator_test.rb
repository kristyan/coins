require 'test_helper'

class ChangeCalculatorTest < ActiveSupport::TestCase
  
  test "set invalid coin set" do
    assert_raise ArgumentError do 
      ChangeCalculator.coin_set = []
    end
    assert_raise ArgumentError do 
      ChangeCalculator.coin_set = [2,3]
    end
  end
  
  
  test "change for negative cents" do
    assert_raise ArgumentError do 
      ChangeCalculator.calc_change(-1)
    end
  end
  
  test "change for to many cents" do
    assert_raise ArgumentError do 
      ChangeCalculator.calc_change(100)
    end
  end
  
  test "change for 0 cents" do
    eur_test(0, {
      50 => 0,
      20 => 0,
      10 => 0,
      5 => 0,
      2 => 0,
      1 => 0
    })
    
    usd_test(0, {
      50 => 0,
      25 => 0,
      10 => 0,
      5 => 0,
      1 => 0
    })
  end
  
  test "change for 1 cent" do
    eur_test(1, {
      50 => 0,
      20 => 0,
      10 => 0,
      5 => 0,
      2 => 0,
      1 => 1
    })
    
    usd_test(1, {
      50 => 0,
      25 => 0,
      10 => 0,
      5 => 0,
      1 => 1
    })
  end
  
  test "change for 2 cents" do
    eur_test(2, {
      50 => 0,
      20 => 0,
      10 => 0,
      5 => 0,
      2 => 1,
      1 => 0
    })
    
    usd_test(2, {
      50 => 0,
      25 => 0,
      10 => 0,
      5 => 0,
      1 => 2
    })
  end
  
  test "change for 3 cents" do
    eur_test(3, {
      50 => 0,
      20 => 0,
      10 => 0,
      5 => 0,
      2 => 1,
      1 => 1
    })
    
    usd_test(3, {
      50 => 0,
      25 => 0,
      10 => 0,
      5 => 0,
      1 => 3
    })
  end
   
  test "change for 4 cents" do
    eur_test(4, {
       50 => 0,
       20 => 0,
       10 => 0,
       5 => 0,
       2 => 2,
       1 => 0
     })

    usd_test(4, {
       50 => 0,
       25 => 0,
       10 => 0,
       5 => 0,
       1 => 4
     })
  end
    
  test "change for 5 cents" do
    eur_test(5, {
       50 => 0,
       20 => 0,
       10 => 0,
       5 => 1,
       2 => 0,
       1 => 0
     })

    usd_test(5, {
       50 => 0,
       25 => 0,
       10 => 0,
       5 => 1,
       1 => 0
     })    
  end
    
  test "change for 6 cents" do
    eur_test(6, {
       50 => 0,
       20 => 0,
       10 => 0,
       5 => 1,
       2 => 0,
       1 => 1
     })

    usd_test(6, {
       50 => 0,
       25 => 0,
       10 => 0,
       5 => 1,
       1 => 1
     })
  end
    
  test "change for 8 cents" do
    eur_test(8, {
       50 => 0,
       20 => 0,
       10 => 0,
       5 => 1,
       2 => 1,
       1 => 1
     })

    usd_test(8, {
       50 => 0,
       25 => 0,
       10 => 0,
       5 => 1,
       1 => 3
     })
  end
    
  test "change for 10 cents" do
    eur_test(10, {
       50 => 0,
       20 => 0,
       10 => 1,
       5 => 0,
       2 => 0,
       1 => 0
     })

    usd_test(10, {
       50 => 0,
       25 => 0,
       10 => 1,
       5 => 0,
       1 => 0
     })   
  end
    
  test "change for 11 cents" do
    eur_test(11, {
       50 => 0,
       20 => 0,
       10 => 1,
       5 => 0,
       2 => 0,
       1 => 1
     })

    usd_test(11, {
       50 => 0,
       25 => 0,
       10 => 1,
       5 => 0,
       1 => 1
     })
  end
    
  test "change for 15 cents" do
    eur_test(15, {
       50 => 0,
       20 => 0,
       10 => 1,
       5 => 1,
       2 => 0,
       1 => 0
     })

    usd_test(15, {
       50 => 0,
       25 => 0,
       10 => 1,
       5 => 1,
       1 => 0
     })    
  end
    
  test "change for 20 cents" do
    eur_test(20, {
       50 => 0,
       20 => 1,
       10 => 0,
       5 => 0,
       2 => 0,
       1 => 0
     })

    usd_test(20, {
       50 => 0,
       25 => 0,
       10 => 2,
       5 => 0,
       1 => 0
     })   
  end
    
  test "change for 25 cents" do
    eur_test(25, {
       50 => 0,
       20 => 1,
       10 => 0,
       5 => 1,
       2 => 0,
       1 => 0
     })

    usd_test(25, {
       50 => 0,
       25 => 1,
       10 => 0,
       5 => 0,
       1 => 0
     })
  end
    
  test "change for 30 cents" do
    eur_test(30, {
       50 => 0,
       20 => 1,
       10 => 1,
       5 => 0,
       2 => 0,
       1 => 0
     })

    usd_test(30, {
       50 => 0,
       25 => 1,
       10 => 0,
       5 => 1,
       1 => 0
     })
  end
    
  test "change for 50 cents" do
    eur_test(50, {
       50 => 1,
       20 => 0,
       10 => 0,
       5 => 0,
       2 => 0,
       1 => 0
     })

    usd_test(50, {
       50 => 1,
       25 => 0,
       10 => 0,
       5 => 0,
       1 => 0
     })
  end
    
  test "change for 60 cents" do
    eur_test(60, {
       50 => 1,
       20 => 0,
       10 => 1,
       5 => 0,
       2 => 0,
       1 => 0
     })

    usd_test(60, {
       50 => 1,
       25 => 0,
       10 => 1,
       5 => 0,
       1 => 0
     })
  end
    
  test "change for 88 cents" do
    eur_test(88, {
       50 => 1,
       20 => 1,
       10 => 1,
       5 => 1,
       2 => 1,
       1 => 1
     })

    usd_test(88, {
       50 => 1,
       25 => 1,
       10 => 1,
       5 => 0,
       1 => 3
     })
  end
    
  test "change for 98 cents" do
    eur_test(98, {
       50 => 1,
       20 => 2,
       10 => 0,
       5 => 1,
       2 => 1,
       1 => 1
     })

    usd_test(98, {
       50 => 1,
       25 => 1,
       10 => 2,
       5 => 0,
       1 => 3
     })
  end
    
  # test the USD coin set for given change
  def usd_test(change, expected_result)
    ChangeCalculator.coin_set = ChangeCalculator::USD_COIN_SET
    assert_equal ChangeCalculator.calc_change(change), expected_result
  end
    
  # test the EUR coin set for given change
  def eur_test(change, expected_result)
    ChangeCalculator.coin_set = ChangeCalculator::EUR_COIN_SET
    assert_equal ChangeCalculator.calc_change(change), expected_result
  end  
end
