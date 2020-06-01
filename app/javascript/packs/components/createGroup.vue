<template>
  <div id="createGroup">
    <h1>グループ情報を入力</h1>
      <div class="inputBox">
        <label for="master">主催者名</label>
      </div>
    <form>
    </form>
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
        pasword: '',
      },
    }
  },
 
}

</script>


<style scoped>
  #createGroup {
    color: white;
  }

</style>