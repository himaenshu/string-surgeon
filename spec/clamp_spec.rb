require "#{File.dirname(__FILE__)}/../lib/string_surgeon"

describe 'clamp' do
  before(:each) do
    @test_string = "#Google is an @American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. #IT #Google @American @MyFriend"
  end

  it 'should fetch all hashtags in the string' do
    @test_string.hashtags.should eql(["#Google", "#IT", "#Google"])
  end 

  it 'should fetch unique hashtags in the string' do
    @test_string.uniq_hashtags.should eql(["#Google", "#IT"])
  end 

  it 'should fetch all atmentions in the string' do
    @test_string.atmentions.should eql(["@American", "@American", "@MyFriend"])
  end 

  it 'should fetch unique atmentions in the string' do
    @test_string.uniq_atmentions.should eql(["@American", "@MyFriend"])
  end
  
end
