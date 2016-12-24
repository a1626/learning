var curTime = new Date();
console.log(curTime);


var timeTest = function(){
	//var curTime = new Date();alternative. This also works

	curTime = new Date();
	console.log(curTime);	
};

setTimeout(timeTest , 5000);