// With fuction
function SingletonFuncClass() {
  let instance = Function.prototype.instance;
  if(instance) return instance;

  Function.prototype.instance = this;
  
  this.test = 1;
}
// Issue with this approach: If you try and initialize the instance without `new` it'll return undefined and this will be initialized to window object, as js only create new object when you use `new` keyword.

// with function 2
const SingletonFunc = (function SingletonFunc () {
  let instance;
  const getInstance = () => {
    if(instance) return instance;
    instance = Object.create(SingletonFunc.prototype);
    instance.test = 1;
    return instance;
  };
  return {getInstance};
})();

// with class
class SingletonClass {
  constructor() {
    const instance = this.constructor.instance;
    if(instance) return instance;
    this.constructor.instance = this;
  }
}
