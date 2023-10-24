'use strict';

const express = require('express');


// Constants
const PORT = process.env.PORT || "8080";
const HOST = process.env.HOST || "0.0.0.0";
const VERSION = process.env.VERSION || "0.0";

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello 1.0.7 VERSION de prueba ${VERSION} ');
});

app.listen(PORT, HOST);
console.log('Running on http://${HOST}:${PORT}');