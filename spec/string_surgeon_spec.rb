require "#{File.dirname(__FILE__)}/../lib/string_surgeon"


describe 'string_surgeon' do
  before(:each) do
    @test_string = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online advertising technologies."
    #@test_string = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products."
  
  end

  it 'should chop before first hyperlink in the string' do
    truncate_at = "Google is an American multi"
    chopped_str = @test_string.chop_at(truncate_at.length)
    chopped_str[:truncated].should eql("Google is an American multi...")
    chopped_str[:remaining].should eql("national <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online advertising technologies.")
    chopped_str[:full_text].should eql(@test_string)
  end 

  it 'should chop in the middle of first hyperlink label in the string' do
    truncate_at = "Google is an American multinational corp"
    chopped_str = @test_string.chop_at(truncate_at.length)
    chopped_str[:truncated].should eql("Google is an American multinational <a href='http://www.google.com/corporation'>corp</a>...")
    chopped_str[:remaining].should eql(" specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online advertising technologies.")
    chopped_str[:full_text].should eql(@test_string)
  end 

  it 'should chop at the end of first hyperlink label in the string' do
    truncate_at = "Google is an American multinational corporation"
    chopped_str = @test_string.chop_at(truncate_at.length)
    chopped_str[:truncated].should eql("Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a>...")
    chopped_str[:remaining].should eql(" specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online advertising technologies.")
    chopped_str[:full_text].should eql(@test_string)
  end 

  it 'should chop before second hyperlink in the string' do
    truncate_at = "Google is an American multinational corporation specializing in Internet-related services and produc"
    chopped_str = @test_string.chop_at(truncate_at.length)
    chopped_str[:truncated].should eql("Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and produc...")
    chopped_str[:remaining].should eql("ts. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online advertising technologies.")
    chopped_str[:full_text].should eql(@test_string)
  end

  it 'should chop in the middle of second hyperlink label in the string' do
    truncate_at = "Google is an American multinational corporation specializing in Internet-related services and products. These include search, cloud comp"
    chopped_str = @test_string.chop_at(truncate_at.length)
    chopped_str[:truncated].should eql("Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud comp</a>...")
    chopped_str[:remaining].should eql(", software, and online advertising technologies.")
    chopped_str[:full_text].should eql(@test_string)
  end
 
  # it 'should chop after the last hyperlink in the string' do  
  #   truncate_at = "Google is an American multinational corporation specializing in Internet-related services and products. These include search, cloud computing, software, and online adv"
  #   chopped_str = @test_string.chop_at(truncate_at.length)
  #   chopped_str[:truncated].should eql("Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online adv...")
  #   chopped_str[:remaining].should eql("ertising technologies.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end

  # it 'should not chop the string when truncate length equal to the string text' do
  #   truncate_at = "Google is an American multinational corporation specializing in Internet-related services and products. These include search, cloud computing, software, and online advertising technologies."
  #   chopped_str = @test_string.chop_at(truncate_at.length)
  #   chopped_str[:truncated].should eql("Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online advertising technologies.")
  #   chopped_str[:remaining].should eql("")
  #   chopped_str[:full_text].should eql(@test_string)
  # end

  # it 'should not chop the string when truncate length greater than the string text' do
  #   truncate_at = "Google is an American multinational corporation specializing in Internet-related services and products. These include search, cloud computing, software, and online advertising technologies."
  #   chopped_str = @test_string.chop_at(truncate_at.length+5)
  #   chopped_str[:truncated].should eql("Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online advertising technologies.")
  #   chopped_str[:remaining].should eql("")
  #   chopped_str[:full_text].should eql(@test_string)
  # end
  
end
