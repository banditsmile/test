document.writeln("<div id=\"divSerWin\" class=\"service\">");
document.writeln("<div id=\"divMySer\" class=\"service-close\">");
document.writeln("<div class=\"service-button\" onmouseover='ClickSer();'></div>");
document.writeln("<div class=\"service-inside\">");
document.writeln("<dl>");

document.writeln("<dt>深网客服团队</dt>");
document.writeln("<dd><img  src=\"http://wpa.qq.com/pa?p=2:1280636807:45\" alt=\"点击这里给我发消息\"><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=1280636807&site=qq&menu=yes\">在线客服</a></dd>");
document.writeln("<dd><img  src=\"http://wpa.qq.com/pa?p=2:1978095920:45\" alt=\"点击这里给我发消息\"><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=1978095920&site=qq&menu=yes\">在线客服</a></dd>");
document.writeln("<dd><img  src=\"http://wpa.qq.com/pa?p=2:1918307907:45\" alt=\"点击这里给我发消息\"><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=1918307907&site=qq&menu=yes\">在线客服</a></dd>");
document.writeln("<dd><img  src=\"http://wpa.qq.com/pa?p=2:2430589943:45\" alt=\"点击这里给我发消息\"><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=2430589943&site=qq&menu=yes\">在线客服</a></dd>");
document.writeln("<dd class=\"esp_1\"><img src=\"http://wpa.qq.com/pa?p=2:2594864263:45\" alt=\"点击这里给我发消息\"><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=2594864263&site=qq&menu=yes\">营销顾问</a></dd>");
document.writeln("<dd><img src=\"http://wpa.qq.com/pa?p=2:2412944346:45\" alt=\"点击这里给我发消息\"><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=2412944346&site=qq&menu=yes\">外包合作</a></dd>");
document.writeln("<dd class=\"esp_1\"><img src=\"http://wpa.qq.com/pa?p=2:1929558685:45\" alt=\"点击这里给我发消息\"><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=1929558685&site=qq&menu=yes\">资源合作</a></dd>");
document.writeln("<dt>企业售后QQ</dt>");
document.writeln("<dd class=\"esp_2\"><img  style=\"CURSOR: pointer;width:74px;height:23px;\" onclick=\"javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=4006460755&eid=218808P8z8p8Q808K8q8p&o=www.shewnang001.com&q=7&ref='+document.location, '_blank', 'height=544, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');\"  border=\"0\" SRC=\"http://im.bizapp.qq.com:8000/zx_qq.gif\"></dd>");
document.writeln("</dl>");
document.writeln("<dl class=\"esp_10\">");
document.writeln("<dt>客服工作时间</dt>");
document.writeln("<dd class=\"esp_4\">周一至周六</dd>");
document.writeln("<dd class=\"esp_4\">9:00 - 18:00</dd>");
document.writeln("</dl>");
document.writeln("</div>");
document.writeln("</div>");
document.writeln("</div>");

$(document).ready(function(){
    var destDiv = $("#divSerWin");
    var startPos = destDiv.position().top;
    var divHeight = destDiv.outerHeight();
    
    $(window).scroll(function (){
        scrTop = $(window).scrollTop();
        if( startPos < scrTop){
            topPos = startPos+(scrTop - startPos)+10;
            $("#divSerWin").css("position", "absolute").css("top", topPos +"px").css('zIndex', '500');
        }
    });
});

function ClickSer(){
    var obj=$("#divMySer")
    if( obj.attr("class") == "service-open" )
        $("#divMySer").removeClass("service-open").addClass("service-close");
    else
        $("#divMySer").removeClass("service-close").addClass("service-open");
}