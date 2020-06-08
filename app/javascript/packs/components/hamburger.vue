<template>
  <div id="navArea" v-bind:class="{ 'open': btnView }">
    <nav>
      <div class="inner">
        <ul>
          <li class="username">ようこそ 〇〇さん</li>
          <li><a href="#">Text</a></li>
          <li><a href="#">Text</a></li>
          <li><a href="#">Text</a></li>
        </ul>
      </div>
    </nav>
    <div id="toggle_btn" @click="navbtn()" >
      <span></span>
      <span></span>
      <span></span>
    </div>
    <div id="mask" @click="maskclose()"></div>
  </div>
</template>


<script>
  export default {
    data: function () {
      return {
        nav: null,  
        btn: null,  
        mask: null,
        btnView: false,  
        open: 'open',   
      }
    },
    mounted: function(){
      this.nav   = document.getElementById('navArea');
      this.btn   = document.getElementById('toggle_btn');
      this.mask  = document.getElementById('mask');
    },
    methods: {
      navbtn() {
        if ( this.nav.className == this.open ) {
          this.btnView = false;
        } else {
          this.btnView = true;
        }
      },
      maskclose() {
        this.btnView = false;
      }
    }
  }
</script>


<style lang="scss">
/*============
nav
=============*/
nav {
  display: block;
  position: fixed;
  top: 0;
  left: -300px;
  bottom: 0;
  width: 300px;
  background: #7a78787c;
  overflow-x: hidden;
  overflow-y: auto;
  -webkit-overflow-scrolling: touch;
  transition: all .5s;
  z-index: 3;
  opacity: 0;
  & .inner {
    & ul {
      list-style: none;
      margin: 0;
      padding: 0;
      & li {
        position: relative;
        margin: 0;
        border-bottom: 1px solid rgb(121, 118, 118);
        width: 100%;
        & a {
          color: white;
          display: block;
          font-size: 14px;
          padding: 15px;
          text-decoration: none;
          transition-duration: 0.2s;
        }
      }
      .username {
        padding: 15px;
        text-align: center;
        background:rgba(43, 52, 148, 0.658);
        border-bottom: none;
      }
    }
  }
}

.open nav {
  left: 0;
  opacity: 1;
}

nav .inner ul li 
nav .inner ul li a:hover {
  background: #e4e4e4;
}

@media screen and (max-width: 767px) {
  nav {
    left: -220px;
    width: 220px;
  }
}

/*============
#toggle_btn
=============*/
#toggle_btn {
  display: block;
  position: fixed;
  top: 30px;
  right: 30px;
  width: 30px;
  height: 30px;
  transition: all .5s;
  padding: 5px;
  cursor: pointer;
  z-index: 3;
  & span {
    display: block;
    position: absolute;
    left: 0;
    width: 30px;
    height: 2px;
    background-color: rgb(209, 205, 205);
    border-radius: 4px;
    transition: all .5s;
    &:nth-child(1) {
      top: 4px;
    }
    &:nth-child(2) {
      top: 14px;
    }
    &:nth-child(3) {
      bottom: 4px;
    }
  }
  &::before {
    content: "";
    position: absolute;
    top: -5px;
    bottom: -5px;
    left: -5px;
    right: -5px;
    border: 1.2px solid rgb(209, 205, 205);
    border-radius: 5px;
  }
}

.open #toggle_btn::before {
  border: none;
}

.open #toggle_btn span {
  background-color: #fff;
}
.open #toggle_btn span:nth-child(1) {
  -webkit-transform: translateY(10px) rotate(-315deg);
  transform: translateY(10px) rotate(-315deg);
}
.open #toggle_btn span:nth-child(2) {
  opacity: 0;
}
.open #toggle_btn span:nth-child(3) {
  -webkit-transform: translateY(-10px) rotate(315deg);
  transform: translateY(-10px) rotate(315deg);
}
/*============
#mask
=============*/
#mask {
  display: none;
  transition: all .5s;
}
.open #mask {
  display: block;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .8;
  z-index: 2;
  cursor: pointer;
}
</style>