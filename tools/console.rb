require_relative '../config/environment.rb'


def reload
  load 'config/environment.rb'
end

s1 = Startup.new("NewUber","Dom Peters", "Car Rides" )
s2 = Startup.new("Dance Alone","Jimmy Cliff", "Song Management" )

v1 = VentureCapitalist.new("ZTT", 5000000)
v2 = VentureCapitalist.new("Rich Cap", 10000000000)
v3 = VentureCapitalist.new("TechMoney", 6000000)

r1 = FundingRound.new(s1, v1, Fundingtype::PRESEED,10000)
r2 = FundingRound.new(s1, v1, Fundingtype::PRESEED,20000)
r3 = FundingRound.new(s1, v2, Fundingtype::SEED, 1000000)

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
