require "baby_kisser/version"
require 'nokogiri'
require 'open-uri'

class BabyKisser

  attr_accessor :src, :document

  def initialize src
    self.src = src
    self.document = Nokogiri::HTML(open(src))
  end

  def all
    politicians = []
    document.xpath('//person').each do |person|
      politician = make_politician person
      politicians << politician
    end

    politicians
  end

  private
  def make_politician person
    p = {} 
    person.attributes.keys.each do |key|
      p[key] = person.attributes[key].value
    end
    p 
  end

end
