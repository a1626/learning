function varInsideFor(){
	for(var i=0;i<1;i++){
		console.log("inside for loop");
	}
	console.log('Value of i is',i)
};

function letInsideFor(){
	for(let il=0;il<1;il++){
		console.log("inside for loop");
	}
	console.log('Value of il is',il)
};

console.log("hi");
varInsideFor();
letInsideFor();