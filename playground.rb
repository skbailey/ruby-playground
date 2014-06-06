module AirTravel

  class AirTravelAuthority
    attr_accessor :purpose

    def initialize
      @purpose = "To define the international laws of travel"
    end
  end

  class Flight

    @@number_of_flights = 0
    attr_accessor :airline, :number, :destination

    def initialize(meta)
      @airline = meta[:airline]
      @number = meta[:number]
      @destination = meta[:destination]
      @@number_of_flights += 1
    end

    class << self
    
     def get_airtravel_authority
      @airtravelAuthority ||= AirTravelAuthority.new
     end

     def number_of_flights
      @@number_of_flights
     end
    end
  end

  class Destination

    attr_accessor :name, :code

    def initialize(meta)
      @name = meta[:name]
      @code = meta[:code]
    end
  end
end

destination = AirTravel::Destination.new(name: "Casablanca, Morrocco", code: "MRO")
flight = AirTravel::Flight.new(airline: "Lufthansa", number: "FT324", destination: destination)
next_flight = AirTravel::Flight.new(airline: "Air Korea", number: "PE224", destination: destination)

puts "Hi Sir, where are you heading today"
puts "Good morning, I'm going to #{flight.destination.name}"
puts "Airline and flight number please."
puts "My airline is #{flight.airline} and my flight number is #{flight.number}"
puts "Reason for authority: #{AirTravel::Flight.get_airtravel_authority.purpose}"
puts "There are currently #{AirTravel::Flight.number_of_flights} flights in the sky"
=begin
Questions
  1. What's the difference between a string and a symbol
  2. Modules seem to be for encapsulation but is there any other reason to use them?
  3. What else would I put in a module besides classes? Functions visible to the entire module?
     Where would I use those in a class?
  4. Explain *args and &block as parameters to a method
=end