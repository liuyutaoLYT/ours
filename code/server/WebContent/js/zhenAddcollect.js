var supe_uid = '';
//异步获取数据
var category_id = $("#zhen_id").val();


//加入菜单
$("#c_add").click(function() {

	var content = '';
	var content_xm='';
	$.get(msc.tools.getAjaxUrl({
		ac: "collect",
		op: "get_curuser_collect_list"
	}), {
		type: 'zhen'
	},
	function(d) {
		if (d.error == 0) {

			if(d.data2!=0)
				content_xm='<div class="line" id="find_collect_div">菜单名称：&nbsp;<input type="text" id="find_collect"><div id="find_collectlist"><ul>'+ d.data2+'</ul></div></div>';

			content = '<div id="addtocollect"><div class="line">选择菜单：&nbsp;<select id="mycollect_list" data-width="120"><option value="">请选择</option>' + d.data + '</select><a href="//member.meishichina.com/center/collect-add/" >创建新菜单</a></div>'+content_xm+'<div class="line">设置排序：&nbsp;<select id="mycollect_order" data-width="120"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option></select><span class="gay">1-9,数字越大越靠前</span></div><div class="line">　　评论：&nbsp;<textarea class="" id="mycollect_info">说说你的看法</textarea></div></div>';
		
		
		msc.ui.dialog({
		content: [content],
		lock: true,
		width: '400px',
		height: '240px',
		title: "加入到菜单",
		button: [{
			value: "确定",
			highlight: !0,
			callback: function() {
				var self = this;
				var collectid=$("#mycollect_list").val(),mid=$("#zhen_id").val(),idtype='zhen',unote=$("#mycollect_info").val(),weight=$("#mycollect_order").val();
				if(collectid==""){
				msc.ui.dialog.error("请选择您要加入的菜单");
				return false;
				}
				if(weight=='')
					weight=1;
				if (!/color_5b/.test($("#mycollect_info").attr('class')))
					unote='';

				$.get(msc.tools.getAjaxUrl({
		ac: "collect",
		op: "add_collect"
	}), {
		collectid:collectid,mid:mid,idtype:idtype,unote:unote,weight:weight
	},function(d) {
		if(d.error==0){
			msc.ui.dialog.loading();
				setTimeout(function() {
					msc.ui.dialog.loading.close();
					self && self.close();
					msc.ui.dialog.success("添加成功",3000);
				},
				1000)
			

		}else if(d.error==-1){
			msc.ui.dialog.loading();
				setTimeout(function() {
					msc.ui.dialog.loading.close();
					self && self.close();
					msc.ui.dialog.error("该商品已经存在于这个菜单中",3000);
				},
				1000)

		}else{
			msc.ui.dialog.error("出现异常，请重试");
		}
		
		},"json");


				 return false;
			}
		}],
		cancel: function() {
			return true;
		},
		initialize: function() {
			msc.ui.select({
				id: "#mycollect_list",
				width: function() {
					if ($("#mycollect_list").width() < 80)
					 return 80;
					else
					 return $("#mycollect_list").width() > 218 ? 218: $("#mycollect_list").width();
				},
				defaultValue: true
			});
			msc.ui.select({
				id: "#mycollect_order",
				width: 80,
				defaultValue: true
			});
			
		}
	});
		
	
		
		}else{
msc.ui.dialog.error("发生异常，请重试");
		}
	},
	"json");


	
});

//小美加入菜单 匹配
$("body").on("keyup paste","#find_collect",function(){
var word;
if($(this).val()!=' '&&$(this).val()!=''){
word=$(this).val();
$("#find_collectlist").show();
$("#find_collectlist li").each(function(){
if($(this).html().indexOf(word) >= 0)
$(this).show();
else
$(this).hide();
});
}else{
$("#find_collectlist").hide();
}

});

$("body").on("click","#find_collectlist li",function(){
$("#find_collect").val($(this).html());
$("#find_collectlist").hide();
$("#mycollect_list").val($(this).attr("data-id")).change();
});

//加入菜单评语
$("body").on("focus","#mycollect_info",function(){
if (!/color_5b/.test($(this).attr('class')))
$(this).html("").val("").addClass('color_5b');
});

$("body").on("blur","#mycollect_info",function(){
if($(this).val()=='')
$(this).val('说说你的看法').removeClass('color_5b');
});