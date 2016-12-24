//original function
//var a = function(b,c){
//	return b+c
//}

//es6 implementation
var a = (b,c) => {return b+c}

//or
var x = (b,c) =>  b+c //return not required if no braces


var y = b => b+1 //in case of 1 parameter no need for sqare brackets also



//lexical scope: Lexical (AKA static) scoping refers to determining a variable's scope based solely on its position within the textual corpus of code. A variable always refers to its top-level environment. It's good to understand it in relation to dynamic scope.(http://stackoverflow.com/questions/1047454/what-is-lexical-scope)

var z={
	name:"hi",
		
	funcCall: function(msg,cb){
		cb(msg);
	},

	calling: function(){
		this.funcCall("john",msg => console.log(this.name,msg)) //no need to bind this. Even in callback this refers to parent.
	}
};

z.calling();