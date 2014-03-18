string-surgeon
==============

Ruby gem to gracefully cut open a string having hyperlinks, #hashtags and @mentions


Features:

1. Truncate the string for given count of characters, where the given count excludes the characters of any link html tag in the string.

2. Fetch the hashtags (like #topic) in a string

3. Fetch the atmentions (like @name) in a string


Functions:

1. truncate(n) returns the first n characters of the string, where n excludes the characters of any link html tag in the string.
	Example:
	str = "The code can be downloaded from <a href='https://github.com/himaenshu/string-surgeon'>Github Repository</a>."
	str.truncate(45) => "The code can be downloaded from <a href='https://github.com/himaenshu/string-surgeon'>Github Reposi...<a/>"

2. remaining(n) returns the n+1 onwards characters of the string, where n excludes the count of characters in link html tag.
	Example: 
	str = "The code can be downloaded from <a href='https://github.com/himaenshu/string-surgeon'>Github Repository</a>."
	str.remaining(20) => "loaded from <a href='https://github.com/himaenshu/string-surgeon'>Github Repository</a>."

3. chop_at(n) returns truncate(n), remaining(n) and the string itself as hash items.

4. hashtags() returns the array of all the #hashtags (like #microblog) in the string.

5. uniq_hashtags() returns the array of distinct #hashtags in the string.
 
6. atmentions() returns the array of all the @mentions (like @Himanshu) in the string.

7. uniq_atmentions() returns the array of distinct @mentions in the string.

