# Encoding: UTF-8

require 'spec_helper'
require 'quiz1_solitaire'

describe Quiz1SolitaireCipher::SolitaireCipher, '#format_plaintext' do
  let(:cipher) { Quiz1SolitaireCipher::SolitaireCipher.new }

  context '#format_plaintext' do
    it 'capitalizes all letters' do
      expect(cipher.format_plaintext('AbCdE')).to eq 'ABCDE'
    end

    it 'strips out non-alphabet characters' do
      expect(cipher.format_plaintext('1abc23D4e')).to eq 'ABCDE'
    end

    it 'splits the string into 5-character groups' do
      original = 'Code in Ruby, live longer!'
      parsed = 'CODEI NRUBY LIVEL ONGER'
      expect(cipher.format_plaintext(original)).to eq parsed
    end

    it 'pads the last character group with X' do
      original = 'Code in Ruby, live long!'
      parsed = 'CODEI NRUBY LIVEL ONGXX'
      expect(cipher.format_plaintext(original)).to eq parsed
      expect(cipher.format_plaintext('a')).to eq 'AXXXX'
    end
  end

  context '#make_numeric' do
    it 'converts a string into its numeric representation' do
      original = 'CODEI NRUBY LIVEL ONGER'
      parsed = [3, 15, 4, 5, 9, 14, 18, 21, 2, 25,
                12, 9, 22, 5, 12, 15, 14, 7, 5, 18]
      expect(cipher.make_numeric(original)).to eq parsed
    end
  end

  context '#summing_encrypt' do
    it 'sums numeric plaintext with a key to make cyphertext' do
      plaintext = [3, 15, 4, 5, 9, 14, 18, 21, 2, 25,
                   12, 9, 22, 5, 12, 15, 14, 7, 5, 18]
      key = [4, 23, 10, 24, 8, 25, 18, 6, 4, 7,
             20, 13, 19, 8, 16, 21, 21, 18, 24, 10]
      result = [7, 12, 14, 3, 17, 13, 10, 1, 6, 6,
                6, 22, 15, 13, 2, 10, 9, 25, 3, 2]
      expect(cipher.summing_encrypt(plaintext, key)).to eq result
    end
  end
end
