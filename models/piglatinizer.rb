require "pry"
class PigLatinizer
  attr_reader :text


  def piglatinize(input_text)
    arr = input_text.split(" ")

    if arr.length  == 1
      piglatinize_word(input_text)
    else
      piglatinize_sentence(input_text)
    end
  end


  def consonant?(text)
    !text.match(/[aeiouAEIOU]/)
  end


  def piglatinize_word(word)
    if !consonant?(word[0])
      word = word + "w"
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    else
      word = word.slice(1..-1) + word.slice(0)
    end
    word + "ay"
  end

  def piglatinize_sentence(sentence)
    arr = sentence.split(" ")
    arr.map do |word|
      piglatinize_word(word)
    end.join(" ")

  end


end # end of class
