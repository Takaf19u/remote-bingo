<template>
  <div id="card">
    <div id="randomBox">
      <span></span>
    </div>
    <div @click="start()">test</div>
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
  created: function(){
    this.get_rands();
  },
  methods: {
    // グループですでに表示済みの数字を取得
    get_rands() {
      axios.get(`/groups/${this.$route.params['id']}/rands`, {}).then((res) => {
        if (res.data !== null && res.data !== ""){
          let target = res.data.split(',');
          this.rands = target.slice();
        };

        }, (error) => {
          console.log(error);
      });
    },
    // グループの表示済み数字リストを更新
    save_rands(text) {
      axios.patch(`/groups/${this.$route.params['id']}`, { rands: text }).then((res) => {
          console.log(this.rands);
        }, (error) => {
          console.log(error);
      });
    },
    start(){
      let h = true;
      let saveText = "";
      let number = null;
      while(h) {
        number = this.intRandom(this.min, this.max);
        // 配列に数字が含まれていない場合
        if(this.rands.indexOf( number ) == -1) {
          this.rands.push(number);
          this.save_rands(this.rands.join(","));
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