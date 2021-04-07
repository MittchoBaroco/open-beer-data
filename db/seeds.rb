require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

swiss_breweries = CSV.read('datasets/private/bov_breweries.csv', headers: true)

swiss_breweries.each do |brewery|

    brewery_record = Brewery.find_by(registery_number: brewery['Registry number']) || Brewery.new

    postal_code = brewery["City"].to_i
    city = brewery["City"].split(/(?<=\d)(?=[A-Za-z])/).last

    attrs = {
        name: brewery["Name"],
        city: brewery["City"],
        state: brewery["Canton"],
        creation_year: brewery["Established"],
        registery_number: brewery["Registry number"],
        country_code: "CH",
        active: brewery["Status"]
    }

    puts "Create brewery #{attrs[:name]}" unless brewery_record.persisted?
    puts "Update brewery #{attrs[:name]}" if brewery_record.persisted?

    brewery_record.update attrs
end