<template>
    <div id="toppage">
      <div id="topItems">
        <div id="logobox">
          <div class="logo">
            <b class="logotitle1">remo<span id="logo1">t</span>e</b>
            <b class="logotitle2"><span>B</span>I<span>N</span>GO</b>
          </div>
          <span id="topbtn" @click="checkTopBtn">CLICK HERE</span>
        </div>
      </div>
      <div id="mainItems">
        <div class="mainbtns">
          <router-link to="/createGroup" class="mainItems__btn mainbtn1">
            <div class="text text1">
              <p>Create</p>
              <p>Group</p>
            </div>
          </router-link>
          <router-link to="#" class="mainItems__btn mainbtn2">
            <div class="text text2">
              <p>Join</p>
              <p>Group</p>
            </div>
          </router-link>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  data: function () {
    return {
    }
  },
  methods: {
    checkTopBtn() {
      let topbtn = document.getElementById('topbtn');
      let topItems = document.getElementById('topItems');

      this.fadeOut(topbtn, 500);
      this.slide_up_init(topItems);

    },
    fadeOut(target, myTime){
      var begin = new Date() - 0;
      target.style.opacity = 1;
      // フェードアウト
      var set = setInterval(function() {
        var current = new Date() - begin;
        if (target.style.opacity <= 0) {
          clearInterval(set);
          target.remove();
        }
        target.style.opacity -= 0.7 * (current / myTime);
      }.bind(this), 10);
    },
    slide_up_init(target) {
        var bh = 100;
        this.slide(target, bh, 0, 700);
    },
    slide(element, start, end, speed) {
        var counter = 0;
        let height = start/2 + "px";
        var per = Math.abs(end - 50) / (speed / 10);
        var slideTimer = setInterval(function() {
            counter++;
            element.style.height = Math.abs(100 - per * counter) + '%';
            if(element.style.height <= "50%") {
                clearInterval(slideTimer);
            }
        }, 10);
    }
  }
}
</script>


<style scoped>
  @import url(//fonts.googleapis.com/css?family=Vibur);

  #toppage {
    height: 100vh;
    width: 100%;
    position: relative;
  }
  #topItems {
    display: flex;
    align-items: center;
    position: absolute;
    top: 0;
    bottom: 0;
     right: 0;
     left: 0;
    margin: auto;
    height: 100%;
    width: 100%;
    background-image: url("/assets/Brick-background.jpg");
    background-size: auto;
    position: relative;
    z-index: 1;
}

  #topItems::before {
  content: "";
  position: absolute;
   top: 0;
   bottom: 0;
   right: 0;
   left: 0;
  height: 100%;
  width: 100%;
  background: rgba(22, 22, 22, 0.537);
  background-image: -webkit-radial-gradient(rgba(218, 214, 214, 0.253),(82, 81, 81), rgba(14, 13, 13, 0.651));
  background-image: radial-gradient(rgba(218, 214, 214, 0.253), rgba(12, 11, 11, 0.651));
}

  #logobox {
    text-align: center;
    user-select: none;
    margin: 10px auto;
    position: relative;
    width: 400px;
    z-index: 2;
  }
  
  .logo {
    position: relative;
    padding: 10px 20px;
  }
  .logo::after {
    content: "";
    position: absolute;
     top: 0;
     bottom: 0;
     right: 0;
     left: 0;
    height: 100%;
    width: 100%;

    color: rgba(8, 221, 221, 0.6);
    border: 2px solid rgba(8, 221, 221, 0.6);
    border-radius: 4px;
    background-color: transparent;
    box-shadow: 0px 0px 5px 5px rgba(8, 221, 221, 0.6);
    animation: flickering 5s infinite;
  }



  .logo b{
    color: rgba(8, 221, 221, 0.6);
    text-shadow: 0 -40px 100px, 0 0 2px, 0 0 1em rgba(8, 221, 221, 0.6), 0 0 0.5em rgba(8, 221, 221, 0.6), 0 0 0.1em rgba(8, 221, 221, 0.6), 0 10px 3px #000;
    display: block;
    line-height: 1;
    margin: 10px;
  }

  .logotitle1 {
    font: 400 12vh "Vibur";
  }

.logotitle2 {
    font: 400 18vh "Vibur";
}

  #logo1{
    animation: blink linear infinite 2s;
  }

  .logotitle2 span:nth-child(1) {
    animation: blink2 linear infinite 3s;
}
  .logotitle2 span:nth-child(2) {
    animation: blink2 linear infinite 3.5s;
}

  #topbtn {
    display: inline-block;
    font-family: 'Chelsea Market', cursive;
    position: absolute;
      bottom: -40%;
      left: 0;
      right: 0;
      margin: 0 auto;
    padding: 10px 30px;
    border-radius:  20px;
    width: 70%;
    font-size: 2em;
    color: white;
    cursor: pointer;
    box-shadow: 0px 0px 2px 3px rgba(238, 130, 238, 0.534);
    background: linear-gradient(130deg, #ffdb2c, rgb(248, 146, 112) 25%, rgba(248, 8, 188, 0.719) 50%) no-repeat;
  }

  #topbtn:hover {
    box-shadow: 0px 0px 5px 5px rgba(255, 255, 0, 0.507);
  }


  x-sign {
    --interval: 1s;
    display: block;
    text-shadow: 
      0 0 10px var(--color1),
      0 0 20px var(--color2),
      0 0 40px var(--color3),
      0 0 80px var(--color4);
    will-change: filter, color;
    filter: saturate(60%);
    animation: flicker steps(100) var(--interval) 1s infinite;
  }

  x-sign:nth-of-type(1) {
    color: yellow;
    --color1: yellow;
    --color2: lime;
    --color3: green;
    --color4: darkgreen;
    font-family: Monoton;
    font-weight: 700;
  }

  #mainItems {
    position: absolute;
    bottom: 0;
    height: 50%;
    width: 100%;
    box-shadow: 0 8px 8px -3px gray inset;
    align-items: center;
    padding: 20px;
  }

  .mainbtns {
    display: flex;
    justify-content: space-between;
    max-width: 1000px;
    margin: 0 auto;


  }

  .mainItems__btn {
    cursor: pointer;
    font-family: 'Monoton', cursive;
    font-size: 4em;
    font-weight: 700;
    text-decoration: none;
    display: flex;
    align-items: center;
    -webkit-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
    text-align: center;
    padding: 5px;
    width: 50%;
    min-width: 300px;
    min-height: 300px;
    margin: 10px;
    height: 100%;
    box-shadow: inset 0px 0px  30px 5px rgb(187, 184, 184);
    position: relative;
  }
    .mainItems__btn::after {
      content: "";
    position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
    border: double 10px #FF1177;
    box-shadow: 0px 0px  10px 3px rgb(143, 143, 143);
    width: 100%;
    height: 100%;
  }

  .text {
    margin: 0 auto;
  }

  .text1 {
    color: rgb(241, 187, 8);
  }
  .text2 {
    color: rgb(115, 184, 12);
  }

  .text > p{
    text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #fff, 0 0 20px #FF1177, 0 0 35px #FF1177;
  }

  .mainItems__btn:hover > .text p {
    text-shadow: none;
    -webkit-animation: none;
    -moz-animation: none;
    animation: none;
  }


/* ロゴの処理 */
  @keyframes flicker {
    50% {
      color: white;
      filter: saturate(200%) hue-rotate(20deg);
    }
  }

  @keyframes blink {
    78% {
      color: inherit;
      text-shadow: inherit;
    }
    79%{
      color: #333;
    }
    80% {
      
      text-shadow: none;
    }
    81% {
      color: inherit;
      text-shadow: inherit;
    }
    82% {
      color: #333;
      text-shadow: none;
    }
    83% {
      color: inherit;
      text-shadow: inherit;
    }
    92% {
      color: #333;
      text-shadow: none;
    }
    92.5% {
      color: inherit;
      text-shadow: inherit;
    }
  }
  
  @keyframes blink2 {
    78% {
      color: inherit;
      text-shadow: inherit;
    }
    79%{
      color: rgb(222, 226, 4);
    }
    80% {
      
      text-shadow: none;
    }
    81% {
      color: inherit;
      text-shadow: inherit;
    }
    82% {
      color: rgb(10, 135, 252);
      text-shadow: none;
    }
    83% {
      color: inherit;
      text-shadow: inherit;
    }
    92% {
      color: rgba(241, 10, 222, 0.5);
      text-shadow: none;
    }
    92.5% {
      color: inherit;
      text-shadow: inherit;
    }
  }

  @keyframes flickering {
    0% {
      border-color: transparent;
      opacity: 0.2;
    }
    
    2% {
    color: rgba(8, 221, 221, 0.6);
      opacity: 1;
    }
    
    4% {
      border-color: transparent;
      opacity: 0.2;
    }
    
    8% {
    color: rgba(8, 221, 221, 0.6);
      opacity: 1;
    }
    
    28% {
    color: rgba(8, 221, 221, 0.6);
      opacity: 1;
    }
    
    30% {
      border-color: transparent;
      opacity: 0.2;
    }
    
    36% {
    color: rgba(8, 221, 221, 0.6);
      opacity: 1;
    }
    
    100% {
    color: rgba(8, 221, 221, 0.6);
      opacity: 1;
    }
  }

</style>