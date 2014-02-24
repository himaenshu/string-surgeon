require "#{File.dirname(__FILE__)}/../lib/string_surgeon"


describe 'string_surgeon' do
  before(:each) do
    #@test_string = "GEMS, a former acronym (Geophysical Monitoring Station) for <a href='http://en.wikipedia.org/wiki/InSight'>InSight</a>, a Mars lander mission."
    @test_string = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online <a href='http://www.google.com/advertising'>advertising</a> technologies."
  end

  # it 'chop before first hyperlink in the string' do
  #   truncate_at = "Google is an American multi".length
  #   chopped_str = @test_string.chop_at(truncate_at)
  #   chopped_str[:truncated].should eql("Google is an American multi...")
  #   chopped_str[:remaining].should eql("national <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online <a href='http://www.google.com/advertising'>advertising</a> technologies.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end 

  it 'chop in the middle of first hyperlink label in the string' do
    truncate_at = "Google is an American multinational corp".length
    chopped_str = @test_string.chop_at(truncate_at)
    chopped_str[:truncated].should eql("Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a>...")
    chopped_str[:remaining].should eql("lizing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online <a href='http://www.google.com/advertising'>advertising</a> technologies.")
    chopped_str[:full_text].should eql(@test_string)
  end 

  # it 'chop in the middle of first hyperlink label in the string' do
  #   truncate_at = "Google is an American multinational corporation".length
  #   chopped_str = @test_string.chop_at(truncate_at)
  #   chopped_str[:truncated].should eql("Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a>...")
  #   #chopped_str[:remaining].should eql(" lander mission.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end 

  # it 'chop before second hyperlink in the string' do
  #   truncate_at = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These incl".length
  #   chopped_str = @test_string.chop_at(truncate_at)
  #   chopped_str[:truncated].should eql("GEMS, a former acronym (Geophysical Monitoring Station) for ...")
  #   #chopped_str[:remaining].should eql("<a href='http://en.wikipedia.org/wiki/InSight'>InSight</a>, a Mars lander mission.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end

  # it 'chop in the middle of second hyperlink href in the string' do
  #   truncate_at = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud comp"
  #   chopped_str = @test_string.chop_at(truncate_at)
  #   chopped_str[:truncated].should eql("GEMS, a former acronym (Geophysical Monitoring Station) for <a href='http://en.wikipedia.org/wiki/InSight'>InSight</a>...")
  #   #chopped_str[:remaining].should eql(", a Mars lander mission.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end

  # it 'chop in the middle of second hyperlink label in the string' do
  #   truncate_at = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing>cloud comp"
  #   chopped_str = @test_string.chop_at(truncate_at)
  #   chopped_str[:truncated].should eql("GEMS, a former acronym (Geophysical Monitoring Stat...")
  #   #chopped_str[:remaining].should eql("ion) for InSight, a Mars lander mission.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end

  # it 'chop before third/last hyperlink in the string' do
  #   truncate_at = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software".length
  #   chopped_str = @test_string.chop_at(truncate_at)
  #   chopped_str[:truncated].should eql("GEMS, a former acronym (Geophysical Monitoring Stat...")
  #   #chopped_str[:remaining].should eql("ion) for InSight, a Mars lander mission.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end

  # it 'chop in the middle of third/last hyperlink href in the string' do
  #   truncate_at = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online <a href='http://www.google.com/adver".length
  #   chopped_str = @test_string.chop_at(truncate_at)
  #   chopped_str[:truncated].should eql("GEMS, a former acronym (Geophysical Monitoring Stat...")
  #   #chopped_str[:remaining].should eql("ion) for InSight, a Mars lander mission.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end

  # it 'chop in the middle of third/last hyperlink label in the string' do
  #   truncate_at = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online <a href='http://www.google.com/advertising'>adver".length
  #   chopped_str = @test_string.chop_at(truncate_at)
  #   chopped_str[:truncated].should eql("GEMS, a former acronym (Geophysical Monitoring Stat...")
  #   #chopped_str[:remaining].should eql("ion) for InSight, a Mars lander mission.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end

  # it 'chop after third/last hyperlink in the string' do
  #   truncate_at = "Google is an American multinational <a href='http://www.google.com/corporation'>corporation</a> specializing in Internet-related services and products. These include search, <a href='http://www.google.co.in/cloud computing'>cloud computing</a>, software, and online <a href='http://www.google.com/advertising'>advertising</a> tech".length
  #   chopped_str = @test_string.chop_at(truncate_at)
  #   chopped_str[:truncated].should eql("GEMS, a former acronym (Geophysical Monitoring Stat...")
  #   #chopped_str[:remaining].should eql("ion) for InSight, a Mars lander mission.")
  #   chopped_str[:full_text].should eql(@test_string)
  # end
  
end
