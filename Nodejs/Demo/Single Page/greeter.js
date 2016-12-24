/***
*To import the module open cmd
*type node
*in node rupple type following commands
*var g = require('./greeter')<path to >
*/

/**
*exports is a reference to module.exports
*you can attach props and func to it to export
*/


exports.greet=function(name){
	console.log('hello, '+name);
};