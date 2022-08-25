<template>
  <div id="container">
    <Header :signedIn="signedIn" :userType="userType"></Header>
    <router-view></router-view>
  </div>
</template>

<script>
  import Header from './Header.vue'
  import Categories from './Categories.vue'

  export default {
    props: ['signedIn', 'userType'],
    data: function () {
      return {
      }
    },
    components: {
      Header,
      Categories
    }
  }
</script>

<style>
</style>