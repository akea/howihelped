class Geo
  class << self
    DB = Loc.new('db/GeoLiteCity.dat')

    def lookup(ip)
      DB.city(ip)
    end
  end
end