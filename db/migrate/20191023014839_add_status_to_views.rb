class AddStatusToViews < ActiveRecord::Migration[6.0]
  def change
    add_column :views, :status, :string, default: "Not Watching"
  end
end
