class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :user_name
    	t.string :comment
      t.timestamps null: false
    end
  end
end
