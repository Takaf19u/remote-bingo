<template>
    <div id="toppage">
      <div id="topItems">
        <div id="logobox">
          <span class="cp_loading03 cp_item"> </span>
          <div class="logo">
            <b class="logotitle1">remote</b>
            <b class="logotitle2">BINGO</b>
          </div>
        </div>
      </div>
      <div class="message">ようこそ！！</div>
      <div id="mainItems">
        <div class="items-name">
        </div>
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
          <div @click="logout" style="color: white">logout</div>
          <router-link to="/users/sign_up">new</router-link>
        </div>
      </div>
    </div>
</template>


<style scoped>
  @import url(//fonts.googleapis.com/css?family=Vibur);

  #toppage {
    width: 100%;
    padding-top: 2%;
  }
  #topItems {
    display: flex;
    align-items: center;
    margin: auto;
    height: 80vh;
    width: 100%;
    /* background-image: url("/assets/Brick-background.jpg");
    background-size: auto; */
    position: relative;
    z-index: 1;
   margin-bottom: 20vh;
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
}

  #logobox {
    text-align: center;
    user-select: none;
    margin: 10px auto;
    position: relative;
    z-index: 2;
  }
  
  .logo {
    position: relative;
  }

  .logo b{
    color: rgba(8, 221, 221, 0.6);
    text-shadow: 0 -40px 80px, 0 0 2px, 0 0 1em rgba(8, 221, 221, 0.6), 0 0 0.5em rgba(8, 221, 221, 0.6), 0 0 0.1em rgba(8, 221, 221, 0.6), 0 10px 3px #000;
    display: block;
    line-height: 1;
    margin: 10px;
  }

  .logotitle1 {
    font: 400 20vh "Vibur";
  }

.logotitle2 {
    font: 400 25vh "Vibur";
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
    height: 50%;
    width: 100%;
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


/* ぐるぐるする処理 */
.cp_loading03 {
	position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
	width: 80vh;
	height: 80vh;
}
.cp_loading03.cp_item {
	-webkit-animation: loading03 10s linear infinite;
	        animation: loading03 10s linear infinite;
	border: 10px solid transparent;
	border-top-color: #f06292;
	border-bottom-color: #f06292;
	border-radius: 80vh;
}
.cp_loading03.cp_item:before,
.cp_loading03.cp_item:after {
	position: absolute;
	top: 50px;
	right: 50px;
	bottom: 50px;
	left: 50px;
	content: '';
	-webkit-animation: loading03_reverse 8s linear infinite;
	        animation: loading03_reverse 8s linear infinite;
	opacity: .6;
	border: 5px solid transparent;
	border-top-color: #f06292;
	border-bottom-color: #f06292;
	border-radius: 80vh;
	filter: alpha(opacity=60);
}
.cp_loading03.cp_item:before {
	top: 100px;
	right: 100px;
	bottom: 100px;
	left: 100px;
	-webkit-animation: loading03_reverse 5s cubic-bezier(.17,.67,.88,.52) infinite;
	        animation: loading03_reverse 5s cubic-bezier(.17,.67,.88,.52) infinite;
	opacity: .8;
	border: 6px solid transparent;
	border-top-color: #f06292;
	border-bottom-color: #f06292;
	filter: alpha(opacity=80);
}
@-webkit-keyframes loading03 {
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
@keyframes loading03 {
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
@-webkit-keyframes loading03_reverse {
	0% {
		-webkit-transform: rotate(0deg);
		transform: rotate(0deg);
	}
	50% {
		-webkit-transform: rotate(180deg);
		transform: rotate(180deg);
	}
	100% {
		-webkit-transform: rotate(-360deg);
		transform: rotate(-360deg);
	}
}
@keyframes loading03_reverse {
	0% {
		-webkit-transform: rotate(0deg);
		transform: rotate(0deg);
	}
	50% {
		-webkit-transform: rotate(180deg);
		transform: rotate(180deg);
	}
	100% {
		-webkit-transform: rotate(-360deg);
		transform: rotate(-360deg);
	}
}

</style>