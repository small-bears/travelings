<template>
  <div class="login">
    <div class="login1">
    </div>
    <div class="login4">
        <div class="login5">
          <img src="../../assets/image/logo.png" style="width: 50px;position: relative; top: 13px;right: 6px">
          <el-input prefix-icon="el-icon-user" v-model="loginAccount" placeholder="请输入登录账号"></el-input>
            <el-input prefix-icon="el-icon-star-off" type="password" v-model="password" placeholder="请输入用户密码"></el-input>
            <el-input prefix-icon="el-icon-s-platform" v-model="userName" placeholder="请输入用户名"></el-input>
            <el-input prefix-icon="el-icon-s-order" v-model="email" placeholder="请输入邮箱"></el-input>
            <el-input prefix-icon="el-icon-s-ticket" v-model="tel" placeholder="请输入联系电话"></el-input>
          <div class="login8" @click="saveUser">
                注册
            </div>
            <div class="login8" @click="toLogin">
                登 录
            </div>
        </div>
    </div>
  </div>
</template>

<script>
  import {saveUser} from '../../api/api'
  export default {
    data() {
      return{
        loginAccount: "",
        password: "",
        userName: "",
        type: "1",
        email: "",
        tel: "",
      }
    },
    methods: {
        toLogin() {
            this.$router.push("/login")
        },
        saveUser() {
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
            if(!this.userName) {
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
            if(!this.tel) {
                this.$message({
                    message: '请输入联系方式',
                    type: 'warning'
                });
                return;
            }
            var param = {
                loginAccount: this.loginAccount,
                password: this.password,
                userName: this.userName,
                email: this.email,
                tel: this.tel,
                userType: 1,
            }
            saveUser(param).then(res => {
                if (res.code == 1000) {
                    if (this.type == 2) {
                        this.$message({
                            message: '正在审核，审核完成后会将结果发送到您的邮箱，请注意查收',
                            type: 'success'
                        });
                    } else {
                        this.$message({
                            message: '注册成功',
                            type: 'success'
                        });
                    }
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
