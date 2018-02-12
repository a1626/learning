<template>
  <div id="app">
    {{frstVal}}

    <button type="button" name="button" v-on:click="addExclamation">addExclamation</button>
  </div>
</template>

<script>

export default {
  name: 'app',
  computed: {
    frstVal: function() {
      return this.$store.state.frstVal
    }
  },
  methods: {
    addExclamation: function() {
      this.$store.commit('addExclamation');
      debugger;
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
