module StringSurgeon
  module Clamp

      HASHTAG_REG_EX = /\B#(\w*[A-Za-z_]+\w*)/
      ATMENTION_REG_EX = /\B@(\w*[A-Za-z_'-]+\w*)/

      def all_hashtags(str)
        tags = []
        sanitize_links(str).scan(HASHTAG_REG_EX) do
          tags << $&
        end
        tags
      end

      def unique_hashtags(str)
        tags = []
        all_tags = []
        return tags if(str.empty?)
        sanitize_links(str).scan(HASHTAG_REG_EX) do
          tags << $& unless all_tags.include?($&.downcase)
          all_tags << $&.downcase
        end
        tags
      end

      def all_atmentions(str)
        names = []
        sanitize_links(str).scan(ATMENTION_REG_EX) do
          names << $&
        end
        names
      end

      def unique_atmentions(str)
        names = []
        all_names = []
        return names if(str.empty?)
        sanitize_links(str).scan(ATMENTION_REG_EX) do
          names << $& unless all_names.include?($&.downcase)
          all_names << $&.downcase
        end
        names
      end

      def sanitize_links str
        return '' unless str
        (local_str = String.new(str)).split.grep(/http[s]?:\/\/\w/).each { |l| local_str.sub!(l, '') }
        local_str
      end

  end  
end