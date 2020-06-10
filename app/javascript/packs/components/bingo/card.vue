<template>
  <div id="card">
    <div id="randomBox">
      <span></span>
    </div>
    aabb
  </div> 
</template>

<script>
import axios from "axios"

export default {
  data() {
    return {
      rands: [],
      cardNumber: [],
      min: 1,
      max: 75,
    }
  },
  methods: {
    savenumber(text) {
      axios.post('/groups', { groups: this.form }).then((res) => {
          this.$router.push({ path: res.data });
        }, (error) => {
          console.log(error);
      });
    },
    Start(){
      let h = true;
      let saveText = "";
      let number = null;
      while(h) {
        number = intRandom(this.min, this.max);
        
        if(this.rands.indexOf( number ) == -1) {
          this.rands.push(number);
          savenumber(this.rands.join(","));
          h = false;
        }
      }
    },
    intRandom(min, max){
      return Math.floor( Math.random() * (max - min + 1)) + min;
    },
  }
 
}

</script>


<style scoped lang="scss">

</style>