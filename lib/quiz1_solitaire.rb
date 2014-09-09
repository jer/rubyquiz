# Encoding: UTF-8

module Quiz1SolitaireCipher
  # An implementation of the Solitaire Cipher from RubyQuiz #1
  # http://rubyquiz.com/quiz1.html
  class SolitaireCipher
    def format_plaintext(plaintext)
      plaintext.upcase!

      plaintext.gsub!(/[^A-Z]/, '')

      plaintext_arr = plaintext.scan(/.{1,5}/)

      last_word = plaintext_arr[-1]
      plaintext_arr[-1] = last_word.ljust(5, 'X') if last_word.length < 5

      plaintext_arr.join(' ')
    end

    def make_numeric(text)
      text.split('').map do |letter|
        letter.ord - 'A'.ord + 1 if letter =~ /[A-Z]/
      end.compact
    end

    def summing_encrypt(plaintext, key)
      plaintext.zip(key).map do |a, b|
        (a + b) % 26
      end
    end
  end
end
