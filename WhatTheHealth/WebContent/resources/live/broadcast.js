/*global socket, video, config*/
const peerConnections = {};

/** @type {MediaStreamConstraints} */
const constraints = {
	// audio: true,
	video: {facingMode: "user"}
};

const config = { // eslint-disable-line no-unused-vars
		  'iceServers': [{
		    'urls': ['stun:stun.l.google.com:19302']
		  }]
		};

		const socket = io.connect(window.location.origin);
		const video = document.querySelector('video'); // eslint-disable-line no-unused-vars

		window.onunload = window.onbeforeunload = function() {
			socket.close();
		};


navigator.mediaDevices.getUserMedia(constraints)
.then(function(stream) {
	video.srcObject = stream;
	socket.emit('broadcaster');
}).catch(error => console.error(error));

socket.on('answer', function(id, description) {
	peerConnections[id].setRemoteDescription(description);
});

socket.on('watcher', function(id) {
	const peerConnection = new RTCPeerConnection(config);
	peerConnections[id] = peerConnection;
	peerConnection.addStream(video.srcObject);
	peerConnection.createOffer()
	.then(sdp => peerConnection.setLocalDescription(sdp))
	.then(function () {
		socket.emit('offer', id, peerConnection.localDescription);
	});
	peerConnection.onicecandidate = function(event) {
		if (event.candidate) {
			socket.emit('candidate', id, event.candidate);
		}
	};
});

socket.on('candidate', function(id, candidate) {
	peerConnections[id].addIceCandidate(new RTCIceCandidate(candidate));
});

socket.on('bye', function(id) {
	peerConnections[id] && peerConnections[id].close();
	delete peerConnections[id];
});