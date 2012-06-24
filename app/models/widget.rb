class Widget < ActiveRecord::Base
	has_many :widgetsettings
	has_many :view_widgets
end
