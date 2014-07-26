Then(/^I should have ([0-9]+) menu option$/) do |count|
  MenuOption.count.should == count.to_i
end  