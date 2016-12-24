let a = [1,2,3];

console.log("a",a);
console.log("spredded a",...a);

let b = [4,5];

b.push(a);
console.log("b",b);
b.push(...a);
console.log("new b",b);

function sum(a,b,c){
	console.log(a + b + c);
};

sum(...a);