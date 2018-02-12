export default {
  state: {
    frstVal: 'world'
  },
  mutations: {
    addExclamation: function(state) {
      state.frstVal += '!!!';
    }
  }
}
