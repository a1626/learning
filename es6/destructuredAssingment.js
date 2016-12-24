let [one,two]=[1,2];
let {three,four}={three:3,four:4};
// let {three,four}={3,4}; Throws error
let {a:five,b:six}={b:6,a:5};

console.log(one,two,three,four,five,six);
// console.log(a,b); Throws error