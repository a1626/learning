var http = require('test');
http.newServer(function(request,response){
	response.writeHead(200,{"content-Type":"plain/text"});
	response.end("Hello");
}).listen(3000);