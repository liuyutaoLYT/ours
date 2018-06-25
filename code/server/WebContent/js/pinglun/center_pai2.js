var ifbtn=0;if(typeof(FormData)=='undefined'){$("li.low_tip").show();}
$("#cover").on("click","a.del",function(){var that=$(this);var img=that.parent().find('img');delAliYunObject(img.attr('src'));that.parent().fadeOut('400',function(){$(this).remove();});});$("#J_m_cover").click(function(){$(this).val('');});$("#J_m_cover").change(function(){var imgs=$(this).get(0).files;var n=9-$("#cover div").length;var i;if(imgs.length>n){msc.ui.dialog.error("当前还能上传"+n+"张图片");$(this).val('');return false;}else{img_status(1,0,imgs.length);upload_img(imgs,1,0);}});function upload_img(f,type,i){var formData=new FormData($('#form')[0]);var name=f[i].name;var key=$("#oss_key").val();var uid=$("#user_id").val();var j=f[i].name.substring(f[i].name.lastIndexOf('.')+1);key=key+(new Date().getTime())+Math.floor(Math.random()*1000)+uid+"."+j;formData.append("key",key);formData.append("file",f[i]);$.ajax({url:"//meishichina.oss-cn-beijing.aliyuncs.com/",type:"POST",data:formData,dataType:"json",processData:false,contentType:false,success:function(res){if(type==1){img_status(1,1);$("#cover").append('<div style="display:none;"><a class="del" href="javascript:void(0);" >删除</a><span></span><img src="http://i3.meishichina.com/'+res.url+'@!c320"><input class="allpic" type="hidden" name="allpic[]" value="http://i3.meishichina.com/'+res.url+'"></div>');$("#cover div:last").fadeIn('600');if($("#cover div").length==1)
$("#cover").dragsort({dragSelector:"div",dragBetween:true,scrollSpeed:5});}},error:function(data,s){if(type==1){img_status(1,-1);}},complete:function(){i++;if(i<f.length)
upload_img(f,type,i)
else
img_status(1,2);}});}
function delAliYunObject(e){var img=e.split("@");$.get(msc.tools.getAjaxUrl({ac:"recipe",op:"delAliYunObject"}),{'img':img[0]},function(){},"json");}
function img_status(i,t,n){i=$("#multi_cover_status");n=(n>1)?n:1;if(t==0){i.html('<span class="step_doing" title="正在上传中..."></span>本次共选择<b class="s1">'+n+'</b>张图片，成功<b class="s2">0</b>张，失败<b class="s3">0</b>张。')}
else if(t==1){i.find('.s2').html(parseInt(i.find('.s2').html())+n);}
else if(t==-1){i.find('.s3').html(parseInt(i.find('.s3').html())+n);}
else if(t==2){i.find('.step_doing').remove();i.append('上传完毕！支持鼠标拖拽调整步骤顺序')}}
$(".things_type1 span").click(function(){var id=$(this).attr("data-value");$(".things_type1 span").removeClass("on");$(this).addClass("on");$("#things_type1").val(id);});$("#J_form").submit(function(){if($('#J_message').val()==''){msc.ui.dialog.error("请输入话题描述");$('#J_message').focus();}
else if(!/meishichina.com/.test($('input.allpic').val())){msc.ui.dialog.error("请至少上传一张图片");}
else if($("input[name=geetest_challenge]").val()==''){msc.ui.dialog.error("请完成验证码");}
else{ifbtn=1;msc.ui.dialog.loading();return true;}
return false;});window.onbeforeunload=onbeforeunload_handler;function onbeforeunload_handler(){if(($("#J_message").val()!=''||$('#cover img').length>1)&&ifbtn==0)
return"您输入的数据可能不会被保存";}