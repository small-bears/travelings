<template>
  <div class="login">
    <div class="login1">
    </div>
    <div class="login4">
      <div class="login5">
        <div style="color: #d37136" class="login6">
          <img src="../../assets/image/logo.png" style="width: 50px;position: relative; top: 13px;right: 6px">
          欢迎使用旅游信息推荐系统
        </div>
        <el-input prefix-icon="el-icon-user" v-model="loginAccount" placeholder="请输入登录账号"></el-input>
        <el-input prefix-icon="el-icon-star-off" type="password" v-model="password" placeholder="请输入用户密码"></el-input>
        <div class="login7" @click="toForget">
          忘记密码？
        </div>

        <div class="login8" @click="login">
          登 录
        </div>
        <div class="login8" @click="toRegister">
          注 册
        </div>




      </div>
    </div>

  </div>
</template>

<script>
import {login,getUser} from '../../api/api'
export default {
  data() {
    return{
      loginAccount: "",
      password: "",
    }
  },
  methods: {
    toRegister() {
      this.$router.push("/register")
    },

    toForget() {
      this.$router.push("/forget")
    },
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
          window.localStorage.setItem("user_token",token)
          this.getUserInfo()
          setTimeout(function() {
            that.$router.push("/")
          },500)
        } else {
          this.$message.error(res.message);
        }
      })
    },
    getUserInfo() {
      getUser().then(res => {
        if(res.code == 1000) {
          window.localStorage.setItem("user_info",JSON.stringify(res.data))
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
@import url('../../assets/css/login.css');
</style>
