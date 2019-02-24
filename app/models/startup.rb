class Startup

  #accesssors
  attr_accessor :name
  attr_reader :founder, :domain

  #class variables
  @@all_startups = []
  @@domain = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all_startups << self
    @@domain << domain
  end

  #instance methods
  def pivot(domain, name)
    @domain = domain
    @name = name
  end


  # - `Startup#sign_contract`
  #   - given a **venture capitalist object**, type of investment (as a string), and the amount invested (as a float),
  # creates a new funding round and associates it with that startup and venture capitalist.
  def sign_contract(venture_capitalist, investment_type, amount_invested)
     FundingRound.new(self, venture_capitalist, investment_type, amount_invested)
  end

  # - `Startup#total_funds`
  #   - Returns the total sum of investments that the startup has gotten
  def total_funds

      totalfunds = 0

      FundingRound.all.each { |fundinground| fundinground.startup == self
          #binding.pry
          totalfunds += fundinground.amount
      }

      return totalfunds
  end

  # - `Startup#investors`
  #   - Returns a **unique** array of all the venture capitalists that have invested in this company
 def investors

    vc = []
    FundingRound.all.map { |fundinground| fundinground.startup == self
        vc <<  fundinground.venture_capitalist
    }
    # binding.pry
    return vc.uniq

 end

  # - `Startup#big_investors`
  #   - Returns a **unique** array of all the venture capitalists that have invested in this company and are in the Trés Commas club
  def big_investors
      allinvestors = investors()
      allinvestors.select {|vc| VentureCapitalist.tres_commas_club.include?(vc)}
  end


  #Class methods
  def self.all
      @@all_startups
  end

  def self.find_by_founder(foundername)
      @@all_startups.select { |startup| startup.founder == foundername }
  end

  def self.domains
    @@domain
  end

end

  #
  # - `Startup#sign_contract`
  #   - given a **venture capitalist object**, type of investment (as a string),
  #   and the amount invested (as a float), creates a new funding round and associates
  #   it with that startup and venture capitalist.


  # - `Startup#name`
  #   - returns a **string** that is the startup's name
  # - `Startup#founder`
  #   - returns a **string** that is the founder's name
  #   - Once a startup is created, the founder cannot be changed.

  # - `Startup#domain`
  #   - returns a **string** that is the startup's domain

  #   - Once a startup is created, the domain cannot be changed.
  # - `Startup#pivot`
  #   - given a string of a **domain** and a string of a **name**, change the domain and name of the startup\

  # - `Startup.all`
  #   - should return **all** of the startup instances

  # - `Startup.find_by_founder`
  #   - given a string of a **founder's name**, returns the **first startup** whose founder's name matches
  # - `Startup.domains`
  #   - should return an **array** of all of the different startup domains
