# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

Show.delete_all
# Seasons.delete_all
# Episodes.delete_all

40.times do |i|
    open("https://api.themoviedb.org/3/tv/popular?api_key=98098f15d568b7706df571a852f1ec4b&language=en-US&page=#{i+1}") do |publications|
        data = []
        publications.read.each_line do |publication|
            @item = JSON.parse(publication["results"])
            object = {
                "id": @item["id"],
                "name": @item["name"],
                "network_name": @item["networks"][0]["name"],
                "num_of_episodes": @item["number_of_episodes"],
                "num_of_seasons": @item["number_of_seasons"],
                "vote_avg": @item["vote_average"],
                "status": @item["status"],

            }
            data << object
        end
        Show.create!(data)
    end
end

