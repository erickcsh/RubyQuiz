Then(/^the display should be (.*)$/) do |number|
  formatted_number =  Object.const_get(number)
  p formatted_number
  display = LCD::DisplayBuilder.new(LCD::ARGVParser.options).lcd_numbers
  expect(display).to eq(formatted_number)
end

Given(/^I started the program$/) do
end

When(/^I enter the number (\d+)$/) do |arg1|
  ARGV << arg1
end

When(/^I enter the size (\d+)$/) do |arg1|
  ARGV << '-s'
  ARGV << arg1
end

ZERO_SIZE_1 =
"""
 -  
| | 
    
| | 
 -  
"""
ZERO_SIZE_2 =
"""
 --   
|  |  
|  |  
      
|  |  
|  |  
 --   
"""
LONG_SIZE_1 =
"""
     -   -       -   -   -   -   -  
  |   |   | | | |   |     | | | | | 
     -   -   -   -   -       -   -  
  | |     |   |   | | |   | | |   | 
     -   -       -   -       -   -  
"""
LONG_SIZE_2 =
"""
       --    --          --    --    --    --    --   
   |     |     |  |  |  |     |        |  |  |  |  |  
   |     |     |  |  |  |     |        |  |  |  |  |  
       --    --    --    --    --          --    --   
   |  |        |     |     |  |  |     |  |  |     |  
   |  |        |     |     |  |  |     |  |  |     |  
       --    --          --    --          --    --   
"""

