class AddStoryIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :story_id, :integer
  end
end
