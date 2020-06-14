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
      </div>
      <div @click="judge_bingo"> aa</div>
      <div class="randbtn" @click="startrandom()"><span id="randbtn-text">Welcome!!</span></div>
      <div id="mainContents">
          <div id="row1">
            <span id="0" v-bind:class="{ 'active': activeNums[0] }">{{ cardNumber[0] }}</span>
            <span id="1" v-bind:class="{ 'active': activeNums[1] }">{{ cardNumber[1] }}</span>
            <span id="2" v-bind:class="{ 'active': activeNums[2] }">{{ cardNumber[2] }}</span>
            <span id="3" v-bind:class="{ 'active': activeNums[3] }">{{ cardNumber[3] }}</span>
            <span id="4" v-bind:class="{ 'active': activeNums[4] }">{{ cardNumber[4] }}</span>
          </div>
          <div id="row2">
            <span id="5" v-bind:class="{ 'active': activeNums[5] }">{{ cardNumber[5] }}</span>
            <span id="6" v-bind:class="{ 'active': activeNums[6] }">{{ cardNumber[6] }}</span>
            <span id="7" v-bind:class="{ 'active': activeNums[7] }">{{ cardNumber[7] }}</span>
            <span id="8" v-bind:class="{ 'active': activeNums[8] }">{{ cardNumber[8] }}</span>
            <span id="9" v-bind:class="{ 'active': activeNums[9] }">{{ cardNumber[9] }}</span>
         </div>
          <div id="row3">
            <span id="10" v-bind:class="{ 'active': activeNums[10] }">{{ cardNumber[10] }}</span>
            <span id="11" v-bind:class="{ 'active': activeNums[11] }">{{ cardNumber[11] }}</span>
            <span id="12" v-bind:class="{ 'active': activeNums[12] }" class="startbtn" @click="strtbtn">
              <div v-if="gameStart"><p>Game</p><p>START</p></div>
              <div v-else><p class="sanka">参加中</p></div>
            </span>
            <span id="13" v-bind:class="{ 'active': activeNums[13] }">{{ cardNumber[13] }}</span>
            <span id="14" v-bind:class="{ 'active': activeNums[14] }">{{ cardNumber[14] }}</span>
         </div>
          <div id="row4">
            <span id="15" v-bind:class="{ 'active': activeNums[15] }">{{ cardNumber[15] }}</span>
            <span id="16" v-bind:class="{ 'active': activeNums[16] }">{{ cardNumber[16] }}</span>
            <span id="17" v-bind:class="{ 'active': activeNums[17] }">{{ cardNumber[17] }}</span>
            <span id="18" v-bind:class="{ 'active': activeNums[18] }">{{ cardNumber[18] }}</span>
            <span id="19" v-bind:class="{ 'active': activeNums[19] }">{{ cardNumber[19] }}</span>
         </div>
          <div id="row5">
            <span id="20" v-bind:class="{ 'active': activeNums[20] }">{{ cardNumber[20] }}</span>
            <span id="21" v-bind:class="{ 'active': activeNums[21] }">{{ cardNumber[21] }}</span>
            <span id="22" v-bind:class="{ 'active': activeNums[22] }">{{ cardNumber[22] }}</span>
            <span id="23" v-bind:class="{ 'active': activeNums[23] }">{{ cardNumber[23] }}</span>
            <span id="24" v-bind:class="{ 'active': activeNums[24] }">{{ cardNumber[24] }}</span>
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
      rescard: Object,
      masterId: null,
      gameStart: true,
      rands: [],
      cardNumber: [],
      card: {
        rand_number: null,
        group_id: null,
      },
      activeNums: [],
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
    this.get_cards();
  },
  mounted: function(){
    this.numberbox = document.getElementById("numberbox");
    this.top_shutter = document.getElementById("top-shutter");
    this.bottom_shutter = document.getElementById("bottom-shutter");
    this.shutter = document.getElementById("shutter");
    this.randbtn_text = document.getElementById("randbtn-text");
  },
  watch: {
    gameStart: function () {
      if(this.gameStart === false){
        this.set_activeNums();
      };
    }
  },
  methods: {
    // 全てのナンバーに対し確認処理(create時呼び出し)
    set_activeNums() {
      const rands = this.cardNumber.map(function(value) {
        if(this.rands.indexOf( value ) == -1) {
          return false;
        } else {
           return true;
        };
      }.bind(this));
      this.activeNums = rands.slice();
    },
    // すでに表示した数字と一致しているか判定
    set_active(num) {
      if(this.rands.indexOf( num ) == -1) {
        return false;
      } else {
        return true;
      };
    },
    // カードの数値を取得（なければ新規作成)
    get_cards() {
      axios.get(`/cards/${this.$route.params['id']}`, {}).then((res) => {
          let target = "";
          this.rescard = res.data.card;
          let res_number = res.data.card;
          if (res_number == null){
            this.createCard();
          } else {
            let target = res_number.rand_number.split(',');
            this.cardNumber = target.slice();
            this.gameStart_judge(this.cardNumber[12]);
          };
        }, (error) => {
          console.log(error);
      });
    },
    // カードを作成
    createCard() {
      this.card.group_id = this.$route.params['id'];
      this.card.rand_number = this.cardRandom();
      axios.post('/cards', { cards: this.card }).then((res) => {
          let target = this.card.rand_number.split(',');
          this.cardNumber = target.slice();
          this.gameStart_judge(this.cardNumber[12]);
        }, (error) => {
          alert("カードの作成に失敗しました");
          return false;
      });
    },
    gameStart_judge(target) {
      if(target == "S") {
        this.gameStart = false;
      } else {
        this.gameStart = true;
      };
    },
    // グループですでに表示済みの数字を取得
    get_rands() {
      axios.get(`/groups/${this.$route.params['id']}/rands`, {}).then((res) => {
        let rands = res.data.rands;
        this.masterId = res.data.user_id;
        if (rands !== null || rands !== ""){
          let target = rands.split(',');
          this.rands = target.slice();
        };
        }, (error) => {
          console.log(error);
      });
    },
    // スタートボタンの処理
    strtbtn(){
      if(this.cardNumber[12] != "S") {
        this.cardNumber[12] = "S";
        this.save_cards(this.cardNumber.join(","));
      };
    },
    // グループの表示済み数字リストを更新
    save_rands(text) {
      axios.patch(`/groups/${this.$route.params['id']}`, { rands: text }).then((res) => {
        }, (error) => {
          console.log(error);
      });
    },
    // グループの表示済み数字リストを更新
    save_cards(text) {
      axios.patch(`/cards/${this.rescard.id}`, { rand_number: text }).then((res) => {
          this.gameStart = false;
        }, (error) => {
          console.log(error);
      });
    },
    cardRandom(){
      let rands = [];
      while( rands.length < 26 ) {
        if(rands.length == 12) {
          rands.push("");
        } else {
          let num = Math.floor( Math.random() * (75 - 1 + 1)) + 1;
          if(rands.indexOf( num ) == -1) {
            rands.push(num);
          };
        };
      };
      return rands.join(",");
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
    judge_bingo() {
      let row = document.getElementById("row" + 1);
      let active = row.getElementsByClassName("active");
      debugger
      // 行のビンゴ判定
      if(active.length == 5){
        alert("BINGO!!");
      }
      // const retVal = elms.every(elm => {
      //   return (elm > 20);
      // });
    }
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
  font-family: 'Righteous', cursive;
  background: red;
  width: 75vh;
  height: 90vh;
  margin: 0 5px;
  &--top {
    position: relative;
    padding: 5% 0;
    background: yellow;
    height: 24%;
  }
  & .randbtn {
      display: inline-block;
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
  #mainContents {
    background: green;
    height: calc(100% - 25%);
    padding: 3vh;
    & > div {
      cursor: pointer;
      display: flex;
      justify-content: space-between;
      text-align: center;
      background: white;
      height: calc(100% / 5);
      width: 100%;
      & > span {
        font-size: 5vh;
        padding-top: 3vh;
        color: black;
        width: calc(100% / 5);
        border: 1px solid black;
      }
      & .active {
        background: yellow;
      }
      .startbtn {
        font-size: 4vh;
        color: indianred;
        -webkit-animation: startbtn 1s linear infinite;
        animation: startbtn 1s linear infinite;
        & .sanka {
          padding-top: 15%;
          font-weight: 700;
          margin: 0 auto;
        }
      }
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

@-webkit-keyframes startbtn {
	0% {
    padding-top: 1.5vh;
  }
	50% {
    padding-top: 1vh;
	}
	100% {
    padding-top: 1.5vh;
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