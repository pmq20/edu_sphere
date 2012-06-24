# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def widgets_for(_identification,params={})
		params[:react]==false if not logged_in?
		ret='<div id="page">'
		#build js_init
		js_init='var portal;function init() {portal = new Xilinus.Portal("#page div"'
		unless params[:react]==false
			js_init+=', {url:"'+widget_island_url(:identification=>_identification)+'"}'
		end
		js_init+=');'
		#init_build over
		viewpages=Viewpage.find_all_by_identification(_identification)
		us_to_find=0
		if logged_in?
			for viewpage in viewpages
				if ViewWidget.find_all_by_user_id_and_viewpage_id(current_user.id,viewpage.id).size>0
					us_to_find=current_user.id
				end
			end
		end
		for viewpage in viewpages			
			target_view_widgets=ViewWidget.find_all_by_user_id_and_viewpage_id(us_to_find,viewpage.id,:order=>'number')
			ret+="<div id=\"widget_col_#{viewpage.number}\" style=\"width:#{viewpage.width}%;\"></div>"
			for view_widget in target_view_widgets
				w=view_widget.widget
				#Determine where to find settings
				if logged_in? and w.widgetsettings.find_all_by_user_id(current_user.id).size>0
					user_id_in_settings=current_user.id
				else
					user_id_in_settings=0
				end
				w_id='widget_'+w.dom_id
				js_init+='portal.add(new Xilinus.Widget("widget","'+w_id+'").setTitle("'+
									escape_javascript(render(:inline=>w.widgetsettings.find_by_name_and_user_id('title',user_id_in_settings).value))+'").setContent("'+
									escape_javascript('<div>'+render(:inline=>w.widgetsettings.find_by_name_and_user_id('body',user_id_in_settings).value))+'</div>"), '+viewpage.number.to_s+');'
				control_to_insert=escape_javascript('<span class="control">'+
							image_tag('button_max.png')+
							image_tag('button_minus.png',:id=>"#{w_id}_img_0",:onclick=>"WidgetPic(\"#{w_id}\")")+
							image_tag('button_plus.png',:id=>"#{w_id}_img_1",:style=>'display:none',:onclick=>"WidgetPic(\"#{w_id}\")")+
							'<nobr class="cursor_qstmark">'+image_tag('button_qst.png')+'</nobr>')
				if logged_in?
					control_to_insert+=escape_javascript(image_tag('button_pencil.png')+image_tag('button_wrench.png'))
				end
				control_to_insert+='</span>'
				js_init+="$('#{w_id}').insert('#{control_to_insert}');"
				#Extra Settings
				setting_widget_css=w.widgetsettings.find_by_name_and_user_id('widget_css',user_id_in_settings)
				js_init+="$('#{w_id}').style.cssText+=('#{escape_javascript(setting_widget_css.value)}');" unless setting_widget_css.nil?
			end
		end
		js_init+='}'
		ret+='</div>'
		ret+='<script type="text/javascript">'+js_init+'Event.observe(window, "load", init);</script>';
		ret
	end
	def config(request)
		Configdata.find_by_name(request).value
	end
end
