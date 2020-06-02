<template>
  <div id="createGroup">
    <span class="mainContents">
      <h1>グループ情報を入力</h1>
        <div class="inputBox" id="box1">
          <label for="masterName">MASTER NAME</label>
          <input type="text" id="masterName" placeholder="主催者名(6文字以上)" autofocus v-model="masterName" maxlength="6">
        </div>
        <div class="inputBox" id="box2">
          <label for="groupName">GROUP NAME</label>
          <input type="text" id="groupName" placeholder="グループ名(6文字以上)" autofocus v-model="groupName" maxlength="6">
        </div>

        <div class="inputBox" id="box3">
          <label for="password">PASSWORD</label>
          <input type="text" id="password" placeholder="合言葉(6文字以上)" autofocus v-model="masterName" maxlength="6">
        </div>
      <form>
      </form>
    </span>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      form: {
        masterName: '',
        groupName: '',
        password: '',
      },
    }
  },
 
}

</script>


<style scoped>
  #createGroup {
    height: 100%;
    width: 100%;
    color: white;
    padding: 3%;
  }

  .mainContents {
    display: block;
    text-align: center;
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
    border: 3px red solid;
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
    color: red;
  }

  /* IE */
  input:-ms-input-placeholder {
    color: red;
  }

  /* Edge */
  input::-ms-input-placeholder {
    color: red;
  }

  label {
    font-family: 'Monoton', cursive;
    position: absolute;
    top: -15px;
    left: 10px;
    /* width: 45%; */
    background-color: black;
    /* border-left: 5px double red;
    border-right:  5px double red; */
    padding: 0 10px;
    font-size: 1.4em;
  }

</style>