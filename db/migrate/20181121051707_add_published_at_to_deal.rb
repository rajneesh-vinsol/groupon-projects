class AddPublishedAtToDeal < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :published_at, :datetime
  end
end
