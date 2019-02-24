class VentureCapitalist

  #accesssors
  attr_accessor :name
  attr_reader :total_worth

  #class variables
  @@all_venturecap =[]
  @@all_tres_commas =[]

  def initialize(name, totalworth)
      @name = name
      @total_worth = totalworth
      @@all_venturecap << self

      if totalworth >= 1000000000
          @@all_tres_commas << self
      end
  end

  def self.all
    @@all_venturecap
  end

  def self.tres_commas_club
    @@all_tres_commas
  end

end

 #  `VentureCapitalist#name`
 #   - returns a **string** that is the venture capitalist's name

 # - `VentureCapitalist#total_worth`
 #   - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)

 # - `VentureCapitalist.all`
 #   - returns an array of all venture capitalists

 # - `VentureCapitalist.tres_commas_club`
 #   - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)
