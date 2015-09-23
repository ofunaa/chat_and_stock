class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :page_name
      t.float :comments
      t.boolean :takahiro_flag
      t.timestamps null: false
    end
  end
end
