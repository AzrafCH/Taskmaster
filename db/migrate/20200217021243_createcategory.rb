class Createcategory < ActiveRecord::Migration
  def change
    create_table :category do |t|
      t.string :name
    end
  end
end
