class Comment < ApplicationRecord
	
  belongs_to :post
  scope :active_comments, lambda {where(:status => "Active")}

end
