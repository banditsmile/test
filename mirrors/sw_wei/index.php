<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>微信网站_微信应用开发_微信营销-深网网络</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../jquery1.42.min.js"></script><script type="text/javascript" src="../../jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="js/jquery1.42.min.js"></script><script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
function G(id){
   return document.getElementById(id);	
}
function ck(){
   
}
</script>

<script type="text/javascript">
function G(id){
   return document.getElementById(id);	
}
function ck(){
   if(G('yourname').value == ''){
	alert("姓名不能为空！");
	G('yourname').focus();
	return false;
   }
   if(G('qq').value == ''){
	alert("电话号码不能为空！");
	G('qq').focus();
	return false;
   }
}
</script>

<script type="text/javascript">
var Speed =10; //速度(毫秒)
var Space = 5; //每次移动(px)
var PageWidth = 150; //翻页宽度
var fill = 0; //整体移位
var MoveLock = false;
var MoveTimeObj;
var Comp = 0;
var AutoPlayObj = null;
GetObj("List2").innerHTML = GetObj("List1").innerHTML;
GetObj('ISL_Cont').scrollLeft = fill;
GetObj("ISL_Cont").onmouseover = function(){clearInterval(AutoPlayObj);}
GetObj("ISL_Cont").onmouseout = function(){AutoPlay();}
AutoPlay();
function GetObj(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval('document.all.'+objName)}}
function AutoPlay(){ //自动滚动
 clearInterval(AutoPlayObj);
 AutoPlayObj = setInterval('ISL_GoDown();ISL_StopDown();',5000); //间隔时间
}
function ISL_GoUp(){ //上翻开始
 if(MoveLock) return;
 clearInterval(AutoPlayObj);
 MoveLock = true;
 MoveTimeObj = setInterval('ISL_ScrUp();',Speed);
}
function ISL_StopUp(){ //上翻停止
 clearInterval(MoveTimeObj);
 if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0){
  Comp = fill - (GetObj('ISL_Cont').scrollLeft % PageWidth);
  CompScr();
 }else{
  MoveLock = false;
 }
 AutoPlay();
}
function ISL_ScrUp(){ //上翻动作
 if(GetObj('ISL_Cont').scrollLeft <= 0){GetObj('ISL_Cont').scrollLeft = GetObj('ISL_Cont').scrollLeft + GetObj('List1').offsetWidth}
 GetObj('ISL_Cont').scrollLeft -= Space ;
}
function ISL_GoDown(){ //下翻
 clearInterval(MoveTimeObj);
 if(MoveLock) return;
 clearInterval(AutoPlayObj);
 MoveLock = true;
 ISL_ScrDown();
 MoveTimeObj = setInterval('ISL_ScrDown()',Speed);
}
function ISL_StopDown(){ //下翻停止
 clearInterval(MoveTimeObj);
 if(GetObj('ISL_Cont').scrollLeft % PageWidth - fill != 0 ){
  Comp = PageWidth - GetObj('ISL_Cont').scrollLeft % PageWidth + fill;
  CompScr();
 }else{
  MoveLock = false;
 }
 AutoPlay();
}
function ISL_ScrDown(){ //下翻动作
 if(GetObj('ISL_Cont').scrollLeft >= GetObj('List1').scrollWidth){GetObj('ISL_Cont').scrollLeft = GetObj('ISL_Cont').scrollLeft - GetObj('List1').scrollWidth;}
 GetObj('ISL_Cont').scrollLeft += Space ;
}
function CompScr(){
 var num;
 if(Comp == 0){MoveLock = false;return;}
 if(Comp < 0){ //上翻
  if(Comp < -Space){
   Comp += Space;
   num = Space;
  }else{
   num = -Comp;
   Comp = 0;
  }
  GetObj('ISL_Cont').scrollLeft -= num;
  setTimeout('CompScr()',Speed);
 }else{ //下翻
  if(Comp > Space){
   Comp -= Space;
   num = Space;
  }else{
   num = Comp;
   Comp = 0;
  }
  GetObj('ISL_Cont').scrollLeft += num;
  setTimeout('CompScr()',Speed);
 }
}
</script>
</head>
<style>
#BDBridgeIconWrap{margin-left:0px!important;}
.ghah{width:1000px;height:299px;margin:10px auto;}
.ghah dl dt{width:500px;height:299px;background:url(images/0uasgd.jpg) 0 0 no-repeat;float:left;}
.ghah dl dd{float:left;width:500px; padding-top:30px;}
.ghah dl dd p{font-family:"微软雅黑";color:#4794e7;font-size:30px;line-height:30px;font-weight:bold;}
.ghah dl dd span{display:block;font-size:14px;line-height:22px;margin-bottom:15px;color:#666;}
.ghah dl dd b{font-size:16px;font-weight:normal;display:block;line-height:28px;color:#333;}
</style>

<body>
<!--线-->
<div id="xian"></div>
<!--线_end-->

<!--功能栏-->
<div id="box">
	<div class="box_box">
    	<div class="box_box_left">您好！ 欢迎来到深网网络！</div>
        <div class="box_box_right"><a href="http://www.shenwang001.cn" target="_blank">了解更多</a>  |  <a href="http://www.shenwang001.com/data/sitemap.html" target="_blank" class="dao_a">网站地图</a>  |  <a href="http://www.shenwang001.com/aboutus/contact/" target="_blank" class="dao_a">联系我们</a>  |  <a href="http://www.shenwang001.com/aboutus/pay/" target="_blank" class="dao_a">付款方式</a>  |  <a href="http://www.shenwang001.com/news/youshi.html" target="_blank" class="dao_a">建站优势</a></div>
  </div>
</div>

<div class="clear"></div>

<!--功能栏_end-->

<!--/*菜单*/-->
<div id="top">
	<div class="top_box">
    	<div class="top_box_left"><img src="images/LOGO.jpg" /></div>
        <div class="top_box_right">
     		<ul class="top_box_ul">

<li><a href="/sw_wei/index.php#content_box1" class="top_a">微网站</a></li>
              
<li><a href="/sw_wei/index.php#content_box2" class="top_a">微商城</a></li>
              
<li><a href="/sw_wei/index.php#content_box3" class="top_a">微营销</a></li>
              
<li><a href="/sw_wei/index.php#content_box4" class="top_a">微会员</a></li>
              
<li><a href="/sw_wei/index.php#content_box5" class="top_a">微定制</a></li>
              
<li><a href="/sw_wei/index.php#content_box6" class="top_a">应用场景</a></li>
          </ul>

        
        

</div>
    </div>
</div>

<div class="clear"></div>
<!--菜单end-->

<!--/*banner*/-->
	<div class="focusBox" style="margin:0 auto">
			<ul class="pic">
            	<li><a href="#"><img src="images/banner_2_5ada.jpg" /></a></li>
				<li><a href="#"><img src="images/banner_1_07.jpg" /></a></li>
				<li><a href="#"><img src="images/banner_2_07.jpg" /></a></li>
			</ul>
			<a class="prev" href="javascript:void(0)"></a>
			<a class="next" href="javascript:void(0)"></a>
			<ul class="hd">
				<li></li>
				<li></li>
				<li></li>
			</ul>
	</div>

	<script type="text/javascript">
		jQuery(".focusBox").slide({ mainCell:".pic",effect:"left", autoPlay:true, delayTime:300});
	</script>
    
<!--    /*banner_end*/-->

<!--内容1开始-->
<div id="content_box1">
	<div class="content_box1_div">
    	<div class="content_box1_div_1">微网站、HTML5+微信 一箭双雕</div>
        <div class="content_box1_div_2"></div>
        <div class="content_box1_div_3">
        	<div class="content_box1_div_3_lfet">HTML5版，让传统网站变身移动版</div>
            <div class="content_box1_div_3_right">微信版、完美接入微信</div>
        </div>
    </div>
</div>



<div class="ghah">
	<dl>
    	<dt></dt>
        <dd>
        	<p>数十款精美官网</p>
			<p style="font-size:20px;margin-bottom:15px;">微网站  快速帮用户打造微信移动网站</p>
            <span>微网站即通过微信入口访问的手机网站，通过微网站展示企业的产品与服务，活动，荣誉等信息让用户随时随地可查询到企业的全部信息，让您的公众平台发挥更大价值，内置一建
            拨号与一建导航功能便于客户联系与来访。</span>
            
            <b>1、后台自自设置模板，轻松更换背帚和样式</b>
			<b>2、协助PC官网自动跳转到微网站，让手机客户访问微官网。</b> 
        </dd>
    </dl>
</div>

<!--内容end-->

<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->

<!--分割线-->
<div class="content_xian_2"></div>
<!--分割线_end-->

<!--内容2-->
<div id="content_box2">
	<div class="content_box2_nr">
    	<div class="content_box2_nr_left"></div>
        <div class="content_box2_nr_right">
        	<div class="content_box2_nr_right_dazi">微商城，把店开到客户手里</div>
            <div class="content_box2_nr_right_xiaozi">深网网络微商城构建一个全流程的购物体验，商家可发布商品设定价格，客户在手机上直接浏览查看商品信息，只需轻松一点即可提交订单并付款，购物过程轻松、便捷；微商城把店铺开到用户手机上</div>
        </div>
    </div>
</div>

<!--内容2_end-->

<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->

<!--分割线2-->
<div class="content_xuxian"></div>
<!--分割线2_end-->

<!--内容3-->
<div id="content_box3">
	<div class="content_box3_nr">
    	<div class="content_box3_nr_right"></div>
        <div class="content_box3_nr_left">
        	<div class="content_box3_nr_left_dazi">微营销，迅速增加精准真实粉丝</div>
            <div class="content_box3_nr_left_xiaozi">深网网络独有的专业技术能迅速定位并增加你的微信和微博精准真实粉丝。并通过病毒式的口碑传播进而起到促销及品牌推广的作用。另我们还专业提供微营销品牌策划、微营销代运营等专业服务，更多关于微营销内容</div>
        </div>
    </div>
</div>


<!--内容3_end-->

<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->

<!--分割线2-->
<div class="content_xuxian"></div>
<!--分割线2_end-->

<!--内容4-->
<div id="content_box4">
	<div class="content_box4_nr">
    	<div class="content_box4_nr_left"></div>
        <div class="content_box4_nr_right">
        	<div class="content_box4_nr_right_dazi">微会员，精细化管理每一位会员</div>
            <div class="content_box4_nr_right_xiaozi">深网网络可自行创建会员等级，系统根据等级规则自动识别会员，可制定不同等级会员可享受的优惠政策，消费一定的频次后，会员还可自动升级。清晰记录会员的消费行为，并进行数据分析从而实现老会员的维护及各种模式的精准营销。</div>
        </div>
    </div>
</div>

<!--内容4_end-->

<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->

<!--分割线3-->
<div class="content_xuxian"></div>
<!--分割线3_end-->

<!--内容5-->
<div id="content_box5">
	<div class="content_box5_nr">
    	<div class="content_box5_nr_right"></div>
        <div class="content_box5_nr_left">
        	<div class="content_box5_nr_left_dazi">微定制，您提需求，剩下我来！</div>
            <div class="content_box5_nr_left_xiaozi">根据企业微信、微博运营的需要，提供专业化、个性化、全方位的服务，内容包括：模板设计、功能设计、实现与企业CRM系统对接、微信运营指导、人员技术培训等。</div>
        </div>
    </div>
</div>


<!--内容5_end-->

<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->

<!--分割线-->
<div class="content_xian"></div>
<!--分割线_end-->

<!--内容6-->
<div id="content_box6">
	<div class="content_box6_nr">
    	<div class="content_box6_nr_left"></div>
        <div class="content_box6_nr_right">
        	<div class="content_box6_nr_right_dazi">学招商银行，做服务!</div>
            <div class="content_box6_nr_right_xian"></div>
            <div class="content_box6_nr_left_xiaozi"><b>招商银行</b><br />
全国首家微信银行。功能包括：微信智能客服、借记卡账户查询、转账汇款、信用卡账单查询、信用卡还款、积分查询、网点查询及服务预约、理财产品购买、贷款申请办卡申请、手机充值、生活缴费等更多精彩，期待关注！</div>
			<div class="content_box6_nr_right_xian"></div>
            <div class="content_box6_nr_left_weixin"></div>
        </div>
        
    </div>
</div>




<!--内容6_end-->

<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->

<!--分割线2-->
<div class="content_xuxian"></div>
<!--分割线2_end-->

<!--内容7-->
<div id="content_box7">
	<div class="content_box7_nr">
    	<div class="content_box7_nr_left"></div>
        <div class="content_box7_nr_right">
        	<div class="content_box7_nr_right_dazi">学OPPO，做营销!</div>
            <div class="content_box7_nr_right_xian"></div>
            <div class="content_box7_nr_left_xiaozi"><b>OPPO</b><br />在OPPO的刮刮乐互动游戏中，规则是：回复“七天乐”获得一张虚拟奖券，在刮奖区刮一下就能知道自己是否中奖，每人每天有一次抽奖机会。活动历时7天，发行奖券50余万张，增加粉丝12.8万人，送出手机7部。活动全程共吸引了21.5万人参加。
</div>
			<div class="content_box7_nr_right_xian"></div>
            <div class="content_box7_nr_left_weixin"></div>
        </div>
        
    </div>
</div>

<!--内容7_end-->

<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->

<!--分割线2-->
<div class="content_xuxian"></div>
<!--分割线2_end--


<!--内容8-->
<div id="content_box8">
	<div class="content_box8_nr">
    	<div class="content_box8_nr_left"></div>
        <div class="content_box8_nr_right">
        	<div class="content_box8_nr_right_dazi">学小米，做电商!</div>
            <div class="content_box8_nr_right_xian"></div>
            <div class="content_box8_nr_left_xiaozi"><b>小米</b><br />小米成功得益于互联网营销，每周开放购买前都会在官网放微信推广链接及微信二维码，定期举行有奖活动来激活用户。通过关注小米微信即可以参与抽奖，不用排队优先购买资格等。小米又率先开通了微商城，开始试水微电商，微信的高效运用，大大拉升了小米的销量。
</div>
			<div class="content_box8_nr_right_xian"></div>
            <div class="content_box8_nr_left_weixin"></div>
        </div>
        
    </div>
</div>

<!--内容8_end-->

<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->


<!--分割线-->
<div class="content_xian_2"></div>
<!--分割线_end-->

<!--partner-->
<div id="partner">
	<div class="partner_nr">
    	<div class="partner_nr_dazi">移动互联网正在改变我们身边的一切，每一个行业都应该从中受益</div>
        <div class="partner_nr_xiaozi">深网的客户</div><div class="partner_nr_xx_zi"><a href="#">全部客户列表 ></a></div>
     </div>
    <div class="parther_youqing">
    	<a class="#"><img src="images/youqing_1.jpg"  class="parther_youqing_img_1"/></a>
        <a class="#"><img src="images/youqing_2.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_3.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_4.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_5.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"> <img src="images/youqing_6.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_7.jpg"  class="parther_youqing_img_3"/></a>
        <a class="#"><img src="images/youqing_8.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"> <img src="images/youqing_9.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"> <img src="images/youqing_10.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_11.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_12.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_13.jpg"  class="parther_youqing_img_3"/></a>
        <a class="#"><img src="images/youqing_14.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_15.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_16.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_17.jpg"  class="parther_youqing_img_2"/></a>
        <a class="#"><img src="images/youqing_18.jpg"  class="parther_youqing_img_2"/></a>
    </div>
    
</div>

<!--partner_end-->

<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->

<!--分割线2-->
<div class="content_xuxian"></div>
<!--分割线2_end-->

<!--选择功能-->
<div id="gongneng">
	<div class="gongneng_title">
    	<div class="gongneng_title_left"></div>
        <div style="float:left;font-family:'微软雅黑';margin-top:20px;text-align:center;width:500px;font-size:16px;height:28px;line-height:28px;">请用手机扫二维码</div>
        <div class="gongneng_titile_right"></div>
    </div>
<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->
    <div class="gongneng_xian"></div>
    
<!--调用JS-->
  <div class="scrollBox" style="margin:0 auto">
			<div class="ohbox">
					<ul class="piclist">
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_001.jpg" /><span>东莞尚康贵族养生会所</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_002.jpg" /><span>四川燎原工程设备有限公司</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_003.jpg" /><span>合肥市瑶海区杆林汽车用品商行</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_004.jpg" /><span>深圳市通亚工艺品有限公司</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_005.jpg" /><span>深圳市嘉洛激光工艺有限公司</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_006.jpg" /><span>合肥市徐萍餐饮服务有限公司</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_007.jpg" /><span>深圳凯电科技有限公司</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_008.jpg" /><span>四川郭县惠通汽车修厂</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_009.jpg" /><span>深圳市成方达电子有限公司</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_0010.jpg" /><span>四川乐山市蓉成气配</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_0011.jpg" /><span>东莞市迪奥照明科技有限公司</span></a></li>
						<li><a href="http://www.shenwang001.cn" target="_blank"><img src="images/gongneng_img_1_0012.jpg" /><span>深圳市兴兴传美贸易有限公司</span></a></li>
					</ul>
			</div>
			<div class="pageBtn">
				<span class="prev">&lt;</span>
				<span class="next">&gt;</span>
				<ul class="list">
                    <li>0</li>
                    <li>1</li>
                    <li>2</li>
                </ul>
			</div>
	</div>
	<script type="text/javascript">jQuery(".scrollBox").slide({ titCell:".list li", mainCell:".piclist", effect:"left",vis:4,scroll:4,delayTime:800,trigger:"click",easing:"easeOutCirc"});</script>
    
<!--清除浮动-->
<div class="clear"></div>
<!--清除浮动end-->


<!--调用JS_end-->
 <div class="gongneng_xian"></div>
</div>

<!--选择功能end-->

<!--广告-->
<a class="#"><div id="guanggao"></div></a>

<!--广告end-->
<!--留言-->
 <form action="" method="post" onsubmit="return ck();">
 <div id="liuyan">
	<div class="liuyan_box">
    	<div class="liuyan_zi"><i>给我们留言 专业人员将于24小时内与您联系</i></div>
       
        <input type="text" maxlength="40" size="26" id="yourname" name="yourname" class="liuyan_k"  placeholder="您的名字"/>
        
        <input type="text" maxlength="15" size="26" id="tel" name="tel" class="liuyan_k"  placeholder="您的邮箱 / QQ"/> 
        
        <input type="text" maxlength="15" size="26" id="qq" name="qq" class="liuyan_k_2"  placeholder="您的联系电话"/>
        
        <textarea id="q4" name="q4" cols="60" rows="5" class="liuyan_k_3" placeholder="请留言..." ></textarea>

    
    </div>
    <div class="" style="position:relative; margin:auto 0; width: 100%;text-align: center; margin-top:10px;">
					  <input name="add" type="hidden" value="1" />
					  <input type="submit" value="" class="liuyan_tijiao" /> 
					  <font color="red"></font>
    </div>
</div>
 </form>
<!--留言_end-->

<!--版权信息-->
<div id="copyright">
	<div class="copyright_box">
    	<div class="copyright_1"></div>
        <div class="copyright_2">
        	<div class="copyright_dazi">联系我们</div>
            <div class="copyright_xiaozi">企业QQ：4006460755<br />
			售后电话：0755-25825295，,17722698067<br />
			24小时值班热线：17722698067<br />
			资源合作：18927462228<br />
			Email：help@shenwang001.com<br />
			官网网址：www.shenwang001.com<br />
			地址：深圳罗湖深南东路1086号集浩大厦A座2202室</div>
        </div>
          	  <div class="copyright_xian"></div>
              
            <div class="copyright_3">
        	<div class="copyright_3_dazi">旗下网站</div>
            <div class="copyright_3_xiaozi"><a href="http://www.85878.net" target="_blank">科宝网</a><br />
			<a href="#">深网互联</a><br />
			<a href="http://www.shenwang001.net" target="_blank">深圳SEO优化</a><br />
			<a href="http://www.sw400.net" target="_blank">深网400电话网</a><br />
			<a href="http://www.shenwang001.com" target="_blank">深圳网站制作网</a><br />
            <a href="http://mb1.shenwang001.com" target="_blank">成品网站超市网</a><br />
			<a href="http://bbs.qqbao.cn" target="_blank">科宝网络营销论坛网</a></div>
      </div>
 </div>

</div>

<!--版权信息_end-->

<!--结束了-->
<div id="dibu">
	<div class="dibu_box">Copyright © 2006-2013 深圳市深网网络营销策划有限公司.<script src="http://s4.cnzz.com/stat.php?id=5951369&web_id=5951369" language="JavaScript"></script>. 粤ICP备12017982号 　　<a href="/aboutus/job/" target="_blank">人力资源</a> | <a href="/solutions/IDC/" target="_blank">域名主机报价</a> | <a href="/solutions/jzlc/" target="_blank">建站流程</a> | <a href="/down/" target="_blank">行业建站方案下载</a>	</div>    
</div>
<!--结束了_end-->
<script type="text/javascript"> var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F951edbb6beb6049dd358bdea996d3798' type='text/javascript'%3E%3C/script%3E")) </script>


</body>
</html>
