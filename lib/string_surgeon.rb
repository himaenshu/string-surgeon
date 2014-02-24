require "#{File.dirname(__FILE__)}/string_surgeon/knife"

class String

  include StringSurgeon::Knife

  def chop_at(chars_count)
    result = slit_at(self, chars_count)
    {:truncated => result[0], :remaining => result[1], :full_text => self}
  end

  def truncate(chars_count)
    slit_at(self, chars_count)[0]
  end  

  def remaining(chars_count)
    slit_at(self, chars_count)[1]
  end

end
