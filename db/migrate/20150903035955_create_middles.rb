class CreateMiddles < ActiveRecord::Migration
  def change
    create_table :middles do |t|
      t.float :comment_id
      t.float :tag_id
      t.timestamps null: false
    end
  end
end
