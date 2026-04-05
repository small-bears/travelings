<template>
  <div class="login">
    <div class="login1">
    </div>
    <div class="login4">
      <div class="login5">
        <img src="../../../assets/image/logo.png" style="width: 50px;position: relative; top: 13px;right: 6px">
        <div class="login6">欢迎使用旅游信息推荐系统</div>
        <div class="login3">
          珍藏每一刻的美好，旅行让生活变得更加有意义！
        </div>
        <el-input prefix-icon="el-icon-user" v-model="loginAccount" placeholder="请输入登录账号"></el-input>
        <el-input prefix-icon="el-icon-star-off" type="password" v-model="password" placeholder="请输入用户密码"></el-input>
        <div class="login8" @click="login">
          登 录
        </div>


      </div>
    </div>
  </div>
</template>

<script>
import {login,getUser} from '../../../api/api'
export default {
  data() {
    return{
      loginAccount: '',
      password: ''
    }
  },

  methods: {

    login() {
      if(!this.loginAccount) {
        this.$message({
          message: '请输入用户名',
          type: 'warning'
        });
        return;
      }
      if(!this.password) {
        this.$message({
          message: '请输入密码',
          type: 'warning'
        });
        return;
      }
      var params = {
        loginAccount: this.loginAccount,
        password: this.password
      }
      login(params).then(res => {
        if(res.code == 1000) {
          this.$message({
            message: '登陆成功',
            type: 'success'
          });
          var that = this
          var token = res.data.token
          this.$store.commit('user/setToken', token)
          this.getUserInfo()
          setTimeout(function() {
            that.$router.push("/index")
          },500)
        } else {
          this.$message.error(res.message);
        }
      })
    },
    getUserInfo() {
      getUser().then(res => {
        if(res.code == 1000) {
          this.$store.commit('user/setUser', JSON.stringify(res.data))
        }
      })
    },
  },
  created() {

  },
  mounted() {

  }
}
</script>

<style scoped>
.login {
  width: 100%;
  height: 100%;
  font-family: '黑体';
  display: flex;
}
.login1 {
  width: 60%;
  height: 100%;
  background-image: url('../../../assets/image/image 2.png');
  background-size: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
.login2 {
  font-size: 35px;
  font-weight: bold;
}
.login3 {
  margin-top: 10px;
  letter-spacing: 2px;
  font-size: 20px;
  font-weight: bold;
}
.login4 {
  width: 40%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.login5 {
  width: 80%;
  height: 80%;
  flex-direction: column;
  display: flex;
  justify-content: space-around;
  align-items: center;
}
.login6 {
  font-size: 30px;
  font-weight: bold;
}
.login7 {
  width: 100%;
  text-align: right;
  cursor: pointer;
}
.login8 {
  display: flex;
  justify-content: center;
  align-items: center;
  color: #ffffff;
  width: 70%;
  height: 50px;
  cursor: pointer;
  border-radius: 20px;
  background-color: #3E78F3;
}
</style>
