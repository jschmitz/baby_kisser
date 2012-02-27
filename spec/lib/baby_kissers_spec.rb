require 'spec_helper'

describe BabyKisser do
  let(:all_politician_xml) { 'spec/support/people.xml' }
  let(:ackerman_xml)       { 'spec/support/ackerman.xml' }
  let(:govtrack_xml)       { "http://www.govtrack.us/data/us/112/people.xml" }
  let(:ackerman)           {
                             {
                                   "id"              => "400003",
                                   "lastname"        => "Ackerman",
                                   "firstname"       => "Gary",
                                   "middlename"      => "L.",
                                   "birthday"        => "1942-11-19",
                                   "gender"          => "M",
                                   "religion"        => "Jewish",
                                   "pvsid"           => "26970",
                                   "osid"            => "N00001143",
                                   "bioguideid"      => "A000022",
                                   "metavidid"       => "Gary_L._Ackerman",
                                   "youtubeid"       => "RepAckerman",
                                   "icpsrid"         => "15000",
                                   "facebookgraphid" => "231704375141",
                                   "name"            => "Rep. Gary Ackerman [D, NY-5]",
                                   "title"           => "Rep.",
                                   "state"           => "NY",
                                   "district"        => "5",
                                   #"role"           => "rep",
                                   #"startdate"      => "2011-01-05",
                                   #"enddate"        => "2012-12-31",
                                   #"party"          => "Democrat",
                                   #"state"          => "NY",
                                   #"district"       => "5",
                                   #"url"            => "http://ackerman.house.gov/",
                                   #"address"        => "2111 Rayburn House Office Building; 20515-3205",
                                   #"current"        => "1",
                             }
                           }

  context "Ackerman tests, single person xml" do
    before { @ph = BabyKisser.new(ackerman_xml) }

    it 'initializes with the source of politician data' do
      @ph.src.should == 'spec/support/ackerman.xml'
    end

    it 'loads xml data' do 
      @ph.document.should be_a_kind_of(Nokogiri::HTML::Document)
    end

    it 'has Gary Ackerman loaded' do
      @ph.all[0].should == ackerman
    end
  end

  context "All local tests, copy of xml file from govtrack" do
    before { @ph = BabyKisser.new(all_politician_xml) }

    it 'has 546 some entries saved for the all politician xml' do
      @ph.all.size.should == 546
    end
  end

  context "gets politications from the internet" do
    before { @ph = BabyKisser.new(govtrack_xml) }

    it 'loads xml data from the internet' do
      @ph.all.size.should == 546
    end
  end

end
