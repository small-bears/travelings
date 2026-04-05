<template>
  <div class="bottom">
    <div class="bottom1">
      <img src="../assets/image/Frame 28.png">
    </div>
    <div class="bottom2">
      <div style="font-size:20px">简介：</div>
      <div>系统角色上分为管理员以及普通用户进行实现， 管理员主要负责整个网站后台的维护管理，例如包括用户管理、景点以及分类管理、旅游路线管理、酒店管理、资讯管理、轮播图管理、个人中心等功能； 前台包括用户登陆注册、忘记密码、旅游景点查询和预定、旅游路线查询和收藏、酒店查询和预订、资讯、我的收藏、我的预定、个人中心等功能。</div>
    </div>
    <div class="bottom3">
      <div style="font-size:20px">联系我们：</div>
      <div>邮箱: xxx@mail.com</div>
      <div>QQ: xxx</div>
      <div>微信: xxx</div>
      <div>微博: xxx@mail.com</div>
      <div>电话: xxx</div>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return{

      }
    },
    methods: {
      toPage(name) {
        if (name == "index") {
          this.$router.push("/")
        } else if (name == "vegetable") {
          this.$router.push("/vegetable")
        } else if (name == "information") {
          this.$router.push("/information")
        } else if (name == "shed") {
          this.$router.push("/shed")
        } else if (name == "leave") {
          this.$router.push("/leave")
        } else if (name == "manage") {
          window.open("http://localhost:3000")
        } else if (name == "car") {
          this.$router.push("/car")
        } else if (name == "favor") {
          this.$router.push("/favor")
        } else if (name == "order") {
          this.$router.push("/order")
        } else if (name == "appointment") {
          this.$router.push("/appointment")
        }
      }
    },
 }
</script>

<style scoped>
  .bottom {
      margin-top: 20px;
      width: 100%;
      height: 300px;
      display: flex;
      justify-content: space-around;
      background-color: #89A5C2;
      align-items: center;
      font-family: '黑体';
  }
  .bottom1,.bottom3,.bottom2 {
    color: #000000;
  }
  .bottom2 {
    width: 500px;
    letter-spacing: 2px;
    line-height: 30px;
  }
  .bottom1>div,.bottom3>div,.bottom2>div {
    font-size: 14px;
    margin-top: 12px;
    cursor: pointer;
  }
</style>
