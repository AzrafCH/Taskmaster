class Createtasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :content
      t.integer :user_id
      t.integer :category_id
    end
  end
end
