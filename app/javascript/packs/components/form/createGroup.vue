<template>
  <form @submit.prevent = "createGroup">
    <h1>New Group</h1>
    <div class="field" id="box1">
      <label for="groupName" v-bind:class="{ 'label1': labelView[0] }" class="label">GROUP NAME</label>
      <input name="text1" type="text" @focus="inputFocus(0)" @blur="inputBlur(0)" id="groupName" placeholder="グループ名(5文字以上)" v-model="form.groupName" minlength="5">
    </div>

    <div class="field" id="box2">
      <label for="password" v-bind:class="{ 'label2': labelView[1] }" class="label">PASSWORD</label>
      <input name="text2" type="password" @focus="inputFocus(1)" @blur="inputBlur(1)" id="password" placeholder="合言葉を入力(6文字以上)" v-model="form.password" minlength="6">
    </div>

    <div class="field" id="box3">
      <label for="password_confirmation" v-bind:class="{ 'label3': labelView[2] }" class="label">Confirmation</label>
      <input name="text3" type="password" @focus="inputFocus(2)" @blur="inputBlur(2)" id="password_confirmation" placeholder="合言葉の再入力" v-model="form.password_confirmation">
    </div>

    <div class="formbtn">
      <router-link to="/main" class="formbtn--item">Back</router-link>
      <input name="submit" class="formbtn--item" type="submit" id="submit" value="Create">
    </div>
  </form> 
</template>

<script>
import axios from "axios"

export default {
  data() {
    return {
      form: {
        groupName: '',
        password: '',
        password_confirmation: "",
      },
      card: {
        rand_number: "",
        group_id: null,
      },
      labelView: [ true, false, false ],
    }
  },
  methods: {
    // グループの作成
    createGroup() {
      axios.post('/groups', { groups: this.form }).then((res) => {
          if(res.data.id == 0) {
            this.$router.push({ path: "/createGroup" });
          }else if(res.data.id > 0) {
            this.card.group_id = res.data.id;
            this.card.rand_number = this.intRandom();
            this.createCard();
          }
  
        }, (error) => {
          console.log(error);
      });
    },
    // グループ作成者のカードを作成
    createCard() {
      axios.post('/cards', { cards: this.card }).then((res) => {
          this.$router.push({ path: res.data });
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
    intRandom(){
      let rands = [];
      while( rands.length < 25 ) {
        let num = Math.floor( Math.random() * (75 - 1 + 1)) + 1;
        if(rands.indexOf( num ) == -1) {
          rands.push(num);
        };
      };
      return rands.join(",");
    },
  }
 
}

</script>

<style scoped lang="scss">

  h1 {
    color: rgb(224, 192, 6);
    text-shadow: 0 0 10px #fff, 0 0 10px #fff, 0 0 10px #fff, 0 0 40px gold, 0 0 50px gold, 0 0 60px gold;
  }

  .field {
    position: relative;
    width: 450px;
    margin: 8vh auto;
    display: flex;
    padding: 30px 20px 20px;
    &::before {
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
    & label {
      font-family: 'Monoton', cursive;
      position: absolute;
      top: -20px;
      left: 10px;
      /* width: 45%; */
      background-color: black;
      padding: 0 10px;
      font-size: 1.8em;
    }
    & input {
      width: 100%;
      padding: 0;
      border: none;
      border-radius: 0;
      outline: none;
      background: none;
      color: white;
      font-size: 1.2em;
      /* placeholderの色 */
      &::placeholder {
        font-size: 0.7em;
        color: rgba(177, 175, 175, 0.897);
      }
      /* IE */
      &:-ms-input-placeholder {
        font-size: 0.7em;
        color: rgba(177, 175, 175, 0.897);
      }
      /* Edge */
      &::-ms-input-placeholder {
        font-size: 0.7em;
        color: rgba(177, 175, 175, 0.897);
      }
      &:-webkit-autofill {
        animation-name: onAutoFillStart;
        transition: background-color 50000s ease-in-out 0s;
        -webkit-text-fill-color: white !important;
      }
    }
  }

  @keyframes onAutoFillStart { from {} to {}}

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

  // ラベルの光らせるスタイル
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

</style>