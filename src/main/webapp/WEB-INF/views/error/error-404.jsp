<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 - CURRENT</title>
    <link rel="shortcut icon" type="image/x-icon" href="/images/favicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/bootstrap-material-design.min.css" />
    <link rel="stylesheet" href="/css/ripples.min.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <script src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <link rel="stylesheet" href="/css/login.css">
    <style>
        .wraps{width:100%;height:100%;display:flex;justify-content:center;align-items:center;}
        body{margin:0;background:#ddd}
        body > .wraps > .container{width:500px;}
        .wraps div.well{padding:30px !important;}
        div.well input[type="submit"]{width:100%;height:50px}
        .box{opacity:0.95;border-radius:20px !important;padding:0}
        .col-md-6.box div{background-color:rgba(0, 0, 0, 0.5);margin-right:10px;padding:15px;border-radius:20px;margin-bottom:10px}
        .col-md-6.box div *:not(span){color:white}
        .box ul{padding-left:15px;list-style:none}
        .box li{width:90%}
        .status span{float:right}
        .status-success span{color:#4CAF50}
        .status-warning span{color:#FFC107}
        .status-danger span{color:#F44336}
        .well.box.info{background-color:#F44336;color:white;font-size:15px;text-align:center}
        .findDiv{width:300px;margin:0 auto;margin-top:20px;}
        .findPassword{float:right;}

        /* DIM LAYER POPUP */
        .pop-layer .pop-container{padding:20px 25px;background-color:#fff;border-radius:20px;}
        .pop-layer{display:none;position:absolute;top:50%;left:50%;width:500px;height:auto;z-index:10;}
        .dim-layer {
            display:none;position:fixed; _position:absolute;top:0;left:0;width:100%;height:100%;
            z-index: 100;
        }
        .dim-layer .dimBg {
            position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;
            filter: alpha(opacity=50);
        }
        .dim-layer .pop-layer{display:block;width:500px;}
        .findEmailBtn{width:100%;}
        .btn-layerClose{width:100%;}

        .pop-layers .pop-containers{padding:20px 25px;background-color:#fff;border-radius:20px;}
        .pop-layers{display:none;position:absolute;top:50%;left:50%;width:500px;height:auto;z-index:10;}
        .dim-layers {
            display:none;position:fixed; _position:absolute;top:0;left:0;width:100%;height:100%;
            z-index: 100;
        }
        .dim-layers .dimBgs {
            position:absolute;top:0;left:0;width:100%;height:100%;background:#000;opacity:.5;
            filter: alpha(opacity=50);
        }
        .dim-layers .pop-layers{display:block;width:500px;}
        .error{color: red; }
        .signBtn{width:100%;}
        #naver_id_login > a > img{display:block;margin:0 auto;}
    </style>
</head>

<body>
<div class="wraps">
    <div class="container">
        <div class="well box">
            <form action="/loginProcess" method="post">
                <h1>CURRENT 로그인</h1>
                <br>
                <div class="form-group label-floating">
                    <label class="control-label">이메일</label>
                    <c:choose>
                        <c:when test="${member_mail!=email}">
                            <input type="email"	name="member_mail" id="email" value="${member_mail}" class="form-control" autofocus="autofocus" required />
                        </c:when>
                        <c:when test="${member_mail==email}">
                            <input type="email"	name="member_mail" id="email" value="kkuinsoo@gmail.com" class="form-control" autofocus="autofocus" required />
                        </c:when>
                    </c:choose>
                </div>
                <div class="form-group label-floating">
                    <label class="control-label">비밀번호</label>
                    <input type="password" name="member_pass"  id ="pass" class="form-control" value="4444" required />
                    <c:if test="${loginResult == 'false'}">
                        <span class="error"> 일치하는 회원이 없습니다..다시 로그인 해주세요.</span>
                    </c:if>
                </div>
                <br> <input type="submit" value="로그인" class="btn btn-primary btn-raised" /><br>
                <a href="/signView" class="btn btn-primary btn-raised signBtn">회원가입</a>
            </form>

            <div id="naver_id_login" style="text-align:center"><a href="${url}">
                <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>

            <div class="findDiv">
                <a href="#layerEmail" class="findEmail">이메일 찾기</a>
                <a href="#layerPassword" class="findPassword">비밀번호 찾기</a>
            </div>
            <form action="/findEmail" method="post">
                <div class="dim-layer">
                    <div class="dimBg"></div>
                    <div id="layerEmail" class="pop-layer">
                        <div class="pop-container">
                            <div class="pop-conts">
                                <div class="form-group label-floating">
                                    <label class="control-label">이름</label>
                                    <input type="text"	name="member_name" class="form-control" autofocus="autofocus" required />
                                </div>
                                <div class="form-group label-floating">
                                    <label class="control-label">휴대번호</label>
                                    <input type="tel" name="member_tel" class="form-control" autofocus="autofocus" required />
                                </div>
                                <div class="form-group label-floating">
                                    <label class="control-label">이메일</label>
                                    <input type="email"	name="member_email" class="form-control" autofocus="autofocus" required />
                                </div>
                                <button type="submit" class="btn btn-primary btn-raised findEmailBtn">이메일 찾기</button>
                                <a href="#" class="btn btn-primary btn-raised btn-layerClose">취소</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <form action="/findPass" method="post">
                <div class="dim-layers">
                    <div class="dimBgs"></div>
                    <div id="layerPassword" class="pop-layers">
                        <div class="pop-containers">
                            <div class="pop-contss">
                                <div class="form-group label-floating">
                                    <label class="control-label">이름</label>
                                    <input type="text"	name="member_name" class="form-control" autofocus="autofocus" required />
                                </div>
                                <div class="form-group label-floating">
                                    <label class="control-label">이메일(ID)</label>
                                    <input type="email"	name="member_mail" class="form-control" autofocus="autofocus" required />
                                </div>
                                <button type="submit" class="btn btn-primary btn-raised findEmailBtn">비밀번호 찾기</button>
                                <a href="#" class="btn btn-primary btn-raised btn-layerClose">취소</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<script src="/js/material.min.js"></script>

<script>
	$.material.init()
</script>
<script type="text/javascript">
	$(document).ready(function(){

		$(document).keydown(function(event){
			$(".error").hide();
		});
	});

</script>
<script type="text/javascript">
	// 이메일 찾기 DIM POPUP
	$('.findEmail').click(function(){
		var $href = $(this).attr('href');
		layer_popup($href);
	});
	function layer_popup(el){

		var $el = $(el);        //레이어의 id를 $el 변수에 저장
		var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

		isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

		var $elWidth = ~~($el.outerWidth()),
			$elHeight = ~~($el.outerHeight()),
			docWidth = $(document).width(),
			docHeight = $(document).height();

		// 화면의 중앙에 레이어를 띄운다.
		if ($elHeight < docHeight || $elWidth < docWidth) {
			$el.css({
				marginTop: -$elHeight /2,
				marginLeft: -$elWidth/2
			})
		} else {
			$el.css({top: 0, left: 0});
		}

		$el.find('a.btn-layerClose').click(function(){
			isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
			return false;
		});

		$('.layer .dimBg').click(function(){
			$('.dim-layer').fadeOut();
			return false;
		});

	}

	// 비밀번호 찾기 DIM POPUP
	$('.findPassword').click(function(){
		var $href = $(this).attr('href');
		layer_popups($href);
	});
	function layer_popups(els){
		var $els = $(els);        //레이어의 id를 $el 변수에 저장
		var isDims = $els.prev().hasClass('dimBgs');   //dimmed 레이어를 감지하기 위한 boolean 변수

		isDims ? $('.dim-layers').fadeIn() : $els.fadeIn();

		var $elWidths = ~~($els.outerWidth()),
			$elHeights = ~~($els.outerHeight()),
			docWidths = $(document).width(),
			docHeights = $(document).height();

		// 화면의 중앙에 레이어를 띄운다.
		if ($elHeights < docHeights || $elWidths < docWidths) {
			$els.css({
				marginTop: -$elHeights/2,
				marginLeft: -$elWidths/2
			})
		} else {
			$els.css({top: 0, left: 0});
		}

		$els.find('a.btn-layerClose').click(function(){
			isDims ? $('.dim-layers').fadeOut() : $els.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
			return false;
		});

		$('.layer .dimBgs').click(function(){
			$('.dim-layers').fadeOut();
			return false;
		});
	}
</script>
</body>
</html>