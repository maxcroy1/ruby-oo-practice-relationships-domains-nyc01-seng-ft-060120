class Guest

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def trips
        Trip.all.select{|trip| trip.guest == self}
    end

    def listings
        self.trips.map{|trip| trip.listing}
    end

    def trip_count
        self.trips.count
    end

    def self.all
        @@all
    end

    def self.pro_traveler
        @@all.select{|guest| guest.trip_count > 1}
    end

    def self.find_all_by_name(name)
        @@all.select{|guest| guest.name == name}
    end

end