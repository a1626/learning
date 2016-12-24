// const don't have constant value but constant reference. This is illustrated by object example
// const also follows block scope

const a = "hi";

//a="bye";

console.log("a",a);

const b ={};

b.a="hi";

//b = "bye";

console.log("b",b);