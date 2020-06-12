<template>
  <div id="group">
    <card></card>
  </div> 
</template>

<script>
import axios from "axios"
import Card from "./card.vue"

export default {
  components: {
    card: Card
  },
  methods: {
  }
 
}

</script>


<style scoped lang="scss">
  #group {
    height: 100%;
}

</style>