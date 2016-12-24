var express = require('express');
var app = express();

app.get('/:orderNo',function(req,resp){
	var ord = req.params.orderNo;
	console.log("Receive Order:",ord);
	placeOrder(ord)
	resp.send("Delieved");

}).listen(3000,function(){
	console.log("listening");
});	

function placeOrder(ordrNo){
	
	var date =  new Date();
	console.log("Placing Order:",ordrNo,"\n on:", date);
	
	getOrder(function(){
		date = new Date();
		console.log("Order no delievered:",ordrNo,"\n at",date);
	},ordrNo);//order num passed here is solely for if condition and not for the above use console.log
};


function getOrder(callback, ordrNo){
	
	if(ordrNo==2){
		setTimeout(callback,15000);
	}else{
		setTimeout(callback,5000);
	}
}