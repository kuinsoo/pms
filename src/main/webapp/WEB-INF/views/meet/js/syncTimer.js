
function syncTimerWrite() {
    var syncTimer = this;
    syncTimer.iframe = null;

    function syncData(data) {
        if (!syncTimer.iframe) return;

        syncTimer.postEditor({
        	syncTimerWriteSyncData: data
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
                	syncTimer.postEditor(response);
                    return;
                }

                captureStreamCallback(response.stream);
            });
            return;
        }

        if (!!event.data.syncTimerWriteSyncData) {
        	syncTimer.pointsLength = event.data.syncTimerWriteSyncData.points.length;
            syncDataListener(event.data.syncTimerWriteSyncData);
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

    syncTimer.uid = getRandomString();

    syncTimer.appendTo = function(parentNode, callback) {
        callback = callback || function() {};

        syncTimer.iframe = document.createElement('iframe');
        
        // syncTimer load callback
        syncTimer.iframe.onload = function() {
            callback();
            callback = null;
        };

        syncTimer.iframe.src = designer.widgetHtmlURL + '?widgetJsURL=' + syncTimer.widgetJsURL + '&tools=' + JSON.stringify(tools) + '&selectedIcon=' + selectedIcon + '&icons=' + JSON.stringify(syncTimer.icons);
        syncTimer.iframe.style.width = '100%';
        syncTimer.iframe.style.height = '100%';
        syncTimer.iframe.style.border = 0;

        window.removeEventListener('message', onMessage);
        window.addEventListener('message', onMessage, false);

        parentNode.appendChild(syncTimer.iframe);
    };

    syncTimer.destroy = function() {
        if (syncTimer.iframe) {
        	syncTimer.iframe.parentNode.removeChild(syncTimer.iframe);
        	syncTimer.iframe = null;
        }
        window.removeEventListener('message', onMessage);
    };

    syncTimer.addSyncListener = function(callback) {
        syncDataListener = callback;
    };

    syncTimer.syncData = syncData;

    syncTimer.setTools = function(_tools) {
        tools = _tools;
    };

    syncTimer.setSelected = function(icon) {
        if (typeof tools[icon] !== 'undefined') {
            selectedIcon = icon;
        }
    };

    syncTimer.toDataURL = function(format, callback) {
        dataURLListener = callback;

        if (!syncTimer.iframe) return;
        syncTimer.postMessage({
            genDataURL: true,
            format: format
        });
    };

    syncTimer.sync = function() {
        if (!syncTimer.iframe) return;
        syncTimer.postMessage({
            syncPoints: true
        });
    };

    syncTimer.pointsLength = 0;

    syncTimer.undo = function(index) {
        if (!syncTimer.iframe) return;

        syncTimer.postMessage({
            undo: true,
            index: index || syncTimer.pointsLength - 1 || -1
        });
    };

    syncTimer.postMessage = function(message) {
        if (!syncTimer.iframe) return;

        message.uid = syncTimer.uid;
        syncTimer.iframe.contentWindow.postMessage(message, '*');
    };

    syncTimer.captureStream = function(callback) {
        if (!syncTimer.iframe) return;

        captureStreamCallback = callback;
        syncTimer.postMessage({
            captureStream: true
        });
    };

}
