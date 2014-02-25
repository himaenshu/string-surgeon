require "#{File.dirname(__FILE__)}/string_surgeon/knife"
require "#{File.dirname(__FILE__)}/string_surgeon/clamp"

class String

  include StringSurgeon::Knife
  include StringSurgeon::Clamp

  #Get the first count charaters of the string excluding the link html, remaining part of the string and full string
  def chop_at(count)
    result = slit_at(self, count)
    {:truncated => result[0], :remaining => result[1], :full_text => self}
  end

  #Get the first count charaters of the string excluding the link html
  def truncate(count)
    slit_at(self, count)[0]
  end  

  #Get the remaining part of truncated string
  def remaining(count)
    slit_at(self, count)[1]
  end

  #Find all hashtags (like #topic) in the string
  def hashtags
    all_hashtags(self)
  end

  #Find unique hashtags (like #topic) in the string
  def uniq_hashtags
    unique_hashtags(self)
  end

  #Find all atmentions (like @name) in the string
  def atmentions
    all_atmentions(self)
  end

  #Find unique atmentions (like @name) in the string
  def uniq_atmentions
    unique_atmentions(self)
  end

end
