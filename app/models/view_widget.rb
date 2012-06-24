class ViewWidget < ActiveRecord::Base
	belongs_to :viewpage
	belongs_to :widget
end
