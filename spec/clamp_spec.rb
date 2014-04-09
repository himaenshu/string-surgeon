require "#{File.dirname(__FILE__)}/../lib/string_surgeon"

describe 'clamp' do
  before(:each) do
    @test_string = "#Google is an @American <a href='http://www.google.com/multinational'>@multinational</a> <a href='http://www.google.com/corporation'>#corporation</a> specializing in Internet-related <a href='http://www.google.com/services'>#services and #products</a>. #IT #Google @American @MyFriend"
  end

  it 'should fetch all hashtags in the string' do
    @test_string.hashtags.should eql(["#Google", "#corporation", "#services", "#products", "#IT", "#Google"])
  end 

  it 'should fetch unique hashtags in the string' do
    @test_string.uniq_hashtags.should eql(["#Google", "#corporation", "#services", "#products", "#IT"])
  end 

  it 'should fetch all atmentions in the string' do
    @test_string.atmentions.should eql(["@American", "@multinational", "@American", "@MyFriend"])
  end 

  it 'should fetch unique atmentions in the string' do
    @test_string.uniq_atmentions.should eql(["@American", "@multinational", "@MyFriend"])
  end
  
end
