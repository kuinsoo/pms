//1. 브라우저 쿠키 가져오기
function getCookie(name){
	var results = document.cookie.match ('(^|;) ?' + name + '=([^;]*)(;|$)');
	return results ? decodeURIComponent(results[2]) : null; 
 }
var member_mail = getCookie('member_mail');

//editor
var quill = new Quill('#editor', {
	theme : 'snow'
		,
	 styles: {
	        'body': {
	            'font-family': "'Helvetica Neue', Helvetica, Arial, sans-serif",
	                'font-size': '18px',
	                'line-height': '20px',
	        },
	        'span.test': {
	            'font-weight': 'bold',   
	        },
	        'p.p:after': {
	            'content': 'attr(data-before)',
	            'color': 'white',
	            'background':'gray',
	            'cursor': 'pointer',
	        }
	    }
});

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

if(dd<10) {  
	dd='0'+dd  
};
if(mm<10) { 
	mm='0'+mm 
};
today = yyyy+'-'+mm+'-'+dd;

function saveFormAsTextFile(){
    var textToSave =
      'date: ' + today + '\n' +
      $('#editor').children().html(); // =content;

    var meetDoc = {
       		"content" : $('#editor').children().html(),
       		"project_id" : params.todayProject_id, 	//프로젝트 id 
       		"roomid" : params.sessionid,	//회의제목 
     };
     
     // json 만들기  to oracle
     $.ajax({
  	    url : 'https://172.30.1.26:8089/saveDoc',
  	    type : 'post',
  	    data : meetDoc,
  	    success : function (data) { },
  	    error : function (err) {
  	    	alert(err.toString());
  	    }
  	});

    var textToSaveAsBlob = new Blob([textToSave], {type:"text/html"});
    var textToSaveAsURL = window.URL.createObjectURL(textToSaveAsBlob);
    var fileNameToSaveAs = "프로젝트 회의(온라인)_"+today;

    var downloadLink = document.createElement("a");
    downloadLink.download = fileNameToSaveAs;
    downloadLink.innerHTML = "Download File";
    downloadLink.href = textToSaveAsURL;
    downloadLink.onclick = destroyClickedElement;
    downloadLink.style.display = "none";
    document.body.appendChild(downloadLink);

    downloadLink.click();
 };
 
function destroyClickedElement(event) {
    document.body.removeChild(event.target);
};

// # url get 파라미터로부터 값 가져오기  
(function() {
    var params = {},
        r = /([^&=]+)=?([^&]*)/g;

    function d(s) {
        return decodeURIComponent(s.replace(/\+/g, ' '));
    }
    var match, search = window.location.search;
    while (match = r.exec(search.substring(1)))
        params[d(match[1])] = d(match[2]);
    window.params = params;
})();


// # RTCMultiConnection 기본세팅 
var connection = new RTCMultiConnection();

// connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';
connection.socketURL = '/';

//*** 방 아이디
connection.extra.sessionid = params.sessionid;
//*** index와 주고받는 데이터  접속자이름 
connection.extra.userFullName = params.userFullName;
//*** index와 주고받는 프로젝트 아이디 
connection.extra.todayProject_id = params.todayProject_id;
//*** index와 주고받는 데이터  회의 개요
connection.extra.todayRoomTitle = params.todayRoomTitle;
document.all.meetTitle.innerHTML = connection.extra.todayRoomTitle; //ui에 출력 

/// make this room public
connection.publicRoomIdentifier = params.publicRoomIdentifier;
connection.socketMessageEvent = 'canvas-dashboard-demo';
//  방장이 나가도 방이 유지되도록 하는 옵션 
connection.autoCloseEntireSession = false;
// 최대 수용 인원 체크 
connection.maxParticipantsAllowed = 1000;


//***그림판 
// designer. = 그림판관련 내용 here goes canvas designer
var designer = new CanvasDesigner();

// 그림판 위젯 you can place widget.html anywhere
designer.widgetHtmlURL = '/node_modules/canvas-designer/widget.html';
designer.widgetJsURL = '/node_modules/canvas-designer/widget.min.js'
	
// 그림판 내용 싱크 
designer.addSyncListener(function(data) {
    connection.send(data);
});

// 그림도구 
designer.setSelected('pencil');

designer.setTools({
	pencil : true,
	text : false,
	image : true,
	eraser : true,
	line : false,
	arrow : false,
	dragSingle : false,
	dragMultiple : true,
	arc : false,
	rectangle : true,
	quadratic : false,
	bezier : false,
	marker : false,
	zoom : false,
	extraOptions : false,
	code : false,
	undo : true,

	pdf : false,
	colorsPicker : false,
	lineWidth : false
});

//이미지 저장 
function getDataURL(callback) {
    callback = callback || function() {};
    var format = dataURLFormat.value;
    designer.toDataURL(format || 'image/png', function(dataURL) {
        linkToImage.href = dataURL;
        linkToImage.innerHTML = 'Download';
        linkToImage.download = 'image.' + (format || 'image/png').split('/')[1];

        callback(dataURL, format);
    });
}

var dataURLFormat = document.getElementById('data-url-format');
var linkToImage = document.getElementById('link-to-image');

dataURLFormat.onchange = function() {
    localStorage.setItem('data-url-format', dataURLFormat.value);
    getDataURL();
};

// # 타이머 1초간격으로 수행
var RemainDate= 60000*30;
tid=setInterval('msg_time()',1000); 
var overT =0;
var memT=0;// 시간 초과 후, 나중에 들어온 사람 's 팝업 예외처리 
 
function msg_time() {
  var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
  var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
  var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
  
  m = hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경
  
  document.all.timer.innerHTML = m;   // div 영역에 보여줌 
  
  if (RemainDate < 0) {   // 시간이 종료 되었으면..
    clearInterval(tid);   // 타이머 해제
    if(overT==0 ){
    	connection.send('syncOverTime'); // overT+1    	
    }
    if(overT>0&&memT<2){ // 초과 파라미터가 0보다 클때 + 멤버 중 최초 1명에게만
    	var result = confirm('예정시간이 초과했습니다. 회의를 계속 하시겠습니까?'); 
    	if(result) { 
    			alert("긴 회의는 정신건강에 헤로울 수 있습니다.."); 
    		} else {  
    			alert("고생하셨습니다! 오늘도 힘내세요~"); 
    			self.close(); 
    		}
    }
    setInterval('overTime()',1000);
  }else{
    RemainDate = RemainDate - 1000; // 남은시간 -1초
  }
}
function overTime() {
  var hours = Math.floor((overT % (1000 * 60 * 60 * 24)) / (1000*60*60));
  var miniutes = Math.floor((overT % (1000 * 60 * 60)) / (1000*60));
  var seconds = Math.floor((overT % (1000 * 60)) / 1000);
  
  m = "(초과시간)"+ hours + ":" +  miniutes + ":" + seconds  ; // 남은 시간 text형태로 변경
  
  	document.all.timer.innerHTML = m;   // div 영역에 보여줌 
  	overT = overT + 1000; // 초과시간 -1초
}

// 타이머 선언
var syncTimer = new syncTimerWrite();

syncTimer.widgetJsURL = '/webapp/WEB-INF/views/meet/js/syncTimer.js'	
syncTimer.addSyncListener(function(data) {
  connection.send(data);
});

// 에디터 선언
var coEditor = new coEditorWrite();
var editorInput = document.querySelector('#editor');

coEditor.widgetJsURL = '/webapp/WEB-INF/views/meet/js/coEditor.js'	
coEditor.addSyncListener(function(data) {
    connection.send(data);
});

//키
editorInput.addEventListener("keydown", function(event) {
	$(this).children().find('.p').removeClass() ;
    if (event.which == 38 || event.which == 40 || event.which == 13 ) { 
		$(this).children().find('.p').removeClass() ;
	}else{
		var index = quill.getSelection().index;
		var selObj = window.getSelection();   
		var range = selObj.getRangeAt(0);     
		rangeAncestor = range.commonAncestorContainer;
		var editorClassName=member_mail.substring( 0, member_mail.indexOf("@") );
		rangeAncestor.parentElement.setAttribute('class','p '+editorClassName);
		$(this).children().find('.'+editorClassName).attr('data-before',  params.userFullName);
	}
    
	var mySubText = $('#editor').children().html();
	var myTextLength =  mySubText.length;	
	keyCnt++ ;
	connection.send({
		subTextLength : myTextLength,
		subText : mySubText
	});
});

editorInput.addEventListener("keyup", function(event) {
	$(this).children().find('.p').removeClass() ;
});


// 내 일감목록 선언
var coWorkList = new coWorkListLoader();

coWorkList.widgetJsURL = '/webapp/WEB-INF/views/meet/js/coWorkList.js'	
	coWorkList.addSyncListener(function(data) {
    connection.send(data);
});

//RTCMultiConnection
connection.chunkSize = 16000;
connection.enableFileSharing = true;

connection.session = {
    audio: true,
    video: true,
    data: true
};
connection.sdpConstraints.mandatory = {
    OfferToReceiveAudio: true,
    OfferToReceiveVideo: true
};

// 접속(자) 상태정보 
connection.onUserStatusChanged = function(event) {
    var infoBar = document.getElementById('onUserStatusChanged');
    var names = [];
    connection.getAllParticipants().forEach(function(pid) {
        names.push(getFullName(pid));
    });

    if (!names.length) {
        names = ['Only You'];
    } else {
        names = [connection.extra.userFullName || 'You'].concat(names);
    }

    infoBar.innerHTML = '<b>회의 참여자 :</b> ' + names.join(', ');
    connection.extra.names =names.join(', ');
};

//연결(사용자가 접속)되었을때 
connection.onopen = function(event) {
	memT = memT+1;
	// 접속(자) 상태정보 업데이트(바로 위 함수)
    connection.onUserStatusChanged(event);

    // 접속자가 없으면 
    document.getElementById('btn-chat-message').disabled = false;
    // 파일을 첨부하는 경우 
    document.getElementById('btn-attach-file').style.display = 'inline-block';

    //타이머 요청  
	 if(memT>=1){
	    setTimeout(function() {
	    	connection.send('syncTime'); 
	    }, 1000);
	 }; 
		 
    // 새 사용자다 접속하기 전에 이미 작성한 그림이 존재하면 동기화 해줌 
    if (designer.pointsLength <= 0) {
        setTimeout(function() {
            connection.send('plz-sync-points');
        }, 1000);
    }
    
 	// editor   ~= 나 아무 내용도 없어 하고 기존 내용 요청 
	 if(keyCnt<=0){
	    setTimeout(function() {
			 connection.send('syncDoc'); 
	    }, 1000);
	 }; 
	 
 	// 일감목록   
	 if(workListBtnCnt<=0){
	    setTimeout(function() {
			 connection.send('syncWorkList'); 
	    }, 1000);
	 }; 
};

//연결(사용자가 접속)이 '종료' 되었을때 
connection.onclose = connection.onerror = connection.onleave = function(event) {
	// 접속(자) 상태정보 업데이트(바로 '위' 위에 함수)
    connection.onUserStatusChanged(event);
};

// 누군가가 메시지(데이터)를 전달(작성 '중' 인)하는 경우 
connection.onmessage = function(event) {
	//메시지  작성 중/ 아닌 중 
    if(event.data.typing === true) {
        $('#key-press').show().find('span').html(event.extra.userFullName + ' is typing');
        return;
    }
    if(event.data.typing === false) {
        $('#key-press').hide().find('span').html('');
        return;
    }
    // 메시지 이어붙이기 
    if (event.data.chatMessage) {
        appendChatMessage(event);
        return;
    }
    // 읽음 표시 
    if (event.data.checkmark === 'received') {
        var checkmarkElement = document.getElementById(event.data.checkmark_id);
        if (checkmarkElement) {
            checkmarkElement.style.display = 'inline';
        }
        return;
    }
    
    // 그림판 동기화 
    if (event.data === 'plz-sync-points') {
        designer.sync();
        return;
    }
    designer.syncData(event.data);
    
	// 에디터 동기화 
	if(event.data === 'syncDoc'){
		var mySubText = $('#editor').children().html();
		var myTextLength =  mySubText.length;	
		 
		 connection.send({
				subTextLength : myTextLength,
				subText : mySubText
			});
		 return;
	 };
	 
	 if(myTextLength !== event.data.subTextLength){
		 $('#editor').children().html(event.data.subText);
		 return;
	 } 
	 
	//타이머 동기화 _시간 초과 전 
    var setMeetTitle;
    var setTimer;
	if(event.data === 'syncTime'){
    	setTimer = $('#timer').html();
		 connection.send({
			 timer : setTimer,
			 remain : RemainDate,
			 overT : overT
			});
		 return;
	 };
    if($('#timer').html() > event.data.timer){
		$('#timer').html(event.data.timer);
    	RemainDate=event.data.remain;
    };
    //타이머 동기화 _시간 초과 후 
	 if(event.data === 'syncOverTime'){
		 overT++;
		 connection.send({
			 timer : setTimer,
			 remain : RemainDate,
			 overT : overT
			});
		 return;
	 };
    if(overT < event.data.overT){
		overT=event.data.overT;
		memT++;
    };
    
	 
	// 일감목록 동기화 
	if(event.data === 'syncWorkList'){		
		var mySubWorkList= $('#myWorkList').html();
		var myWorkListBtnCnt =  workListBtnCnt;	
		
		connection.send({
			 	subWorkList : mySubWorkList,
			 	workListBtnCnt : myWorkListBtnCnt
			});
		 return;
	 };

	 othersWorkListBtnCnt=event.data.workListBtnCnt;
	 if(workListBtnCnt <= othersWorkListBtnCnt){	
		 $('#myWorkList').html(event.data.subWorkList);
		 return;
	 }
		 
};

// extra code
function beforeOpenRoom(callback) {
    // capture canvas-2d stream
    // and share in realtime using RTCPeerConnection.addStream
    // requires: dev/webrtc-handler.js
    designer.captureStream(function(stream) {
        stream.isScreen = true;
        stream.streamid = stream.id;
        stream.type = 'local';
        
        connection.attachStreams.push(stream);
        connection.onstream({
            stream: stream,
            type: 'local',
            streamid: stream.id,
            // mediaElement: video
        });

        callback();
    });
}

//멀티 영상 스트림 
connection.onstream = function(event) {
    if (event.stream.isScreen) { 
    	/*이번엔 사용 안함 */
    } else {
        event.mediaElement.controls = true;

        var otherVideos = document.querySelector('#other-videos');
        otherVideos.appendChild(event.mediaElement);
    }
    connection.onUserStatusChanged(event);
};


//메신저 영역 
var conversationPanel = document.getElementById('conversation-panel');

function appendChatMessage(event, checkmark_id) {
    var div = document.createElement('div');

    //수신한 작성자(아이디), 메시지를 html로 작성 
    div.className = 'message';
    if (event.data) {
        div.innerHTML = '<b>' + (event.extra.userFullName || event.userid) + ':</b><br>' + event.data.chatMessage;
        
        if (event.data.checkmark_id) {
            connection.send({
                checkmark: 'received',
                checkmark_id: event.data.checkmark_id
            });
        }
    } else {
        div.innerHTML = '<b>You:</b> <img class="checkmark" id="' + checkmark_id + '" title="Received" src="https://webrtcweb.com/checkmark.png"><br>' + event;
        div.style.background = '#cbffcb';
    }
    
    //작성한 html을 이어붙임 
    conversationPanel.appendChild(div);
    
    conversationPanel.scrollTop = conversationPanel.clientHeight;
    conversationPanel.scrollTop = conversationPanel.scrollHeight - conversationPanel.scrollTop;
}

// 키가 눌리고 있는 시점 체크(상대방에게 실시간 작성 중 표시)
var keyPressTimer;
var numberOfKeys = 0;
$('#txt-chat-message').emojioneArea({
    pickerPosition: "top",
    filtersPosition: "bottom",
    tones: false,
    autocomplete: true,
    inline: true,
    hidePickerOnBlur: true,
    events: {
        focus: function() {
            $('.emojionearea-category').unbind('click').bind('click', function() {
                $('.emojionearea-button-close').click();
            });
        },
        keyup: function(e) {
            var chatMessage = $('.emojionearea-editor').html();
            if (!chatMessage || !chatMessage.replace(/ /g, '').length) {
                connection.send({
                    typing: false
                });
            }
            clearTimeout(keyPressTimer);
            numberOfKeys++;

            if (numberOfKeys % 3 === 0) {
                connection.send({
                    typing: true
                });
            }
            keyPressTimer = setTimeout(function() {
                connection.send({
                    typing: false
                });
            }, 1200);
        },
        blur: function() {
            // $('#btn-chat-message').click();
            connection.send({
                typing: false
            });
        }
    }
});

window.onkeyup = function(e) {
    var code = e.keyCode || e.which;
    if (code == 13) {
        $('#btn-chat-message').click();
    }
};

//메시지 보내기
document.getElementById('btn-chat-message').onclick = function() {
    var chatMessage = $('.emojionearea-editor').html();
    
    $('.emojionearea-editor').html('');

    if (!chatMessage || !chatMessage.replace(/ /g, '').length) return;
    var checkmark_id = connection.userid + connection.token();
    appendChatMessage(chatMessage, checkmark_id);
    
    // oracle 오라클 json 만들기 위한 변수 선언  
    //각각의 정보를 Json으로 ...근데.. connection안에 다 들어있는 것 같긴하다.. 
    var username = connection.extra.userFullName;
    var roomid = connection.extra.sessionid;
    var meetObj = {
    		"chatMessage" : chatMessage,
    		"userid" : member_mail,
    		"username" : username,
    		"roomid" : roomid
    }
    
    // json 만들기 (.. form sunmit은 페이지가 전환되서)
   $.ajax({
	    url : 'https://172.30.1.26:8089/test',
	    type : 'post',
	    data : meetObj,
	    success : function (data) { } ,
	    error : function (err) {
	    	console.log(err.toString());
	    } 
	});
    
    // 메시지 전달 
    connection.send({
        chatMessage: chatMessage,
        checkmark_id: checkmark_id
    });
    connection.send({
        typing: false
    });
};


//*** 파일 첨부 
var recentFile;
document.getElementById('btn-attach-file').onclick = function() {
    var file = new FileSelector();
    file.selectSingleFile(function(file) {
        recentFile = file;

        if(connection.getAllParticipants().length >= 1) {
            recentFile.userIndex = 0;
            connection.send(file, connection.getAllParticipants()[recentFile.userIndex]);
        }
    });
};

// html로 파일 내용 변환 : 읽어온 파일 '내용' 표시 
function getFileHTML(file) {
    var url = file.url || URL.createObjectURL(file);
    var attachment = '<a href="' + url + '" target="_blank" download="' + file.name + '">Download: <b>' + file.name + '</b></a>';
    if (file.name.match(/\.jpg|\.png|\.jpeg|\.gif/gi)) {
        attachment += '<br><img crossOrigin="anonymous" src="' + url + '">';
    } else if (file.name.match(/\.wav|\.mp3/gi)) {
        attachment += '<br><audio src="' + url + '" controls></audio>';
    } else if (file.name.match(/\.pdf|\.js|\.txt|\.sh/gi)) {
        attachment += '<iframe class="inline-iframe" src="' + url + '"></iframe></a>';
    }
    return attachment;
}

//사용자 이름(접속 아이디로 조회)
function getFullName(userid) {
    var _userFullName = userid;
    //본인 이름  = 접속자 아이디랑 외부 접속자 아이디랑 같으면 
    if (connection.peers[userid] && connection.peers[userid].extra.userFullName) {
        _userFullName = connection.peers[userid].extra.userFullName;
    }
    return _userFullName;
}

// 파일이 업로드가 끝나면 
connection.onFileEnd = function(file) {
	// html로 파일 내용 변환 실행 
    var html = getFileHTML(file);
	
    var div = progressHelper[file.uuid].div;

    if (file.userid === connection.userid) {
        div.innerHTML = '<b>You:</b><br>' + html;
        div.style.background = '#cbffcb';

        if(recentFile) {
            recentFile.userIndex++;
            var nextUserId = connection.getAllParticipants()[recentFile.userIndex];
            if(nextUserId) {
                connection.send(recentFile, nextUserId);
            }
            else {
                recentFile = null;
            }
        }
        else {
            recentFile = null;
        }
    } else {
        div.innerHTML = '<b>' + getFullName(file.userid) + ':</b><br>' + html;
    }
};

// 파일 자동 저장 옵션 
connection.autoSaveToDisk = false;

var progressHelper = {};

connection.onFileProgress = function(chunk, uuid) {
    var helper = progressHelper[chunk.uuid];
    helper.progress.value = chunk.currentPosition || chunk.maxChunks || helper.progress.max;
    updateLabel(helper.progress, helper.label);
};

connection.onFileStart = function(file) {
    var div = document.createElement('div');
    div.className = 'message';

    if (file.userid === connection.userid) {
        var userFullName = file.remoteUserId;
        if(connection.peersBackup[file.remoteUserId]) {
            userFullName = connection.peersBackup[file.remoteUserId].extra.userFullName;
        }

        div.innerHTML = '<b>You (to: ' + userFullName + '):</b><br><label>0%</label> <progress></progress>';
        div.style.background = '#cbffcb';
    } else {
        div.innerHTML = '<b>' + getFullName(file.userid) + ':</b><br><label>0%</label> <progress></progress>';
    }

    div.title = file.name;
    conversationPanel.appendChild(div);
    progressHelper[file.uuid] = {
        div: div,
        progress: div.querySelector('progress'),
        label: div.querySelector('label')
    };
    progressHelper[file.uuid].progress.max = file.maxChunks;

    conversationPanel.scrollTop = conversationPanel.clientHeight;
    conversationPanel.scrollTop = conversationPanel.scrollHeight - conversationPanel.scrollTop;
};

//파일 업로드 진행상황 바 표시 
function updateLabel(progress, label) {
    if (progress.position == -1) return;
    var position = +progress.position.toFixed(2).split('.')[1] || 100;
    label.innerHTML = position + '%';
}

// 방 접속 유효성 체크(이름 같은 경우, 방이 다 찬 경우, 개설자가 설정한 비번 있는 경우 등)
designer.appendTo(document.getElementById('widget-container'), function() {
    if(!!params.password) {
        connection.password = params.password;
    }

    if (params.open === true || params.open === 'true') {
        beforeOpenRoom(function() {
            connection.open(params.sessionid, function(isRoomOpened, roomid, error) {
                if (error) {
                    if (error === connection.errors.ROOM_NOT_AVAILABLE) {
                        alert('누군가가 한발 빠르게 같은 이름의 회의실을 개설했습니다. 다른 이름으로 개설 부탁드립니다.');
                        return;
                    }
                    alert(error);
                }
                connection.socket.on('접속이 끊어졌습니다', function() {
                    location.reload();
                });
            });
        });
    } else {
        connection.join(params.sessionid, function(isRoomJoined, roomid, error) {
            if (error) {
                if (error === connection.errors.ROOM_NOT_AVAILABLE) {
                    alert('다른 방에 잘못 들어가게 되었습니다. 새로 방을 개설하거나 다른 방을 선택한 후 회의에 참석 바랍니다.');
                    return;
                }
                if (error === connection.errors.ROOM_FULL) {
                    alert('어머, 회의실 참석 정원이 다 찼네요...');
                    return;
                }
                if (error === connection.errors.INVALID_PASSWORD) {
                    connection.password = prompt('방 비밀번호가 있으니 확인 바랍니다.') || '';
                    if(!connection.password.length) {
                        alert('I비밀번호가 다른데요? .');
                        return;
                    }
                    connection.join(params.sessionid, function(isRoomJoined, roomid, error) {
                        if(error) {
                            alert(error);
                        }
                    });
                    return;
                }
                alert(error);
            }
            connection.socket.on('접속이 끝어졌습니다', function() {
                location.reload();
            });
        });
    }
});


// 내 일감 목록 불러오기
$('#myWorkListBtn').on('click', function(){	  
	
	  $.ajax({
		    url : 'https://172.30.1.26:8081/myWorkList',
		    type : 'POST',
		    data : {
		    	"project_id" : params.todayProject_id,
		    	"member_mail": member_mail
		    },
		    success : function (data) {
		    	
		    	var tableClassName;
		    	if(data.length==0){
		    		tableClassName=member_mail.substring( 0, member_mail.indexOf("@") );
		    	}else{		    		
		    		tableClassName="wList"+data[0]["work_id"];
		    	}

		    	$("<span> ' >" + params.userFullName + " ' 님의 일감들 </span> " +
		    			"<button class='listedWorksClose'> [ 접기 ]</button> ").appendTo("#myWorkList"); // 이것을 테이블에붙임
				$("<table class='workTable' id='"+tableClassName+"' />").css({
					margin: "5px auto 15px",
					width:"100%",
					border : "1px solid #ccc",
					background:"#e7e7e7",
					display:"block"
				}).appendTo("#myWorkList"); // 테이블을 생성하고 그 테이블을 div에 추가함
				
				if(data.length==0){
					$("<tr><td> 아직  배정된 일감이 없습니다~ </td></tr>").appendTo("#"+tableClassName);
					$("<hr/>").appendTo("#myWorkList");
				}else{	
					var works = JSON.stringify(data);

					$.each(data, function(index, works) { // 이치를 써서 모든 데이터들을 배열에 넣음
						var items = [];
						items.push("<td>" + (index+1) + "</td>");
						items.push("<td>" + works.work_title + "</td>"); // 여기에 id pw addr tel의 값을 배열에 넣은뒤
						items.push("<td>" + works.work_content + "</td>");
						items.push("<td>" + works.work_progress + " %</td>");
						
						$("<tr/>", {
							html : items // 티알에 붙임,
						}).addClass('tr'+(index+1)).appendTo("#"+tableClassName); // 그리고 그 tr을 테이블에 붙임
						
						// 업무를 마친 경우(todo 100%)
						if(works.work_progress==100){
							$('.tr'+(index+1)).css('text-decoration', 'line-through');	
						}
						// 마감일이 오늘을 넘겼을 경우  
						if(today>works.format_work_eedate){
							$('.tr'+(index+1)).css('color', 'red');	
						}
					});//each끝 
					$("<hr/>").appendTo("#myWorkList");
					
				};
				
				// 커넥션 
		  		var mySubWorkList= $('#myWorkList').html();
		  		workListBtnCnt++;
		  		myWorkListBtnCnt = workListBtnCnt;
				
				connection.send({
				 	subWorkList : mySubWorkList,
				 	workListBtnCnt : myWorkListBtnCnt
				});
				$("#myWorkListBtn").attr("disabled","disabled");
		    },
		    error : function (err) {
		    	console.log(err);
		    } 
		});
});

//내 일감 목록 닫기(미정/ 지우기 말고 접기?)
$(document).ready(function(){
	$('#myWorkList').on('click', '.listedWorksClose', function(){	// 동적 on event :상위 selector에 이벤트 걸기 
		$(this).next().toggle();
	});
});

