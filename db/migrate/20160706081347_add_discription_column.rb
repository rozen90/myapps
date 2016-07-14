class AddDiscriptionColumn < ActiveRecord::Migration
  def change
  	add_column :posts, :dating, :date
  end
end
