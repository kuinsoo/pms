if (annyang) {
	var historyBack = function(){
		window.history.back();
	};
	var historyForward = function(){
		window.history.forward();
	};
	var selectCnt=0;
	var otherSelectBox = function(){
		$('.recipientSelect').trigger( "click" );
		var optionCnt = $(".recipientSelect").length;
		console.log('optionCnt :: ',optionCnt);
		if(selectCnt<=optionCnt){
			selectCnt++;
			$(".recipientSelect option:eq("+selectCnt+")").prop("selected", true);
		}else{
			selectCnt--;
			$(".recipientSelect option:eq("+selectCnt+")").prop("selected", true);
		}
	};
	var selectBox = function(){
		var sendMessage = $(".recipientSelect option:selected").text();
		//console.log('sendMessage :: ',sendMessage);
		$("#sendMessageInput").val(sendMessage);
		$('.facingContent').focus();
	};
	var sendMsg = function(){
		$('.facingSendBtn').trigger( "click" ); 
	};
	var homePage = function(){
		$(location).attr('href','/main');
	};
	var mainFriends = function(){
		$('#friendSendIcon').trigger( "click" ); 
	};
	var mainMsg = function(){
		$('#messageSendIcon').trigger( "click" ); 
	};
	var mainAlram = function(){
		$('.dialog__triggers').trigger( "click" ); 
	};
	var showLeftPush = function(){
		$('#showLeftPush').trigger( "click" ); 
	};
	var myPage = function(){
		$(location).attr('href','/myPage');
	};
	var allSchedule = function(){
		$(location).attr('href','/allSchedule');
	};
	var notice = function(){
		$(location).attr('href','/notice');
	};
	var guide = function(){
		$(location).attr('href','/guide');
	};
	var qnaList = function(){
		$(location).attr('href','/qnaList');
	};
	var subMaintab1 = function(){
		$( '#smTab1').trigger( "click" );
	};
	var subMaintab2 = function(){
		$( '#smTab2').trigger( "click" );
	};
	var subMaintab3 = function(){
		$( '#smTab3').trigger( "click" );
	};
	var subMaintab4 = function(){
		$( '#smTab4').trigger( "click" );
	};
	
	var commands = {
		'뒤로': historyBack,
		'앞으로': historyForward,
		'다른 친구': otherSelectBox,
		'선택': selectBox,
		'보내기': sendMsg,
		'취소': historyBack,
	    '메인': homePage,
	    '메뉴': showLeftPush,
	    '친구': mainFriends,
	    '쪽지': mainMsg,
	    '알림': mainAlram,
	    '마이 페이지': myPage,
	    '전체 일정': allSchedule,
	    '공지사항': notice,
	    '가이드': guide,
	    '큐앤 에이': qnaList,
		'업무 리포트': subMaintab1,
		'업무 카드': subMaintab2,
		'간트 차트': subMaintab3,
		'회의 리스트': subMaintab4
	 };
	annyang.debug();  
	annyang.addCommands(commands);
	
	annyang.setLanguage('ko');
	annyang.start();
	
	annyang.addCallback('resultMatch', function() {
		$(".facingContent").on("focus", function(){
			annyang.addCallback('result', function(parseResults) {
				$(".facingContent").text(parseResults[0]);	
				$('.facingSendBtn').focus();
			});
		});
		$(".facingSendBtn").on("focus", function(){
			annyang.removeCallback('result');
		});
	});
} 