
jQuery().ready(function () {
    // 导航下拉
    $(".dropdown").mouseenter(function () {
        $("#Process dd").stop(true, true).hide();
        var submenu = $(this).parent().next();
        submenu.css({
            position: 'absolute', top: $(this).offset().top + $(this).height() + 'px', left: $(this).offset().left + 'px', zIndex: 1000
        });
        submenu.stop().slideDown(300);
        $(".dropdown").mouseleave(function () {
            $("#Process dd").slideUp("fast");
        });
    });
    // 顶部导航下拉
    jQuery(".dropdown:has(ul)").hover(function () {
        jQuery(this).children("ul").stop(true, true).slideDown(300);
        jQuery(this).children("a.on").addClass("onover");
    }, function () {
        jQuery(this).children("ul").stop(true, true).slideUp("fast");
        jQuery(this).children("a.on").removeClass("onover");
    });
    // 关闭tooltip
    //    jQuery('.toolTip .close').click(function () {
    //        jQuery(this.parentNode).fadeOut(function () {
    //            jQuery(this).remove();
    //        });
    //    });

    jQuery(".close").click(function () {
        jQuery(this).parent().fadeTo(300, 0, function () {
            jQuery(this).slideUp(300);
        });
        return false;
    }
	);

    // 返回顶部
    jQuery(window).scroll(function () {
        if (jQuery(this).scrollTop() != 0) {
            jQuery('#scrolltop').fadeIn();
        } else {
            jQuery('#scrolltop').fadeOut();
        }
    });

    jQuery('#scrolltop').click(function () {
        jQuery('body,html').animate({ scrollTop: 0 }, 300);
    });

    //Page Flip on hover

    $("#pageflip").hover(function () {
        $("#pageflip img , .msg_block").stop()
			.animate({
			    width: '250px',
			    height: '250px'
			}, 500);
    }, function () {
        $("#pageflip img").stop()
			.animate({
			    width: '125px',
			    height: '125px'
			}, 220);
        $(".msg_block").stop()
			.animate({
			    width: '125px',
			    height: '125px'
			}, 200);
    });

});

/*弹窗代码开始*/
// 运行代码
$.fn.runCode = function () {
    var getText = function (elems) {
        var ret = "", elem;

        for (var i = 0; elems[i]; i++) {
            elem = elems[i];
            if (elem.nodeType === 3 || elem.nodeType === 4) {
                ret += elem.nodeValue;
            } else if (elem.nodeType !== 8) {
                ret += getText(elem.childNodes);
            };
        };

        return ret;
    };

    var code = getText(this);
    new Function(code).call(window);

    return this;
};

// 皮肤选择	
window._demoSkin = function () {
    $.dialog({
        id: 'demoSkin',
        padding: '15px',
        title: 'lhgDialog皮肤展示',
        content: _demoSkin.tmpl
    });
};
_demoSkin.tmpl = function (data) {
    var html = ['<table class="zebra" style="width:480px"><tbody>'];
    for (var i = 0, length = data.length; i < length; i++) {
        html.push('<tr class="');
        html.push(i % 2 ? 'odd' : '');
        html.push('"><th style="width:7em"><a href="?demoSkin=');
        html.push(data[i].name);
        html.push('">');
        html.push(data[i].name);
        html.push('</a></th><td>');
        html.push(data[i].about);
        html.push('</td></tr>');
    };
    html.push('</tbody></table>');
    return html.join('');
}([
	{ name: 'default', about: '蓝色简约风格皮肤，大气十足，纯CSS设计，无图片，采用css3渐进增强' },
	{ name: 'blue', about: '3.5.2默认蓝色透明皮肤，各浏览器表现一致，包含图片' },
	{ name: 'chrome', about: 'chrome浏览器(xp)风格，包含图片' },
	{ name: 'discuz', about: 'discuz论坛登录窗口样式皮，简洁，纯CSS设计，无图片，采用css3渐进增强' },
	{ name: 'jtop', about: '仿cmstop内容管理系统窗口皮肤，蓝色简约风格，纯CSS设计，无图片，采用css3渐进增强' },
	{ name: 'mac', about: '灰色简约风格皮肤，简洁，纯CSS设计，无图片，采用css3渐进增强' },
	{ name: 'idialog', about: '苹果电脑风格的弹窗皮肤，很不错的，包含图片' },
	{ name: 'qq2011', about: '仿QQ2011弹出窗口的蓝色渐变皮肤，纯CSS设计，无图片，采用css3渐进增强' }
]);

$(function () {
    // 按钮触发代码运行
    $(document).bind('click', function (event) {
        var target = event.target,
			$target = $(target);

        if ($target.hasClass('runcode')) {
            $('#' + target.name).runCode();
        };
    });

    var $skin = $('#demo_skin');
    if (!$skin[0]) return;

    $skin.bind('click', function () {
        _demoSkin();
        return false;
    });
});
/*弹窗代码结束*/
//收藏本站
function AddFavorite(title, url) {
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
//dom
$(function () {
    //头部滑块
    var $headSlideBlock = $("#head-slider-block");
    var sliderBlockPosSource = $("#head-slider-block").css("left");
    var i = 0, n = 0;
    $("#head-nav li").each(function () {
        $(this).mouseenter(function () {
            var liWidth = parseInt($(this).width());
            var liLeft = parseInt($(this).offset().left);
            var sliderBlockLeft = parseInt($headSlideBlock.offset().left);
            var sliderBlockCur = parseInt($headSlideBlock.css("left"));
            //26 滑块宽度的一半
            var sliderBlockPos = sliderBlockCur + (liLeft - sliderBlockLeft) + liWidth / 2 - 29;

            if (parseInt(sliderBlockPosSource) > 0) {
                $headSlideBlock.stop().animate({ left: sliderBlockPos + "px" }, 200);
            } else {
                $headSlideBlock.css({ left: sliderBlockPos + "px" })
            }
        }).mouseleave(function () {
            //console.log(i++);
        })
    })
    $("#head-nav").mouseleave(function () {
        $headSlideBlock.stop().animate({ left: sliderBlockPosSource }, 1000)
        //console.log(sliderBlockPosSource+"n"+(n++));
    })
})

//    /**
//    * @author 愚人码头
//    * 类似于新浪微博新消息提示的定位框
//    */
//    (function ($) {
//        $.fn.capacityFixed = function (options) {
//            var opts = $.extend({}, $.fn.capacityFixed.deflunt, options);
//            var FixedFun = function (element) {
//                var top = opts.top;
//                var right = ($(window).width() - opts.pageWidth) / 2 + opts.right;
//                element.css({
//                    //"right": right,
//                    "top": top
//                });
//                $(window).resize(function () {
//                    var right = ($(window).width() - opts.pageWidth) / 2 + opts.right;
//                    element.css({
//                        "right": right
//                    });
//                });
//                $(window).scroll(function () {
//                    var scrolls = $(this).scrollTop();
//                    if (scrolls > top) {

//                        if (window.XMLHttpRequest) {
//                            element.css({
//                                position: "fixed",
//                                top: 0
//                            });
//                        } else {
//                            element.css({
//                                top: scrolls
//                            });
//                        }
//                    } else {
//                        element.css({
//                            position: "static",
//                            top: 0
//                        });
//                    }
//                });
//                element.find(".close-ico").click(function (event) {
//                    element.remove();
//                    event.preventDefault();
//                })
//            };
//            return $(this).each(function () {
//                FixedFun($(this));
//            });
//        };
//        $.fn.capacityFixed.deflunt = {
//            right: 100, //相对于页面宽度的右边定位
//            top: 79,
//            pageWidth: 990
//        };
//    })(jQuery);
