require "baby_kisser/version"
require 'nokogiri'
require 'open-uri'

class BabyKisser

  attr_accessor :src, :document, :politicians

  def initialize src
    self.src = src
    self.document = Nokogiri::HTML(open(src))
  end

  def all
    self.politicians ||= all_politicians
  end

  def twitter_users
    all.select { |bk| bk if bk.has_key? "twitterid" } 
  end

  private
  def all_politicians
    all = []
    document.xpath('//person').each do |person|
      p = make_politician person
      all << p
    end
    all
  end

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
