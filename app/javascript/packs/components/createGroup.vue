<template>
  <div id="createGroup">
    <div class="bar" id="left-bar"></div>
    <div class="bar" id="right-bar"></div>
    <div class="mainContents">
      <form @submit.prevent = "create">
        
        <div class="inputBox" id="box1">
          <label for="masterName" v-bind:class="{ 'label1': labelView[0] }" class="label">MASTER NAME</label>
          <input name="text1" type="text" @focus="inputFocus(0)" @blur="inputBlur(0)" id="masterName" placeholder="主催者名(6文字以上)" autofocus v-model="form.masterName" maxlength="6">
        </div>
        <div class="inputBox" id="box2">
          <label for="groupName" v-bind:class="{ 'label2': labelView[1] }" class="label">GROUP NAME</label>
          <input name="text2" type="text" @focus="inputFocus(1)" @blur="inputBlur(1)" id="groupName" placeholder="グループ名(6文字以上)" v-model="form.groupName" maxlength="6">
        </div>

        <div class="inputBox" id="box3">
          <label for="password" v-bind:class="{ 'label3': labelView[2] }" class="label">PASSWORD</label>
          <input name="text3" type="text" @focus="inputFocus(2)" @blur="inputBlur(2)" id="password" placeholder="合言葉(6文字以上)" v-model="form.password" maxlength="6">
        </div>

        <div class="formbtn">
          <router-link to="/main" class="formbtn--item">Back</router-link>
          <input name="submit" class="formbtn--item" type="submit" id="submit" value="Create">
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios"

export default {
  data() {
    return {
      form: {
        masterName: '',
        groupName: '',
        password: '',
      },
      labelView: [ true, false, false ],
    }
  },
  methods: {
    create: function () {
      axios.post('/groups', { group: this.form }).then((res) => {
          debugger
          this.$router.push({ path: '/' });
        }, (error) => {
          console.log(error);
      });
    },
    inputFocus(id) {
      for(let i = 0; i < this.labelView.length; i++){
        if(i == id) {
          this.$set(this.labelView, i, true);
        } else {
          this.$set(this.labelView, i, false);
        };
      };
    },
    inputBlur(id) {
      this.$set(this.labelView, id, false);
    },
  }
 
}

</script>


<style scoped>
  #createGroup {
    height: 100%;
    width: 100%;
    color: white;
    padding: 3%;
  }

  .bar {
    height: 100%;
    width: 20px;
    background: linear-gradient(30deg, #bd6cff, #6cffeb, #e8f80c);
  }

  #left-bar {
    position: absolute;
      top: 0;
      bottom: 0;
      left: 5%;
  }

  #right-bar {
    position: absolute;
      top: 0;
      bottom: 0;
      right: 5%;
  }

  #left-bar::after {
    content: "";
    position: absolute;
      top: 0;
      bottom: 0;
      right: -20px;
      width: 10px;
      height: 100%;
    background: linear-gradient(30deg, #bd6cff, #6cffeb, #e8f80c);
  }

  #right-bar::after {
    content: "";
    position: absolute;
      top: 0;
      bottom: 0;
      left: -20px;
      width: 10px;
      height: 100%;
    background: linear-gradient(30deg, #bd6cff, #6cffeb, #e8f80c);
  }


  .mainContents {
    text-align: center;
  }

  h1 {
    font-size: 2em;
    font-weight:800;
  }

  .inputBox {
    position: relative;
    width: 450px;
    margin: 8% auto;
    display: flex;
    padding: 30px 20px 20px;
  }
  .inputBox::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    height: 100%;
    width: 100%;
    border-radius: 5px;
    pointer-events: none;
    
  }

  input[type="text"] {
    width: 100%;
    padding: 0;
    border: none;
    border-radius: 0;
    outline: none;
    background: none;
    color: white;
    font-size: 1.2em;
  }

  /* placeholderの色 */
  input::placeholder {
    color: rgba(177, 175, 175, 0.897);
  }

  /* IE */
  input:-ms-input-placeholder {
    color: rgba(177, 175, 175, 0.897);
  }

  /* Edge */
  input::-ms-input-placeholder {
    color: rgba(177, 175, 175, 0.897);
  }

  label {
    font-family: 'Monoton', cursive;
    position: absolute;
    top: -20px;
    left: 10px;
    /* width: 45%; */
    background-color: black;
    padding: 0 10px;
    font-size: 1.8em;
  }

  #box1 {
    color: rgb(0, 132, 255);
    border-radius: 10px;
  }

  #box1::before {
    border: 3px rgb(0, 132, 255) solid;
  }
  .label1 {
    z-index: 1;
    text-shadow: 0 0 10px #fff, 0 0 10px #fff, 0 0 10px #fff, 0 0 40px rgb(17, 180, 255), 0 0 50px rgb(17, 160, 255), 0 0 60px rgb(18, 124, 245), 0 0 80px rgb(18, 124, 245), 0 0 100px rgb(18, 124, 245);
  }

  #box2 {
    color: rgb(6, 156, 56);
    border-radius: 10px;
  }
  #box2::before {
    border: 3px rgb(6, 156, 56) solid;
  }
  .label2 {
    text-shadow: 0 0 10px #fff, 0 0 10px #fff, 0 0 10px #fff, 0 0 40px rgb(6, 156, 56), 0 0 50px rgb(6, 156, 56), 0 0 60px rgb(6, 156, 56), 0 0 80px rgb(6, 156, 56), 0 0 100px rgb(6, 156, 56);
  }

  #box3 {
    color: rgb(199, 6, 199);
    border-radius: 10px;
  }
  #box3::before {
    border: 3px rgb(199, 6, 199) solid;
  }
  .label3 {
    text-shadow: 0 0 10px #fff, 0 0 10px #fff, 0 0 10px #fff, 0 0 40px rgb(199, 6, 199), 0 0 50px rgb(199, 6, 199), 0 0 60px rgb(199, 6, 199), 0 0 80px rgb(199, 6, 199), 0 0 100px rgb(199, 6, 199);
  }

  .formbtn {
    width: 450px;
    margin: 8% auto;
    display: flex;
    justify-content: center;
    padding: 0 10px;
  }

  .formbtn--item {
    margin: 0 30px;
    font-family: 'Montserrat', sans-serif;
    text-decoration: none;
    font-size: 1.6em;
    font-weight: 800;
    display: inline-block;
    background: #f36f6fb9;
    color: rgb(194, 194, 194);
    width: 100px;
    height: 100px;
    line-height: 100px;
    border-radius: 50%;
    text-align: center;
    overflow: hidden;
    box-shadow: 0px 2px 10px rgba(202, 248, 250, 0.59);
    border-bottom: solid 3px #bd6565;
    transition: .2s;
      -webkit-appearance: none;
      -moz-appearance: none;
      appearance: none;
      padding: 0;
      border: none;
      outline: none;
  }

  .formbtn--item:hover {
    background: #fa8b8b;
    color: white;
  }

  .formbtn--item:active {
    -webkit-transform: translateY(2px);
    transform: translateY(2px);
    box-shadow: 0 0 1px rgba(163, 231, 252, 0.5);
    border-bottom: none;
  }



</style>