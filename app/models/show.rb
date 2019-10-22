class Show < ApplicationRecord
    has_many :views
    has_many :users, through: :views
    has_many :seasons
    has_many :ratings
end
