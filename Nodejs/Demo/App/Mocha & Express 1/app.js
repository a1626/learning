var express= require('express'),
	app=express();
app.get('/',function(req,resp){
	resp.send("hello");
	
})	
.listen(3000,function(){
	console.log('listening');
});