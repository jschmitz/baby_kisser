# BabyKissers

Politicians, aka the baby kissers, data is stored at govtrack this gem
gets the data from govtrack and puts it into an array of hashes.
The url this is built for is: http://www.govtrack.us/data/us/112/people.xml

For example,

     <people session="112">
     	<person id='400003' lastname='Ackerman' firstname='Gary' middlename='L.' birthday='1942-11-19' gender='M' religion='Jewish' pvsid='26970' osid='N00001143' bioguideid='A000022' metavidid='Gary_L._Ackerman' youtubeid='RepAckerman' icpsrid='15000' facebookgraphid='231704375141' name='Rep. Gary Ackerman [D, NY-5]' title='Rep.' state='NY' district='5' >
     		<role type='rep' startdate='2011-01-05' enddate='2012-12-31' party='Democrat' state='NY' district='5' url='http://ackerman.house.gov/' address='2111 Rayburn House Office Building;  20515-3205' current='1' />
     	</person>
     </people>

becomes this hash:

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
    }

You get an array of these hashes for everything at that url (assuming you use the url)

## Installation

Add this line to your application's Gemfile:

    gem 'baby_kissers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baby_kissers

## Usage

require 'baby_kisser'
politicians = BabyKisser.new "http://www.govtrack.us/data/us/112/people.xml"
politicians.all


## TODOS
Add the rest of data at govtrack (in the 'role' part of the xml)
Add scopes

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
