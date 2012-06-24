// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function redirect_to(url)
{
	window.location.href=url
}
function WidgetPic(srcid){
		minusPic=$(srcid+'_img_0');
		plusPic=$(srcid+'_img_1');
		contentArea=$('content_'+srcid).ancestors()[0];
		if(minusPic.visible()){
			contentArea.fade();
		}else{
			contentArea.blindDown();
		}
		minusPic.toggle();
		plusPic.toggle();
}