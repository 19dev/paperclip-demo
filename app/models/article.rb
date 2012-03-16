class Article < ActiveRecord::Base
	validates :name, :presence => true
	validates :content, :presence => true
	validates :name, :uniqueness => true

	has_many :assets, :dependent => :destroy
	accepts_nested_attributes_for :assets, :allow_destroy => true
end
