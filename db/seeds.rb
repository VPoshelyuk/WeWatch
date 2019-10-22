# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

# Show.delete_all
# Season.delete_all
# Episode.delete_all
# 40.times do |i|
#     open("https://api.themoviedb.org/3/tv/popular?api_key=98098f15d568b7706df571a852f1ec4b&language=en-US&page=#{i+1}") do |publications|
#         data = []
#         publications.read.each_line do |publication|
#             @item = JSON.parse(publication)
#             @item["results"].each do |result|
#                 object = {
#                     "id": result["id"],
#                     "name": result["name"],
#                     "vote_avg": result["vote_average"],
#                     "overview": result["overview"]
#                 }
#                 data << object
#             end
#         end
#         Show.create!(data)
#     end
# end

Show.all.each do |show|
    open("https://api.themoviedb.org/3/tv/#{show.id}?api_key=98098f15d568b7706df571a852f1ec4b&language=en-US") do |publications|
        publications.read.each_line do |publication|
            @item = JSON.parse(publication)
            show.update(num_of_seasons: @item["number_of_seasons"])
        end
    end
end

# Show.all.limit(1).each do |show|
#     iter_times = show.num_of_seasons
#     iter_times.times do |season|
#         open("https://api.themoviedb.org/3/tv/#{show.id}/season/#{season}?api_key=98098f15d568b7706df571a852f1ec4b&language=en-US") do |publications|
#             data = []
#             publications.read.each_line do |publication|
#                 @item = JSON.parse(publication)
#                 object = {
#                     "id": @item["id"],
#                     "show_id": show.id,
#                     "name": @item["name"],
#                     "episode_count": @item["episodes"].count,
#                     "poster_path": @item["poster_path"],
#                     "overview": @item["overview"]

#                 }
#                 data << object
#             end
#             Season.create!(data)
#         end
#     end
# end

# Season.all.limit(1).each do |season|
#     season.num_of_episodes.times do |episode|
#         open("https://api.themoviedb.org/3/tv/#{season.show_id}/season/#{season.id}/episode/#{episode}?api_key=98098f15d568b7706df571a852f1ec4b&language=en-US") do |publications|
#             data = []
#             publications.read.each_line do |publication|
#                 @item = JSON.parse(publication)
#                 object = {
#                     "id": @item["id"],
#                     "show_id": show.id,
#                     "name": @item["name"],
#                     "episode_count": @item["episodes"].count,
#                     "poster_path": @item["poster_path"],
#                     "overview": @item["overview"]

#                 }
#                 data << object
#             end
#             Episode.create!(data)
#         end
#     end
# end

