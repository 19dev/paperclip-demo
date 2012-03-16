class Asset < ActiveRecord::Base
	belongs_to :form

	has_attached_file :image,
		:style => {
			:thumb =>  '150x150#',
			:medium => '300x300>',
			:large =>  '600x600>'
	}
end
