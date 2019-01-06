//1. 브라우저 쿠키 가져오기
function getCookie(name){
	var results = document.cookie.match ('(^|;) ?' + name + '=([^;]*)(;|$)');
	return results ? decodeURIComponent(results[2]) : null; 
 }

var member_mail = getCookie('member_mail');
var member_name = getCookie('member_name');
var project_id = getCookie('project_id');
var project_title = getCookie('project_title');
 
//2. 쿠키에서 가져온 값 
$('#txt-user-name').val(member_name);		
$('#txt-projectNum').after('<span>'+ project_title +'</span>');

// RTCMultiConnection
var publicRoomIdentifier = 'dashboard';
var connection = new RTCMultiConnection();

connection.socketURL = '/';

/// make this room public
connection.publicRoomIdentifier = publicRoomIdentifier;
connection.socketMessageEvent = publicRoomIdentifier;

//개설자가 바뀌어도 닫침 안되게 하기 
connection.autoCloseEntireSession = true;

connection.connectSocket(function(socket) {
    looper();
    socket.on('disconnect', function() {
        location.reload();
    });
});


function looper() {
    if (!$('#rooms-list').length) return;
    connection.socket.emit('get-public-rooms', publicRoomIdentifier, function(listOfRooms) {
        updateListOfRooms(listOfRooms);

        setTimeout(looper, 3000);
    });
}

function updateListOfRooms(rooms) {
    $('#active-rooms').html(rooms.length);
    $('#rooms-list').html('');

    if (!rooms.length) {
        $('#rooms-list').html('<tr><td colspan=9>진행 중인 회의가 없습니다.</td></tr>');
        return;
    }
    
    rooms.forEach(function(room, idx) {
    	var userFullName= room.extra.userFullName;
        var memNum = 0;
    	room.participants.forEach(function(pid) {
    		memNum +=1;
        });
        var tr = document.createElement('tr');
        var html = '';
        
        if(!room.isPasswordProtected) {
          html += '<td rowspan="2">' + (idx + 1) + '</td>';
        }
        else {
          html += '<td>' + (idx + 1) + ' <img src="https://webrtcweb.com/password-protected.png" style="height: 15px; vertical-align: middle;" title="Password Protected Room"></td>';
        }

        html += '<td><span class="max-width" title="' + room.sessionid + '">' + room.sessionid + '</span></td>';
        html += '<td><span class="max-width" title="' + room.extra.userFullName + '">' + room.extra.userFullName +'<br/> 외 '+(memNum-1)+ ' 명 </span></td>';
        // 만원일 때 얼럿 
        if(room.isRoomFull) {
          html += '<td><span style="border-bottom: 1px dotted red; color: red;">Room is full</span></td>';
        }
        else {
          html += '<td><button class="btn join-room" data-roomid="' + room.sessionid + '" data-roomTitle="' + room.extra.todayRoomTitle + '" data-password-protected="' + (room.isPasswordProtected === true ? 'true' : 'false') +'">Join</button></td>';
        }
        
        var html2 = '';
        html2 += '<tr class="'+project_id+'">';
        html2+= '<td  colspan="3"><span class="max-width" title="' + room.extra.todayRoomTitle + '">' + room.extra.todayRoomTitle + '</span></td>';
        html2 += '</tr>';
        	
        if(project_id==room.extra.todayProject_id){	//***
        	$(tr).html(html);
        	$(tr).attr('class',project_id);
        	$('#rooms-list').append(tr);
        	$(tr).after(html2);        	
        }

        $(tr).find('.join-room').click(function() {
        	$("#txt-user-name-hidden").val(member_name); //쿠키, 전역
            $(tr).find('.join-room').prop('disabled', true);

            var roomid = $('.join-room').attr('data-roomid');
            $('#txt-roomid-hidden').val(roomid);

            var roomid = $('.join-room').attr('data-roomTitle');
            $('#txt-roomTitle-hidden').val(roomid);
            
            $('#btn-show-join-hidden-room').click();

            if($('.join-room').attr('data-password-protected') === 'true') {
              $('#txt-room-password-hidden').parent().show();
            }
            else {
              $('#txt-room-password-hidden').parent().hide();
            }

            $(tr).find('.join-room').prop('disabled', false);
        });
    });
}

$('#btn-show-join-hidden-room').click(function(e) {
  e.preventDefault();
  
  $('#txt-room-password-hidden').parent().hide();
  $('#joinRoomModel').modal('show');
});

$('#btn-join-hidden-room').click(function() {
    var roomid = $('#txt-roomid-hidden').val().toString();
    if (!roomid || !roomid.replace(/ /g, '').length) {
        alertBox('Please enter room-id.', 'Room ID Is Required');
        return;
    }

    var fullName = $('#txt-user-name-hidden').val().toString();
    if (!fullName || !fullName.replace(/ /g, '').length) {
        alertBox('Please enter your name.', 'Your Name Is Required');
        return;
    }
    connection.extra.userFullName = fullName;
    
    // $$ 	
    connection.extra.todayProject_id = project_id;
    // $$ roomTitle = undefined
    var roomTitle = $('#txt-roomTitle-hidden').val().toString();
    connection.extra.todayRoomTitle = roomTitle;
    
    if($('#txt-room-password-hidden').parent().css('display') !== 'none') {
      var roomPassword = $('#txt-room-password-hidden').val().toString();
      if (!roomPassword || !roomPassword.replace(/ /g, '').length) {
          alertBox('Please enter room password.', 'Password Box Is Empty');
          return;
      }
      connection.password = roomPassword;

      connection.socket.emit('is-valid-password', connection.password, roomid, function(isValidPassword, roomid, error) {
        if(isValidPassword === true) {
          joinAHiddenRoom(roomid);
        }
        else {
          alertBox(error, 'Password Issue');
        }
      });
      return;
    }

    joinAHiddenRoom(roomid);
});

function joinAHiddenRoom(roomid) {
    var initialHTML = $('#btn-join-hidden-room').html();

    $('#btn-join-hidden-room').html('Please wait...').prop('disabled', true);

    connection.checkPresence(roomid, function(isRoomExist) {
        if (isRoomExist === false) {
            alertBox('No such room exist on this server. Room-id: ' + roomid, 'Room Not Found');
            $('#btn-join-hidden-room').html(initialHTML).prop('disabled', false);
            return;
        }

        connection.sessionid = roomid;
        connection.isInitiator = false;
        $('#joinRoomModel').modal('hide');
        openCanvasDesigner();

        $('#btn-join-hidden-room').html(initialHTML).prop('disabled', false);
    })
}

function openCanvasDesigner() {
    $('#startRoomModel').modal('hide');
    // *** canvas-designer 경로 
    var href = '/webapp/WEB-INF/views/meet/canvas-designer.html?open=' + connection.isInitiator + '&sessionid=' + connection.sessionid + '&publicRoomIdentifier=' + connection.publicRoomIdentifier+ '&todayRoomTitle=' + connection.extra.todayRoomTitle+ '&todayProject_id=' + connection.extra.todayProject_id + '&userFullName=' + connection.extra.userFullName;
   
    if(!!connection.password) {
      href += '&password=' + connection.password;
    }
    
//다음 페이지에 전달할 내용
    var newWin = window.open(href);
    if (!newWin || newWin.closed || typeof newWin.closed == 'undefined') {
        var html = '';
        html += '<p>Please click following link:</p>';
        html += '<p><a href="' + href + '" target="_blank">';
        if(connection.isInitiator) {
          html += 'Click To Open The Room';
        }
        else {
          html += 'Click To Join The Room';
        }
        html += '</a></p>';
        alertBox(html, 'Popups Are Blocked');
    }
}

//사용자 이름(접속 아이디로 조회) : 일회성적 한계 
function getFullName(userid) {
    var _userFullName = connection.extra.userFullName;
    if (connection.peers[userid] && connection.peers[userid].extra.userFullName) {
        _userFullName = connection.peers[userid].extra.userFullName;
    }
    return _userFullName;
}


function alertBox(message, title, specialMessage, callback) {
    callback = callback || function() {};

    $('.btn-alert-close').unbind('click').bind('click', function(e) {
        e.preventDefault();
        $('#alert-box').modal('hide');
        $('#confirm-box-topper').hide();

        callback();
    });

    $('#alert-title').html(title || 'Alert');
    $('#alert-special').html(specialMessage || '');
    $('#alert-message').html(message);
    $('#confirm-box-topper').show();

    $('#alert-box').modal({
        backdrop: 'static',
        keyboard: false
    });
}

function confirmBox(message, callback) {
    $('#btn-confirm-action').html('Confirm').unbind('click').bind('click', function(e) {
        e.preventDefault();
        $('#confirm-box').modal('hide');
        $('#confirm-box-topper').hide();
        callback(true);
    });

    $('#btn-confirm-close').html('Cancel');

    $('.btn-confirm-close').unbind('click').bind('click', function(e) {
        e.preventDefault();
        $('#confirm-box').modal('hide');
        $('#confirm-box-topper').hide();
        callback(false);
    });

    $('#confirm-message').html(message);
    $('#confirm-title').html('Please Confirm');
    $('#confirm-box-topper').show();

    $('#confirm-box').modal({
        backdrop: 'static',
        keyboard: false
    });
}

//회의 개설하기(팝업 띄우기) 버튼 클릭
$("#openPop").on("click", function(){
	$("#txt-user-name").val(member_name); //쿠키, 전역
});

//개설(실제 개설)
$('#btn-create-room').click(function() {
		    var roomid = $('#txt-roomid').val().toString();
		    if (!roomid || !roomid.replace(/ /g, '').length) {
		        alertBox('Please enter room-id.', 'Room ID Is Required');
		        return;
		    }
		    
		   var fullName = $('#txt-user-name').val().toString();
		   if (!fullName || !fullName.replace(/ /g, '').length) {
		        alertBox('Please enter your name.', 'Your Name Is Required');
		        return;
		    } 
		    connection.extra.userFullName = fullName;
		    
		    var roomTitle = $('#txt-roomTitle').val().toString();
		    if (!roomTitle || !roomTitle.replace(/ /g, '').length) {
		         alertBox('Please enter your roomTitle.', 'Your Name Is roomTitle');
		         return;
		     } 
		    connection.extra.todayRoomTitle = roomTitle;
		    
		    // $$$
		    connection.extra.todayProject_id = project_id;
		      
		    if($('#chk-room-password').prop('checked') === true){
		      var roomPassword = $('#txt-room-password').val().toString();
		      if (!roomPassword || !roomPassword.replace(/ /g, '').length) {
		          alertBox('Please enter room password.', 'Password Box Is Empty');
		          return;
		      }
		
		      connection.password = roomPassword;
		    }    
		
		    var initialHTML = $('#btn-create-room').html();
		
		    $('#btn-create-room').html('Please wait...').prop('disabled', true);
		
		    connection.checkPresence(roomid, function(isRoomExist) {
		        if (isRoomExist === true) {
		            alertBox('작성하신 방이름은 이미 등록되어 있는 이름입니다. 다른 이름을 입력해주세요', '이미 사용중인 방 이름이네요');
		            return;
		        }
		
		        // 유니크 방이름 publicRoomIdentifier 
		        if ($('#chk-hidden-room').prop('checked') === true) {
		            connection.publicRoomIdentifier = '';
		        }
		
		        connection.sessionid = roomid;
		        connection.isInitiator = true;
		        openCanvasDesigner();
		        $('#btn-create-room').html(initialHTML).prop('disabled', false);
		    });
		    
			// oracle 오라클 DB 회의 테이블에 저장  
		    var meetProjObj = {
		    		"project_id" : project_id, 	//프로젝트 id 
		    		"projectTitle" : project_title, 	//프로젝트제목
		    		"roomid" : roomid,	//회의제목 
		    		"roomTitle" : roomTitle, 	//방개요
		    		"member_name" : member_name,	//참가자이름 
		    		"member_mail" : member_mail	//참가자email  
		    };
		    
		    // json 만들기  to oracle
		   $.ajax({
			    url : 'https://127.0.0.1:8089/meetProjObj',
			    type : 'post',
			    data : meetProjObj,
			    success : function (data) {
			    	//console.log(JSON.stringify(meetProjObj));
			    },
			    error : function (err) {
			    	//console.log("node to oracle issue : 미팅목록");
			    }
			});	  
});

$('#chk-room-password').change(function() {
  $('#txt-room-password').parent().css('display', this.checked === true ? 'block' : 'none');
  $('#txt-room-password').focus();
});

var txtRoomId = document.getElementById('txt-roomid');

txtRoomId.onkeyup = txtRoomId.onblur = txtRoomId.oninput = txtRoomId.onpaste = function() {
    localStorage.setItem('canvas-designer-roomid', txtRoomId.value);
};

if (localStorage.getItem('canvas-designer-roomid')) {
    txtRoomId.value = localStorage.getItem('canvas-designer-roomid');
    $('#txt-roomid-hidden').val(txtRoomId.value);
}

var userFullName = document.getElementById('txt-user-name');

userFullName.onkeyup = userFullName.onblur = userFullName.oninput = userFullName.onpaste = function() {
    localStorage.setItem('canvas-designer-user-full-name', userFullName.value); 	//*** 회의실에서 사용할 수 있도록 set
};

if (localStorage.getItem('canvas-designer-user-full-name')) {
    userFullName.value = localStorage.getItem('canvas-designer-user-full-name');
    $('#txt-user-name-hidden').val(userFullName.value);
}

var todayRoomTitle = document.getElementById('txt-roomTitle');
todayRoomTitle.onkeyup = todayRoomTitle.onblur = todayRoomTitle.oninput = todayRoomTitle.onpaste = function() {
    localStorage.setItem('canvas-designer-roomTitle', todayRoomTitle.value); 
};

if (localStorage.getItem('canvas-designer-roomTitle')) {
	todayRoomTitle.value = localStorage.getItem('canvas-designer-roomTitle');
    $('#txt-roomTitle-hidden').val(todayRoomTitle.value);
};

//$$$
var todayProject_id = project_id;
todayProject_id.onkeyup = todayProject_id.onblur = todayProject_id.oninput = todayProject_id.onpaste = function() {
    localStorage.setItem('canvas-designer-project_id', todayProject_id.value); 
};

if (localStorage.getItem('canvas-designer-project_id')) {
	todayProject_id.value = localStorage.getItem('canvas-designer-project_id');
};

//***
connection.socketCustomEvent = 'custom-message';
var socket = connection.getSocket();
socket.emit(connection.socketCustomEvent, { test: "hihi" });


