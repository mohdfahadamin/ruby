def caesar_cipher(text, shift)
  
  text.chars.map do |char|
    if char >= 'a' && char <= 'z'
      (((char.ord - 'a'.ord + shift) % 26) + 'a'.ord).chr
    elsif char >= 'A' && char <= 'Z'
      (((char.ord - 'A'.ord + shift) % 26) + 'A'.ord).chr
    else
      char
    end
  end.join
end
print "enter the sentence: "
text1 = gets.chomp 
print "enter the number to shift: "
shift1 = gets.chomp.to_i 
puts caesar_cipher(text1,shift1)