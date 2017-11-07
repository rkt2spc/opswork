const http = require('http');
const express = require('express');
const morgan = require('morgan');
const bodyParser = require('body-parser');

// Router
const router = express.Router();
router.get('/ping', (req, res, next) => res.status(200).end('pong'));
router.get('/env', (req, res, next) => res.status(200).json(process.env));

// Express App
const app = express();
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(router);
app.use((err, req, res, next) => res.status(500).json(err));

// Server
const PORT = process.env.PORT || 1337;
const server = http.createServer(app);
server.listen(PORT, () => console.log('Server is listening on port', PORT));
