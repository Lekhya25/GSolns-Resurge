const express = require('express');
const http = require('http');
const socketIo = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

// Socket.io logic
io.on('connection', (socket) => {
    console.log('A user connected');
    // Handle events like 'message', 'disconnect', etc.
});

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
