class Show < ApplicationRecord
    has_many :views
    has_many :users, through: :views
    has_many :seasons
    has_many :ratings

    def self.search_shows(query)
        
        Show.where("lower(name) LIKE ?", "%#{query.downcase}%")
        
    end 

    def self.top_rated
        Show.all.sort_by{|show| show.vote_avg}.limit(10)
    end

end
