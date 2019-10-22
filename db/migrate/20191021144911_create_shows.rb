class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :overview
      t.string :network_name
      t.integer :num_of_episodes
      t.integer :num_of_seasons
      t.integer :vote_avg
      t.string :status

      t.timestamps
    end
  end
end
