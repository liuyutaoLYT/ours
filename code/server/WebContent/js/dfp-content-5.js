function browserRedirect(){
            var sUserAgent = navigator.userAgent.toLowerCase();
            var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
            var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
            var bIsMidp = sUserAgent.match(/midp/i) == "midp";
            var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
            var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
            var bIsAndroid = sUserAgent.match(/android/i) == "android";
            var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
            var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
var m_recipe_id = window.location.href.split(".html")[0].split("-")[1];

            if (bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM){
			if(m_recipe_id>0)
			window.location.href="//m.meishichina.com/recipe/"+m_recipe_id+"/#hmsr=w2m&hmpl=recipe";
			}
}
browserRedirect();

var googletag = googletag || {};
googletag.cmd = googletag.cmd || [];
(function() {
var gads = document.createElement('script');
gads.async = true;
gads.type = 'text/javascript';
var useSSL = 'https:' == document.location.protocol;
gads.src = (useSSL ? 'https:' : 'http:') + 
'//www.googletagservices.com/tag/js/gpt.js';
var node = document.getElementsByTagName('script')[0];
node.parentNode.insertBefore(gads, node);
})();
  googletag.cmd.push(function() {
    googletag.defineSlot('/1103991/厨色内容页左幅300x250', [300, 250], 'div-gpt-ad-1508681717585-0').addService(googletag.pubads());
    googletag.defineSlot('/1103991/厨色内容页右幅300x250', [300, 250], 'div-gpt-ad-1508681717585-1').addService(googletag.pubads());
    googletag.defineSlot('/1103991/厨色菜谱页右侧一(首屏)300x250', [300, 250], 'div-gpt-ad-1508681717585-2').addService(googletag.pubads());
    googletag.defineSlot('/1103991/厨色菜谱页右侧二300x250', [300, 250], 'div-gpt-ad-1508681717585-3').addService(googletag.pubads());
    googletag.defineSlot('/1103991/厨色菜谱页右侧(悬浮)300x250', [300, 510], 'div-gpt-ad-1508681717585-4').addService(googletag.pubads());
    googletag.pubads().enableSingleRequest();
    googletag.enableServices();
  });