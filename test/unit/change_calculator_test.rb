require 'test_helper'

class ChangeCalculatorTest < ActiveSupport::TestCase
  
  ChangeCalculator.coin_set = [50,20,10,5,2,1]
  
  test "change for negative cents" do
    assert_raise ArgumentError do 
      ChangeCalculator.calc_min_change(-1)
    end
  end
  
  test "change for to many cents" do
    assert_raise ArgumentError do 
      ChangeCalculator.calc_min_change(100)
    end
  end
  
  test "change for 0 cents" do
    expected_result = {
      50 => 0,
      20 => 0,
      10 => 0,
      5 => 0,
      2 => 0,
      1 => 0
    }
    assert_equal ChangeCalculator.calc_min_change(0), expected_result
  end
  
  test "change for 1 cent" do
    expected_result = {
      50 => 0,
      20 => 0,
      10 => 0,
      5 => 0,
      2 => 0,
      1 => 1
    }
    assert_equal ChangeCalculator.calc_min_change(1), expected_result
  end
  
  test "change for 2 cents" do
    expected_result = {
      50 => 0,
      20 => 0,
      10 => 0,
      5 => 0,
      2 => 1,
      1 => 0
    }
    assert_equal ChangeCalculator.calc_min_change(2), expected_result
  end
  
  test "change for 3 cents" do
     expected_result = {
       50 => 0,
       20 => 0,
       10 => 0,
       5 => 0,
       2 => 1,
       1 => 1
     }
     assert_equal ChangeCalculator.calc_min_change(3), expected_result
   end
   
   test "change for 4 cents" do
      expected_result = {
        50 => 0,
        20 => 0,
        10 => 0,
        5 => 0,
        2 => 2,
        1 => 0
      }
      assert_equal ChangeCalculator.calc_min_change(4), expected_result
    end
    
   test "change for 5 cents" do
      expected_result = {
        50 => 0,
        20 => 0,
        10 => 0,
        5 => 1,
        2 => 0,
        1 => 0
      }
      assert_equal ChangeCalculator.calc_min_change(5), expected_result
    end
    
    test "change for 6 cents" do
       expected_result = {
         50 => 0,
         20 => 0,
         10 => 0,
         5 => 1,
         2 => 0,
         1 => 1
       }
       assert_equal ChangeCalculator.calc_min_change(6), expected_result
    end
    
    test "change for 8 cents" do
       expected_result = {
         50 => 0,
         20 => 0,
         10 => 0,
         5 => 1,
         2 => 1,
         1 => 1
       }
       assert_equal ChangeCalculator.calc_min_change(8), expected_result
    end
    
    test "change for 10 cents" do
       expected_result = {
         50 => 0,
         20 => 0,
         10 => 1,
         5 => 0,
         2 => 0,
         1 => 0
       }
       assert_equal ChangeCalculator.calc_min_change(10), expected_result
    end
    
    test "change for 11 cents" do
       expected_result = {
         50 => 0,
         20 => 0,
         10 => 1,
         5 => 0,
         2 => 0,
         1 => 1
       }
       assert_equal ChangeCalculator.calc_min_change(11), expected_result
    end
    
    test "change for 15 cents" do
       expected_result = {
         50 => 0,
         20 => 0,
         10 => 1,
         5 => 1,
         2 => 0,
         1 => 0
       }
       assert_equal ChangeCalculator.calc_min_change(15), expected_result
    end
    
    test "change for 20 cents" do
       expected_result = {
         50 => 0,
         20 => 1,
         10 => 0,
         5 => 0,
         2 => 0,
         1 => 0
       }
       assert_equal ChangeCalculator.calc_min_change(20), expected_result
    end
    
    test "change for 25 cents" do
       expected_result = {
         50 => 0,
         20 => 1,
         10 => 0,
         5 => 1,
         2 => 0,
         1 => 0
       }
       assert_equal ChangeCalculator.calc_min_change(25), expected_result
    end
    
    test "change for 30 cents" do
     expected_result = {
       50 => 0,
       20 => 1,
       10 => 1,
       5 => 0,
       2 => 0,
       1 => 0
     }
     assert_equal ChangeCalculator.calc_min_change(30), expected_result
    end
    
    test "change for 50 cents" do
     expected_result = {
       50 => 1,
       20 => 0,
       10 => 0,
       5 => 0,
       2 => 0,
       1 => 0
     }
     assert_equal ChangeCalculator.calc_min_change(50), expected_result
    end
    
    test "change for 60 cents" do
     expected_result = {
       50 => 1,
       20 => 0,
       10 => 1,
       5 => 0,
       2 => 0,
       1 => 0
     }
     assert_equal ChangeCalculator.calc_min_change(60), expected_result
    end
    
    test "change for 88 cents" do
     expected_result = {
       50 => 1,
       20 => 1,
       10 => 1,
       5 => 1,
       2 => 1,
       1 => 1
     }
     assert_equal ChangeCalculator.calc_min_change(88), expected_result
    end
    
    test "change for 98 cents" do
     expected_result = {
       50 => 1,
       20 => 2,
       10 => 0,
       5 => 1,
       2 => 1,
       1 => 1
     }
     assert_equal ChangeCalculator.calc_min_change(98), expected_result
    end
end
