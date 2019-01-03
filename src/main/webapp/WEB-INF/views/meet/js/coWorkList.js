

var workListBtnCnt=0;
var othersWorkListBtnCnt;

function coWorkListLoader() {
    var coWorkList = this;
    coWorkList.iframe = null;

    function syncData(data) {
        if (!coWorkList.iframe) return;

        //***
        coWorkList.postEditor({
        	coWorkListWriteSyncData: data
        });
    }

    var syncDataListener = function(data) {};
    var dataURLListener = function(dataURL) {};
    var captureStreamCallback = function() {};

    function onMessage(event) {
        if (!event.data || event.data.uid !== designer.uid) return;

        if(!!event.data.sdp) {
            webrtcHandler.createAnswer(event.data, function(response) {
                if(response.sdp) {
                	coWorkList.postEditor(response);
                    return;
                }

                captureStreamCallback(response.stream);
            });
            return;
        }

        if (!!event.data.coWorkListWriteSyncData) {
        	coWorkList.pointsLength = event.data.coWorkListWriteSyncData.points.length;
            syncDataListener(event.data.coWorkListWriteSyncData);
            return;
        }

        if (!!event.data.dataURL) {
            dataURLListener(event.data.dataURL);
            return;
        }
    }

    function getRandomString() {
        if (window.crypto && window.crypto.getRandomValues && navigator.userAgent.indexOf('Safari') === -1) {
            var a = window.crypto.getRandomValues(new Uint32Array(3)),
                token = '';
            for (var i = 0, l = a.length; i < l; i++) {
                token += a[i].toString(36);
            }
            return token;
        } else {
            return (Math.random() * new Date().getTime()).toString(36).replace(/\./g, '');
        }
    }

    coWorkList.uid = getRandomString();

    coWorkList.appendTo = function(parentNode, callback) {
        callback = callback || function() {};

        coWorkList.iframe = document.createElement('iframe');
        
        // coWorkList load callback
        coWorkList.iframe.onload = function() {
            callback();
            callback = null;
        };

        coWorkList.iframe.src = designer.widgetHtmlURL + '?widgetJsURL=' + coWorkList.widgetJsURL + '&tools=' + JSON.stringify(tools) + '&selectedIcon=' + selectedIcon + '&icons=' + JSON.stringify(coWorkList.icons);
        coWorkList.iframe.style.width = '100%';
        coWorkList.iframe.style.height = '100%';
        coWorkList.iframe.style.border = 0;

        window.removeEventListener('message', onMessage);
        window.addEventListener('message', onMessage, false);

        parentNode.appendChild(coWorkList.iframe);
    };

    coWorkList.destroy = function() {
        if (coWorkList.iframe) {
        	coWorkList.iframe.parentNode.removeChild(coWorkList.iframe);
        	coWorkList.iframe = null;
        }
        window.removeEventListener('message', onMessage);
    };

    coWorkList.addSyncListener = function(callback) {
        syncDataListener = callback;
    };

    coWorkList.syncData = syncData;

    coWorkList.setTools = function(_tools) {
        tools = _tools;
    };

    coWorkList.setSelected = function(icon) {
        if (typeof tools[icon] !== 'undefined') {
            selectedIcon = icon;
        }
    };

    coWorkList.toDataURL = function(format, callback) {
        dataURLListener = callback;

        if (!coWorkList.iframe) return;
        coWorkList.postMessage({
            genDataURL: true,
            format: format
        });
    };

    coWorkList.sync = function() {
        if (!coWorkList.iframe) return;
        coWorkList.postMessage({
            syncPoints: true
        });
    };

    coWorkList.pointsLength = 0;

    coWorkList.undo = function(index) {
        if (!coWorkList.iframe) return;

        coWorkList.postMessage({
            undo: true,
            index: index || coWorkList.pointsLength - 1 || -1
        });
    };

    coWorkList.postMessage = function(message) {
        if (!coWorkList.iframe) return;

        message.uid = coWorkList.uid;
        coWorkList.iframe.contentWindow.postMessage(message, '*');
    };

    coWorkList.captureStream = function(callback) {
        if (!coWorkList.iframe) return;

        captureStreamCallback = callback;
        coWorkList.postMessage({
            captureStream: true
        });
    };

}
