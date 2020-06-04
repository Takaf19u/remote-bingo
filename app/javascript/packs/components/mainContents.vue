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
          <div @click="logout" style="color: white">logout</div>
          <router-link to="/users/sign_up">new</router-link>
        </div>
      </div>
    </div>
</template>