(function($,msc){var feed=msc.register("msc.tools.feed"),elapsed=msc.tools.date.elapsed;feed.init=function(config){feed.config=$.extend(true,{dom:{list:$("#J_feed_list"),load:$("#J_feed_load")},noDataTips:'没有数据',data:{page:1,pageSize:15},render:function(html,data){return'<li>'+html+'</li>';},url:msc.tools.getAjaxUrl({ac:"feed",op:"get_feed_list"})},config||{});feed.bind();feed.loadFeeds();}
feed.bind=function(){var config=this.config,dom=config.dom;if(dom.load){dom.load.find("a").click(function(){this.className+=' on';config.data.page+=1;feed.loadFeeds();return false});}
setInterval(function(){dom.list.find("div.subtime").each(function(){this.innerHTML=elapsed(this.getAttribute("data-time")*1e3);});},6e4);}
feed.reload=function(){var dom=feed.config.dom;feed.config.data.page=1;dom.noData&&dom.noData.hide();dom.list.empty();if(dom.load){dom.load.show().find("a").addClass("on");}
feed.loadFeeds();}
feed.renderData=function(str,data,obj){if(!str||!data){return"";}
data.id=data.id||obj.id||'';return str.replace(new RegExp('{%\\$([^%]+)%}','g'),function($1,$2){if($2==='dateline_time'){return data['dateline']?elapsed(data['dateline']*1e3):'...';}else{return data[$2]||"";}});}
feed.render=function(data){var config=feed.config,dom=feed.config.dom,str;if(data&&data.length){str='';$.each(data,function(index,value){if(value.template){str+=config.render(feed.renderData(value.template,value.template_data,value),value)||'';}});if(msc.tools.browser.isIe6){dom.list.append(str);}else{$(str).hide().appendTo(dom.list).fadeIn();}
if(dom.load&&data.length<config.data.pageSize){dom.load.hide();}else{dom.load&&dom.load.show().find("a").removeClass("on");}
str=null;config.success&&config.success();}else{if(config.data.page===1){if(!dom.noData){dom.noData=$('<div class="ui_no_data">'+config.noDataTips+'</div>').insertBefore(dom.list);}
dom.noData.show();}
dom.load&&dom.load.hide();dom.load.find("a").removeClass("on");}
msc.goTop&&msc.goTop.trigger();}
feed.loadFeeds=function(addPage){$.get(feed.config.url,feed.config.data,function(res){if(res.error===0){feed.render(res.data);}else if(res.error===10001){msc.user.exit().login();}else{feed.error(res);}},"json");}
feed.error=function(res){if(feed.error.hit>=5){msc.ui.dialog.warning("响应失败");return setTimeout(function(){location.reload(true);},1e3);}
feed.error.hit+=1;if(feed.config.dom.load){feed.config.dom.load.find("a").removeClass("on");}
msc.ui.dialog.error(res.msg||'请求失败');}
feed.error.hit=0;}(jQuery,msc));