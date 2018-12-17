

var keyCnt = 0;

function coEditorWrite() {
    var coEditor = this;
    coEditor.iframe = null;

    function syncData(data) {
        if (!coEditor.iframe) return;

        coEditor.postEditor({
        	coEditorWriteSyncData: data
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
                	coEditor.postEditor(response);
                    return;
                }

                captureStreamCallback(response.stream);
            });
            return;
        }

        if (!!event.data.coEditorWriteSyncData) {
        	coEditor.pointsLength = event.data.coEditorWriteSyncData.points.length;
            syncDataListener(event.data.coEditorWriteSyncData);
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

    coEditor.uid = getRandomString();

    coEditor.appendTo = function(parentNode, callback) {
        callback = callback || function() {};

        coEditor.iframe = document.createElement('iframe');
        
        // coEditor load callback
        coEditor.iframe.onload = function() {
            callback();
            callback = null;
        };

        coEditor.iframe.src = designer.widgetHtmlURL + '?widgetJsURL=' + coEditor.widgetJsURL + '&tools=' + JSON.stringify(tools) + '&selectedIcon=' + selectedIcon + '&icons=' + JSON.stringify(coEditor.icons);
        coEditor.iframe.style.width = '100%';
        coEditor.iframe.style.height = '100%';
        coEditor.iframe.style.border = 0;

        window.removeEventListener('message', onMessage);
        window.addEventListener('message', onMessage, false);

        parentNode.appendChild(coEditor.iframe);
    };

    coEditor.destroy = function() {
        if (coEditor.iframe) {
        	coEditor.iframe.parentNode.removeChild(coEditor.iframe);
        	coEditor.iframe = null;
        }
        window.removeEventListener('message', onMessage);
    };

    coEditor.addSyncListener = function(callback) {
        syncDataListener = callback;
    };

    coEditor.syncData = syncData;

    coEditor.setTools = function(_tools) {
        tools = _tools;
    };

    coEditor.setSelected = function(icon) {
        if (typeof tools[icon] !== 'undefined') {
            selectedIcon = icon;
        }
    };

    coEditor.toDataURL = function(format, callback) {
        dataURLListener = callback;

        if (!coEditor.iframe) return;
        coEditor.postMessage({
            genDataURL: true,
            format: format
        });
    };

    coEditor.sync = function() {
        if (!coEditor.iframe) return;
        coEditor.postMessage({
            syncPoints: true
        });
    };

    coEditor.pointsLength = 0;

    coEditor.undo = function(index) {
        if (!coEditor.iframe) return;

        coEditor.postMessage({
            undo: true,
            index: index || coEditor.pointsLength - 1 || -1
        });
    };

    coEditor.postMessage = function(message) {
        if (!coEditor.iframe) return;

        message.uid = coEditor.uid;
        coEditor.iframe.contentWindow.postMessage(message, '*');
    };

    coEditor.captureStream = function(callback) {
        if (!coEditor.iframe) return;

        captureStreamCallback = callback;
        coEditor.postMessage({
            captureStream: true
        });
    };

}
