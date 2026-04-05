<template>
  <div class="login">
    <div class="login1">
    </div>
    <div class="login4">
        <div class="login5">
          <img src="../../assets/image/logo.png" style="width: 50px;position: relative; top: 13px;right: 6px">
          <el-input prefix-icon="el-icon-user" v-model="loginAccount" placeholder="请输入登录账号"></el-input>
            <el-input prefix-icon="el-icon-star-off" type="password" v-model="password" placeholder="请输入用户密码"></el-input>
            <el-input prefix-icon="el-icon-s-order" v-model="email" placeholder="请输入邮箱"></el-input>
            <el-input prefix-icon="el-icon-s-ticket" v-model="code" placeholder="请输入验证码"></el-input>
            <div class="login8" @click="forgetPassword">
                提交
            </div>
            <div class="login8" @click="getEmailReg">
                获取验证码
            </div>
        </div>
    </div>
  </div>
</template>

<script>
  import {getEmailReg,forgetPassword} from '../../api/api'
  export default {
    data() {
      return{
        loginAccount: "",
        password: "",
        email: "",
        code: "",
      }
    },
    methods: {
        toLogin() {
            this.$router.push("/login")
        },
        getEmailReg() {
          if(!this.email) {
              this.$message({
                  message: '请输入邮箱',
                  type: 'warning'
              });
              return;
          }
          var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // 邮箱正则表达式
          if (!regex.test(this.email)) {
              this.$message({
                  message: '请输入正确的邮箱格式',
                  type: 'warning'
              });
              return;
          }
          getEmailReg({email: this.email}).then(res => {
            if (res.code == 100) {
              this.$message({
                  message: '验证码已发送',
                  type: 'success'
              });
            } else {
              this.$message({
                  message: res.message,
                  type: 'warning'
              });
            }
          })
        },
        forgetPassword() {
          if(!this.loginAccount) {
              this.$message({
                  message: '请输入登录账号',
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
          if(!this.code) {
              this.$message({
                  message: '请输入用户名',
                  type: 'warning'
              });
              return;
          }
          if(!this.email) {
              this.$message({
                  message: '请输入邮箱',
                  type: 'warning'
              });
              return;
          }
          var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // 邮箱正则表达式
          if (!regex.test(this.email)) {
              this.$message({
                  message: '请输入正确的邮箱格式',
                  type: 'warning'
              });
              return;
          }
          var param = {
            loginAccount: this.loginAccount,
            password: this.password,
            email: this.email,
            code: this.code
          }
          forgetPassword(param).then(res => {
            if (res.code == 1000) {
              this.$message({
                  message: '密码修改成功',
                  type: 'success'
              });
              var that = this
              setTimeout(function() {
                  that.$router.push("/login")
              },500)
            } else {
              this.$message({
                  message: res.message,
                  type: 'warning'
              });
            }
          })
        }
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
