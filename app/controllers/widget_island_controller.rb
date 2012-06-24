class WidgetIslandController < ApplicationController
	def update
		viewpages=Viewpage.find_all_by_identification(params[:identification],:order=>'number')
		numbase=0
		need_customize=true
		for v in viewpages do
			 need_customize=false if v.view_widgets.find_all_by_user_id(current_user.id).size>0
		end
		customize(viewpages) if need_customize
		for v in viewpages do
			name='widget_col_'+v.number.to_s
			next if params[name].nil?
			0.upto(params[name].size-1) do |i|
				w_dom_id=params[name][i].split('_')[1]
				w=Widget.find_by_dom_id(w_dom_id)
				wn=ViewWidget.find_by_widget_id_and_user_id(w.id,current_user.id)
				wn.viewpage_id=v.id
				wn.number=numbase
				numbase+=1
				wn.save
			end
		end
		render :text=>'Fine'
	end
	
	private
	def customize(vs)
		for v in vs
			wef=ViewWidget.find_all_by_viewpage_id_and_user_id(v.id,0)
			for w in wef
				w_c=w.clone
				w_c.user_id=current_user.id
				w_c.save
			end
		end
	end
end
