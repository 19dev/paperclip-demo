class Asset < ActiveRecord::Base
	belongs_to :article

	has_attached_file :image,
		:styles => {
			:thumb =>  '150x150#',
			:medium => '300x300>',
			:large =>  '600x600>'
	}
end
