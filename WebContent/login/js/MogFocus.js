;
(function(e) {
    e.fn.mogFocus = function(t) {
        var n = e.extend({}, e.fn.mogFocus.defaults, t);
        return this.each(function() {
            function _() {
                r.next("ul").find("img").each(function(t) {
                    var n = e(this).attr("src"), r = e(this).attr("height"), i = e(this).attr("width"), s = n.substring(n.lastIndexOf(".") + 1, n.length), o = parseInt(e(this).css("marginLeft"));
                    s == "png" && (e(this).wrap("<i></i>"), e(this).parent().css({display: "inline-block", filter: "progid:DXImageTransform.Microsoft.AlphaImageLoader(src=" + n + ")", height: r, width: i, marginLeft: o}), e(this).remove())
                })
            }
            function D(t, n) {
                t.children().each(function() {
                    e(this).children().wrap("<li></li>"), n.push(e(this).html())
                }), t.html(n.reverse().join(""))
            }
            function P() {
                p.animate({marginLeft: -u, opacity: .8}, n.prevNextAnima), d.animate({marginRight: -u, opacity: .8}, n.prevNextAnima)
            }
            function H() {
                p.animate({marginLeft: -(u + n.prevNextPos), opacity: 0}, n.prevNextAnima), d.animate({marginRight: -(u + n.prevNextPos), opacity: 0}, n.prevNextAnima)
            }
            function B(e) {
                r.delay(n.focusDelay).animate(e, n.focusTime), n.single && r.next().delay(n.focusDelayTwo).animate(e, n.focusTwoTime)
            }
            function j(e, t) {
                var i = r.children(":visible"), s = r.next("ul").children(":visible");
                i.css("z-index", 10).delay(n.focusDelayTwo).animate(e, {duration: n.randomsImgTime, easing: n.randeasing, complete: function() {
                        i.hide().css(t)
                    }}), s.css("z-index", 10).delay(n.focusDelay).animate(e, {duration: n.randomsImgTime, easing: n.randeasing, complete: function() {
                        s.hide().css(t)
                    }})
            }
            function F(t) {
                n.scrollWidth == "100%" || n.scrollWidth == "auto" ? f = e(window).width() : f = n.scrollWidth;
                var i = {fade: function() {
                        r.children().eq(t).delay(n.focusDelay).fadeIn(n.fadeTime).siblings().fadeOut(n.fadeTime), n.single && r.next().children().eq(t).delay(n.focusDelayTwo).fadeIn(n.fadeTwoTime).siblings().fadeOut(n.fadeTwoTime)
                    }, lrSliding: function() {
                        B({left: -(f * t)})
                    }, tbSliding: function() {
                        B({bottom: -m * t})
                    }, randomImg: function() {
                        var e = Math.floor(Math.random() * c.length), i = r.children().height(), s = r.children().width(), o = [function() {
                                j({top: -i}, {top: 0})
                            }, function() {
                                j({left: s}, {left: 0})
                            }, function() {
                                j({top: i}, {top: 0})
                            }, function() {
                                j({left: -s}, {left: 0})
                            }, function() {
                                j({top: -i, opacity: 0}, {top: 0, opacity: 1})
                            }, function() {
                                j({left: s, opacity: 0}, {left: 0, opacity: 1})
                            }, function() {
                                j({top: i, opacity: 0}, {top: 0, opacity: 1})
                            }, function() {
                                j({left: -s, opacity: 0}, {left: 0, opacity: 1})
                            }];
                        o[e](), r.children().eq(t).css("z-index", 1).show(), r.next("ul").children().eq(t).css("z-index", 1).delay(n.focusDelay).fadeIn(600)
                    }};
                i[n.animationWay](), n.btnStyle == "thumbnail" && h.children().length > n.thumlen && I();
                switch (n.btnStyle) {
                    case"thumbnail":
                        h.children().eq(t).css(n.thumSelected).siblings().css(n.thumSubsty);
                        break;
                    case"noNumber":
                        h.children().eq(t).addClass("hover").siblings().removeClass("hover");
                        break;
                    case"number":
                        h.children().eq(t).css(n.thumSelected).siblings().css(n.thumSubsty)
                    }
            }
            function I() {
                h.children().length > n.thumlen && (a - L == n.thumlen - 1 ? (A("-="), L += N, k += 1) : a == 0 && (h.animate({left: 0}, 800), L = 0))
            }
            function q() {
                h.hide(), t.css({top: Math.round(s / 2), height: 0, display: "block"}).delay(700).animate({top: 0, height: s}, {duration: 1e3, easing: "easeInOutQuart", complete: function() {
                        h.fadeIn(600), n.prevNextToggle == "show" && P()
                    }})
            }
            function R() {
                t.css("display", "block"), n.prevNextToggle == "show" && (p.css({marginLeft: -u, opacity: .8}), d.css({marginRight: -u, opacity: .8}))
            }
            var t = e(this), r = t.children().children().first(), i = r.children().length, s = t.height(), o = r.find("img").attr("width"), u = Math.round(o / 2), a = 0, f = null, l = [], c = ["top", "right", "bottom", "left", "fadeTop", "fadeRight", "fadeBottom", "fadeLeft"];
            !n.single && !!r.next("ul") && r.next("ul").remove(), n.conversionImg && ((n.animationWay == "fade" || n.animationWay == "randomImg") && e.browser.msie && parseInt(e.browser.version) <= 8 && _(), e.browser.msie && parseInt(e.browser.version) == 6 && _()), n.scrollWidth == "100%" || n.scrollWidth == "auto" ? e(window).bind("resize load", function() {
                var t = e(window).width();
                r.parent().children().children().css("width", t);
                var s = r.children().width();
                n.animationWay == "lrSliding" ? r.parent().children("ul").css({width: s * i, left: -(s * a)}) : r.parent().children("ul").css("width", t)
            }) : (r.parent().children().children().css("width", n.scrollWidth), r.parent().children().css("width", n.scrollWidth * i));
            if (n.animationWay == "fade" || n.animationWay == "randomImg")
                r.parent().children("ul").children().css({position: "absolute"}), r.children().filter(":not(':first')").hide().parent().next("ul").children().filter(":not(':first')").hide();
            t.css("width", n.scrollWidth).children().css("width", n.scrollWidth), l.push("<ul class='imgBtn'>"), r.children("li").each(function(e) {
                switch (n.btnStyle) {
                    case"number":
                        l.push("<li>" + (e + 1) + "</li>");
                        break;
                    case"noNumber":
                        l.push("<li></li>");
                        break;
                    case"thumbnail":
                        var t = r.children().children().eq(e).clone().find("img").attr({width: n.thumWidth, height: n.thumHeight}).parent().html();
                        l.push("<li>" + t + "</li>")
                    }
            }), l.push("</ul>"), n.btnStyle != "hidden" && t.append(l.join("")), n.prevNextToggle != "hide" && r.parent().prepend("<a href='#' class='prev'></a>").append("<a href='#' class='next'></a>");
            var h = t.children(".imgBtn"), p = t.find(".prev"), d = t.find(".next");
            p.css({marginLeft: -(u + n.prevNextPos), opacity: 0}), d.css({marginRight: -(u + n.prevNextPos), opacity: 0}), n.scrollWidth == "100%" || n.scrollWidth == "auto" ? h.css(n.thumCSS) : h.css(n.thumCSS);
            if (n.animationWay == "tbSliding") {
                var v = r.next("ul"), m = r.children().first().height(), g = parseInt(v.css("top")), y = [], b = [];
                D(r, y), D(v, b), v.children().css({height: m - g, paddingTop: g}).parent().css({top: "auto", bottom: 0}), r.css("bottom", 0)
            }
            if (n.btnStyle == "thumbnail") {
                h.children().css(n.thumSubsty).css({width: n.thumWidth, height: n.thumHeight});
                if (h.children().length > n.thumlen) {
                    h.removeAttr("class").wrap("<div class='imgBtn'></div>").parent().css(n.thumCSS), h.before("<a href='#' class='thumPrev'></a>").after("<a href='#' class='thumNext'></a>");
                    var w = h.children(), E = parseInt(w.css("marginRight")), S = w.outerWidth() + E, x = e(".thumPrev"), T = e(".thumNext"), N = Math.ceil(n.thumlen / 2), C = Math.ceil(w.length / N), k = 0, L = 0;
                    h.parent().css("width", S * n.thumlen + (x.width() + parseInt(x.css("marginRight"))) * 2), h.wrap("<div class='btnWarp'></div>"), t.find(".btnWarp").css({"float": "left", position: "relative", width: S * n.thumlen, height: w.outerHeight()}), h.css({margin: 0, right: 0, position: "absolute", left: 0, width: S * w.length, height: w.outerHeight()}), x.css("visibility", "hidden"), x.css("float", "left").click(function() {
                        return k != 0 && (A("+="), k -= 1, L -= N), !1
                    }), T.css("float", "right").click(function() {
                        return k != C - 1 && (A("-="), k += 1, L += N), !1
                    });
                    function A(e) {
                        h.animate({left: e + S * N}, 800, function() {
                            k == C - 1 ? T.css("visibility", "hidden") : T.css("visibility", "visible"), k == 0 ? x.css("visibility", "hidden") : x.css("visibility", "visible")
                        })
                    }}
            }
            switch (n.btnStyle) {
                case"thumbnail":
                    h.children().eq(0).css(n.thumSelected);
                    break;
                case"noNumber":
                    h.children().eq(0).addClass("hover");
                    break;
                case"number":
                    h.children().eq(0).css(n.thumSelected).siblings().css(n.thumSubsty)
            }
            h.children("li").each(function() {
                e(this).click(function() {
                    if (!r.is(":animated") && !r.next("ul").is(":animated") && !r.children().is(":animated")) {
                        var t = e(this).index();
                        a != t && F(t), a = t, n.btnStyle == "thumbnail" && (t - L == n.thumlen - 1 && (A("-="), L += N, k += 1), t - L == 0 && t != 0 && (A("+="), L -= N, k -= 1))
                    }
                })
            });
            
            var O;
            $(window).on('stop',function(){
                n.autoScroll && clearInterval(O), n.prevNextToggle == "toggle" && P();
            })
            $(window).on('play',function(){
                n.autoScroll && (O = setInterval(function() {
                    a += 1, a == i && (a = 0), F(a)
                }, n.time)), n.prevNextToggle == "toggle" && H();
            })
            t.hover(function() {
                n.autoScroll && clearInterval(O), n.prevNextToggle == "toggle" && P()
            }, function() {
                n.autoScroll && (O = setInterval(function() {
                    a += 1, a == i && (a = 0), F(a)
                }, n.time)), n.prevNextToggle == "toggle" && H()
            }).trigger("mouseleave"), t.find(".prev").click(function() {
                return!r.is(":animated") && !r.next("ul").is(":animated") && !r.children().is(":animated") && (a -= 1, a == -1 && (a = i - 1), F(a)), !1
            }).hover(function() {
                e(this).fadeTo(300, .6)
            }, function() {
                e(this).fadeTo(300, .8)
            }), t.find(".next").click(function() {
                return!r.is(":animated") && !r.next("ul").is(":animated") && !r.children().is(":animated") && (a += 1, a == i && (a = 0), F(a)), !1
            }).hover(function() {
                e(this).fadeTo(300, .6)
            }, function() {
                e(this).fadeTo(300, .8)
            });
            if (n.loadswitch) {
                var M = t.find("img");
                t.children().hide(), t.parent().css("background", "url(" + n.loading + ") no-repeat center center"), h.hide(), M.load(function() {
                    t.parent().css("background", "none"), n.loadAnimation && q(), t.children("div").show()
                }), n.loadAnimation || (h.show(), R())
            } else
                n.loadAnimation ? q() : R()
        })
    }, e.fn.mogFocus.defaults = {loadAnimation: !0, loadswitch: !1, loading: "images/loading.gif", time: 3e3, scrollWidth: "100%", autoScroll: !0, conversionImg: !0, animationWay: "lrSliding", prevNextPos: 70, prevNextAnima: {duration: 600, easing: "easeInOutBack"}, prevNextToggle: "show", btnStyle: "thumbnail", thumWidth: 90, thumHeight: 36, thumlen: 5, thumCSS: {right: "50%", "margin-right": -390}, thumSubsty: {border: "1px solid #ccc", padding: 1, background: "#fff"}, thumSelected: {border: "1px solid #6d6d6d", background: "#fff"}, single: !0, focusDelay: 0, focusDelayTwo: 200, focusTime: {duration: 1300, easing: "easeInOutQuart"}, focusTwoTime: {duration: 1300, easing: "easeInOutQuart"}, fadeTime: 400, fadeTwoTime: 600, randomsImgTime: 600, randeasing: "easeInOutBack"}
})(jQuery);