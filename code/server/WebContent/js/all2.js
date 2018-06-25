msc.goTop.init();
msc.user.init();
$("img.imgLoad").imgLoad();
//搜索
$("#search").click(function(){var q=$("#q").val().replace(/\s+/g,"").replace("　","");window.location.href='//home.meishichina.com/search/'+(q==""?'':q+'/')});$("#q").keydown(function(e){if(e.keyCode==13)$("#search").click()});
var supe_uid = '';
//异步获取数据
var id = $(".J_fav").attr("dataid");
if(id){
$.get(msc.tools.getAjaxUrl({
		ac: "user",
		op: "getmofangloadinfo"
	}),{'id':id},function(d){
  

supe_uid=d.supe_uid;
$(".J_fav span").text(d.collnum).after('人');


 if(d.isfav>0)
$(".J_fav").addClass('on').attr('title','已收藏');

},"json");
}
 
//魔方收藏

$(".J_fav").click(function(){
var mfid=$(this).attr("dataid");

if(supe_uid==''||supe_uid==0){
	msc.user.login();
	 return false;
}
else if($(this).hasClass("on")){
msc.ui.dialog.error('已经收藏过这个专题',3000);	
	 return false;
}
 else{


$.get(msc.tools.getAjaxUrl({
		ac: "mofang",
		op: "add_mofang_fav"
	}), {
		mfid: mfid
	},
	function(d) {
		if (d.error == 0) {
$(".J_fav").addClass("on");
$(".J_fav span").html(parseInt($(".J_fav span").html()) + 1);
msc.ui.dialog.success('收藏成功',3000);	 
}else if (d.error == -1) {
msc.ui.dialog.error(d.data,3000);	 
}else if (d.error == 10001) {
msc.user.login();
}else{
msc.ui.dialog.error("发生异常，请重试");
		}
	},
	"json");
 

}
});

 

//魔方加载菜谱
$("#mof_recipe_a a").click(function(){
if($(this).hasClass('on')||$(this).hasClass('on2'))
return false;

else{
var kid=$(this).attr("kid");
var tid=$(this).attr("tid")?$(this).attr("tid"):0;
var pageid=$(this).attr("page-id");


$(this).addClass("on");

if(!pageid)
	pageid=$("#mof_recipe li").length;


$.get(msc.tools.getAjaxUrl({
		ac: "mofang",
		op: "get_mofang_recipelist"
	}), {
		kid:kid,
		tid:tid,
		pageindex:pageid

	},
	function(d) {
		var i,html='';
		if (d.error == 0) {
for(i=0;i<d.data.length;i++)

html+='<li class="feed"><a title="'+d.data[i]["subject"]+'" href="//home.meishichina.com/recipe-'+d.data[i]["id"]+'.html" target="_blank"><i><img class="imgLoad" src="//static.meishichina.com/v6/img/blank.gif"  data-src="'+d.data[i]["fcover"]+'"></i><p>'+d.data[i]["title"]+'</p></a><a title="'+d.data[i]["username"]+'" href="//home.meishichina.com/space-'+d.data[i]["uid"]+'.html" target="_blank" class="u">'+d.data[i]["username"]+'</a></li>';

$("#mof_recipe ul").append(html);
$("#mof_recipe ul li.feed").fadeIn();
$("#mof_recipe ul li.feed img.imgLoad").imgLoad();
$("#mof_recipe_a a").attr("page-id",parseInt(pageid)+9);
$("#mof_recipe_a a").removeClass("on");
}else if (d.error == -1) {
$("#mof_recipe_a a").html("没有了~").removeClass("on").addClass("on2");
}
else{
msc.ui.dialog.error("发生异常，请重试");
$("#mof_recipe_a a").removeClass("on");
		}
	},
	"json");



}
});

//百度分享
window._bd_share_config = {
	"common": {
		"bdSnsKey": {
			"tsina": "3258795188",
			"tqq": "208157"
		},
		"bdUrl": "//www.meishichina.com/mofang/"+$("#mof_domain").val()+"/",
		"bdText": "%23"+$("#mof_h1").html()+"%23  "+$("#mof_desc").html(),
		"bdDesc":$("#mof_desc").html(),
		"bdMiniList": false,
		"bdPic": $("#mof_fcover").val(),
		"bdStyle": "0",
		"bdSize": "16",
		'bdSearchPic':1,
		"bdWbuid": "1642625033"
	},
	"share": {}
};
with(document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = '//static.meishichina.com/v6/js/lib/api/js/share.js?v=89860593.js?cdnversion=' + ~ ( - new Date() / 36e5)];
 
 $(".shar a").click(function(){
var id=$(this).attr('data');
document.getElementById(id).click();
});