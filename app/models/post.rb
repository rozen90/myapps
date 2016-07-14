class Post < ActiveRecord::Base
  belongs_to :user
  has_many :incomes
  has_many :expenses

  def self.to_csv(options ={})
  	CSV.generate(options) do |csv|
  		csv << column_names
  		all.each do |post|
  			csv << post.attributes.values_at(*column_names)
  		end
  	end
  end
end
