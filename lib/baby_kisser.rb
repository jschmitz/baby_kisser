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
    p.merge!(all_xml_attribute_values(person.attributes))
    p.merge!(all_xml_attribute_values(person.children[0].attributes))
  end

  def all_xml_attribute_values data
    p = {}
    data.keys.each do |key|
      p[key] = data[key].value
    end
    p
  end

end
