class Quote < ActiveRecord::Base
  validates :author, :content, :presence => true

end
