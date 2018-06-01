var http = require('http');

var handleRequest = function(request, response) {
    console.log("Received requested for URL: " + request.url);
    response.writeHead(200)
    response.end("I love k8s and minikube");

};

var www = http.createServer(handleRequest);
www.listen(8080)
