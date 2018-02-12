## How to Run

- Install `vue-cli` using

```
npm install -g @vue/cli
```

- Run command `npm i` to install all the dependencies.

- To run the server use command

```
vue serve src/main.js
```


## Learnings

- `state` objects of `modules` do not get mixed i.e.

```
modA {
  state: {
    val
  }
}  

modB {
  state: {
    val
  }
}  


new Vuex.Store({
  state: {
    val
  }
});
```
have to be accessed using `store.state.modA.val`, `store.state.modB.val`, `store.state.val` respectively and they will not overwrite each other.

- For `mutations` having same name will trigger all the mutations as `vuex` stores them as array of function

```
modA {
  mutations: {
    func
  }
}  

modB {
  mutations: {
    func
  }
}  


new Vuex.Store({
  mutations: {
    func
  }
});
```

is stored in `store` as  
```
{
  _mutations: {
    func: [f,f,f] //array of functions
  }
}
```

- This most probably will hold true for `getters` and `actions` also.
