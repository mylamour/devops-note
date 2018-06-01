var http = require('http');

var handleRequest = function(request, response) {
    console.log("Received requested for URL: " + request.url);
    response.writeHead(200)
    response.end("I love minikube");

};

var www = http.createServer(handleRequest);
www.listen(8080)
