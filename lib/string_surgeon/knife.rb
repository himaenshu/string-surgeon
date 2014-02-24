module StringSurgeon
  module Knife

    def slit_at(str, num_chars)
      truncated, remaining, has_link = "", "", false
      
      # scan the string for any presence of links and iterate through it
      str.scan(/<a.*? href=(\"|')(.*?)(\"|').*?>(.*?)<\/a>/i) do
        has_link = true
        href, left, right  = $&, $`, $'
        p href
        p left
        p right

        left_text_length = text_length(left)
        if(left_text_length == num_chars)
          p "num_chars length EQUALS left_text>>>>>>>>>>>>>>#{left_text_length}"
          truncated = left
          remaining = href + right
          break

        elsif(left_text_length > num_chars) # left part is bigger than number of characters
          p "left_text length GREATER than num_chars >>>>>>>>>>>>>>#{left_text_length}"
        
          # remove the extra delta from the left_part and add to remaining
          if left.length == left_text_length
            first_part_len = num_chars
          else  
            delta = left_text_length - num_chars
            first_part_len = left.length - delta
          end
          truncated = left[0..(first_part_len-1)]
          remaining = left[first_part_len..left.length] + href + right
          break
          
        else
          p "left_text length LESS than num_chars >>>>>>>>>>>>>>#{left_text_length}"
          truncated = left + truncate_link(href, (num_chars-left_text_length))
          remaining = right
          
          if(text_length(truncated) >= num_chars)
            p "LESS 1"
            # don't bother if the left is bigger than required after adding link as it is already truncated
            break
          else
            p "LESS 2"
            # if right doesn't have link get the remaining text from second_part - as it will skip the scan
            unless(right.match(/<a.*? href=(\"|')(.*?)(\"|').*?>(.*?)<\/a>/))
              p "LESS 3"
              delta = num_chars - text_length(truncated)
              truncated += right[0..delta]
              remaining = right[delta+1..right.length]
              break
            end
          end

        end
      end

      # string does not have any link
      unless(has_link)
        truncated = str[0..num_chars]
        remaining = str[num_chars+1..str.length]
      end

      if (remaining.size==0)
        truncated_text = truncated
        full_text = truncated
      else
        truncated_text = truncated+"..."
        full_text = truncated+remaining
      end
      p truncated
      p "+++++++++++++++++++++++++++++++++++++"

      [truncated_text, remaining, full_text]
    end

    def text_length(str)
      txt_len = str.length
      if str.match(/<a.*? href=(\"|')(.*?)(\"|').*?>(.*?)<\/a>/i)
        link, left, right  = $&, $`, $'
        #use more efficient regular expression to fetch link label 
        label_match = link.match(/>([^>]+)<\/a>/)[0]
        if label_match
          txt_len = left.length + (label_match.length-5) + text_length(right)
        end
      end
      txt_len  
    end 

    def truncate_link(link, len)
      new_link = link
      if link.match(/>([^>]+)<\/a>/)
        link_left, label_match = $`, $& 
        label = label_match[1..(label_match.length-5)]
        if (label.length > len)
          new_link = (link_left+">"+label[0..(len-1)]+"</a>") 
        end
      end 
      new_link
    end  

  end  
end  