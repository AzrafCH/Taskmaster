class CreateCatergories < ActiveRecord::Migration
  def change
    create_table :catergories do |t|
      t.string :name
    end
  end
end
