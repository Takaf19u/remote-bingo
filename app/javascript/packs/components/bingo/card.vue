<template>
  <div id="cardpage">
    <div class="card">
      <div class="card--top">
        <div id="randomBox">
          <div id="shutter">
            <div id="top-shutter"></div>
            <div id="bottom-shutter"></div>
          </div>
          <span id="numberbox"></span>
        </div>
        <div class="randbtn" @click="startrandom()"><span id="randbtn-text">Welcome!!</span></div>
      </div>
      <div id="mainContents">
          <div id="row1">
            <span id="0">{{ cardNumber[0] }}</span>
            <span id="1">{{ cardNumber[1] }}</span>
            <span id="3">{{ cardNumber[2] }}</span>
            <span id="4">{{ cardNumber[3] }}</span>
            <span id="5">{{ cardNumber[4] }}</span>
          </div>
          <div id="row2">
            <span id="6">{{ cardNumber[6] }}</span>
            <span id="7">{{ cardNumber[7] }}</span>
            <span id="8">{{ cardNumber[8] }}</span>
            <span id="9">{{ cardNumber[9] }}</span>
            <span id="10">{{ cardNumber[10] }}</span>
         </div>
          <div id="row3">
            <span id="11">{{ cardNumber[11] }}</span>
            <span id="12">{{ cardNumber[12] }}</span>
            <span id="13">START</span>
            <span id="14">{{ cardNumber[14] }}</span>
            <span id="15">{{ cardNumber[15] }}</span>
         </div>
          <div id="row4">
            <span id="16">{{ cardNumber[16] }}</span>
            <span id="17">{{ cardNumber[17] }}</span>
            <span id="18">{{ cardNumber[18] }}</span>
            <span id="19">{{ cardNumber[19] }}</span>
            <span id="20">{{ cardNumber[20] }}</span>
         </div>
          <div id="row5">
            <span id="21">{{ cardNumber[21] }}</span>
            <span id="22">{{ cardNumber[22] }}</span>
            <span id="23">{{ cardNumber[23] }}</span>
            <span id="24">{{ cardNumber[24] }}</span>
            <span id="25">{{ cardNumber[25] }}</span>
          </div>

      </div>
    </div>
  </div> 
</template>

<script>
import axios from "axios"

export default {
  data() {
    return {
      rands: [],
      cardNumber: [],
      numberbox: null,
      top_shutter: null,
      bottom_shutter: null,
      shutter: null,
      randbtn_text: null,
      min: 1,
      max: 75,
    }
  },
  created: function(){
    this.get_rands();
  },
  mounted: function(){
    this.numberbox = document.getElementById("numberbox");
    this.top_shutter = document.getElementById("top-shutter");
    this.bottom_shutter = document.getElementById("bottom-shutter");
    this.shutter = document.getElementById("shutter");
    this.randbtn_text = document.getElementById("randbtn-text");
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
    startrandom(){
      let h = true;
      let saveText = "";
      let number = null;
      // ナンバーをデータベースに保存
      while(h) {
        number = this.intRandom(this.min, this.max);
        // 配列に数字が含まれていない場合
        if(this.rands.indexOf( number ) == -1) {
          this.rands.push(number);
          this.save_rands(this.rands.join(","));
          this.randbtn_text.textContent = "Loading...";
          this.animate_shutterclose(number);
          h = false;
        };
      };
      
    },
    intRandom(min, max){
      return Math.floor( Math.random() * (max - min + 1)) + min;
    },
    // shutterを閉める
    animate_shutterclose(number){
      let speed = 300;
      let counter = 0;
      let per = Math.abs(0 - 50) / (speed / 10);
      let slideTimer = setInterval(function() {
        counter++;
        this.top_shutter.style.width = Math.abs(0 + per * counter) + '%';
        this.bottom_shutter.style.width = Math.abs(0 + per * counter) + '%';
        if(this.top_shutter.style.width == "55%") {
          clearInterval(slideTimer);
          this.shutter.className = "active";
          this.numberbox.textContent = number;
          setTimeout(this.animate_shutteropen, 2000);
        }
      }.bind(this), 10);
    },
    // shutterを開ける
    animate_shutteropen(){
      let speed = 300;
      let counter = 0;
      let per = Math.abs(0 - 50) / (speed / 10);
      let slideTimer = setInterval(function() {
        counter++;
        this.top_shutter.style.width = Math.abs(55 - per * counter) + '%';
        this.bottom_shutter.style.width = Math.abs(55 - per * counter) + '%';
        if(this.top_shutter.style.width == "0%") {
          clearInterval(slideTimer);
          this.shutter.className = "";
          this.randbtn_text.textContent = "Next Push";
        }
      }.bind(this), 10);
    },
  }
 
}

</script>


<style scoped lang="scss">
  #cardpage {
    height: 100%;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
  }
.card {
  background: red;
  width: 75vh;
  height: 90vh;
  &--top {
    position: relative;
    padding: 4% 0 7%;
    background: yellow;
    .randbtn {
      display: inline-block;
      position: absolute;
        bottom: -15px;
        left: 0;
        right: 0;
        margin: 0 auto;
      color: black;
      text-align: center;
      cursor: pointer;
      #randbtn-text {
        display: inline-block;
        padding: 5px 0;
        font-size: 3vh;
        line-height: 3vh;
        background: chartreuse;
        width: 20vh;
        border-radius: 10px;
      }
    }
  }
  #mainContents {
    & > div > span {
      color: black;
      background: white;
    }
  }
}

#randomBox {
  position: relative;
  width: 14vh;
  height: 14vh;
  border-radius: 100%;
  background: white;
  text-align: center;
  margin: 0 auto;
  &::before {
    content: "";
    position: absolute;
    top: -10px;
    left: -10px;
    right: -10px;
    bottom: -10px;
    border-top: solid 5px red;
    border-bottom: solid 5px red;
    border-radius: 100%;
    -webkit-animation: borderloading 2s linear infinite;
    animation: borderloading 2s linear infinite;
  }
  #numberbox {
    color: black;
    line-height: 14vh;
    font-size: 8vh;
  }
}

#shutter {
  position: absolute;
    top: 0px;
    left: 0px;
    right: 0px;
    bottom: 0px;
  border-radius: 100%;
  overflow: hidden;
  &.active {
    -webkit-animation: loading 1s linear;
    animation: loading 1s linear;
  }
  #top-shutter,#bottom-shutter {
    height: 110%;
    width: 0%;
    background: aqua;
    border: 1px solid gray;
  }
  #top-shutter {
  position: absolute;
    top: -5px;
    left: -5%;
  }
  #bottom-shutter {
  position: absolute;
    top: -5px;
    right: -5%;
  }
}


@-webkit-keyframes borderloading {
	0% {
		-webkit-transform: rotate(0deg);
		transform: rotate(0deg);
  }
	10% {
		-webkit-transform: rotate(-50deg);
		transform: rotate(-50deg);
	}
	50% {
		-webkit-transform: rotate(180deg);
		transform: rotate(180deg);
	}
	100% {
		-webkit-transform: rotate(360deg);
		transform: rotate(360deg);
	}
}

@-webkit-keyframes loading {
	0% {
		-webkit-transform: rotate(0deg);
		transform: rotate(0deg);
	}
	50% {
		-webkit-transform: rotate(180deg);
		transform: rotate(180deg);
	}
	100% {
		-webkit-transform: rotate(360deg);
		transform: rotate(360deg);
	}
}
</style>