def substrings(word, dictionary)
  word = word.downcase
  result = Hash.new(0)

  dictionary.each do |sub|
    sub = sub.downcase
    count = word.scan(sub).length
    result[sub] += count if count > 0
  end

  result
end
dictionary = ["below","down","go","going","horn","how","howdy",
              "it","i","low","own","part","partner","sit"]

p substrings("Howdy partner, sit down! How's it going?", dictionary)
