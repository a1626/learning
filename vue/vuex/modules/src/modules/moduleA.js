export default {
  state: {
    frstVal: 'hello'
  },
  mutations: {
    addExclamation: function(state) {
      state.frstVal += '!!';
    }
  }
}
