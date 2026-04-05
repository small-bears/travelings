<template>
  <div class="center">
    <el-card class="box-card">
        <div class="content">
            <div class="master">
              <el-form style="margin-right:20px" :model="user" :rules="rules" ref="ruleForm" label-width="140px">
                <el-form-item label="登陆账号" prop="loginAccount">
                  <el-input size="mini" disabled v-model="user.loginAccount"></el-input>
                </el-form-item>
                <el-form-item label="用户名" prop="userName">
                  <el-input size="mini" v-model="user.userName"></el-input>
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                  <el-input size="mini" v-model="user.email"></el-input>
                </el-form-item>
                <el-form-item label="联系电话" prop="tel">
                  <el-input size="mini" v-model="user.tel"></el-input>
                </el-form-item>
                <el-form-item label="性别" prop="tel">
                  <el-radio-group v-model="user.sex">
                    <el-radio label="0">男</el-radio>
                    <el-radio label="1">女</el-radio>
                  </el-radio-group>
                </el-form-item>
                <el-form-item label="登陆IP" prop="loginIp">
                  <el-input size="mini" disabled v-model="user.loginIp"></el-input>
                </el-form-item>
                <el-form-item label="登陆时间" prop="loginDate">
                  <el-input size="mini" disabled v-model="user.loginDate"></el-input>
                </el-form-item>
                <el-form-item label="上次修改密码时间" prop="pwdUpdateDate">
                  <el-input size="mini" disabled v-model="user.pwdUpdateDate"></el-input>
                </el-form-item>
              </el-form>
              <div class="submit">
                  <el-button type="primary" plain size="mini" @click="submit">保存</el-button>
              </div>
            </div>
            <div class="slave">
                <div class="img">
                  <el-image 
                    style="object-fit: cover;width: 300px; height: 300px;overflow: hidden;border-radius: 50%;"
                    :src="$store.state.configure.HOST + user.avatar" 
                    :preview-src-list="avatar">
                  </el-image>
                </div>
                <div class="btns">
                  <div>
                    <el-upload
                      ref="upload"
                      :action="uploadAvatarUrl()+ '/'+ this.user.id"
                      :show-file-list="false"
                      :before-upload="beforeAvatorUpload"
                      :on-success="handleAvatorSuccess"
                      accept="image/*"
                      >
                      <el-button size="mini" icon="el-icon-picture-outline-round">修改头像</el-button>
                    </el-upload>
                  </div>
                  <div style="margin-top:15px">
                    <el-button size="mini" icon="el-icon-key" @click="changePassword">修改密码</el-button>
                  </div>
                </div>
            </div>
        </div>
    </el-card>
  </div>
</template>

<script>
  import {mixin} from "../../../minix";
  import {getUser,setUserInfo,setUserAvatar} from '../../../api/api' 
  export default {
    mixins: [mixin],
    data() {
      var checkPhone = (rule, value, callback) => {
          if (!value) {
              return callback(new Error('请输入联系电话'));
          } else {
              const reg = /^1[3|4|5|7|8][0-9]\d{8}$/
              if (reg.test(value)) {
                  callback();
              } else {
                  return callback(new Error('请输入正确的联系电话'));
              }
          }
      };
      return{
        user: {
          avatar: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fb4a87154-18b6-4163-ac80-f4dc4bf58d09%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1693364028&t=c518c6c4a6ee2009b961f712a57c211f"
        },
        avatar: ["https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fb4a87154-18b6-4163-ac80-f4dc4bf58d09%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1693364028&t=c518c6c4a6ee2009b961f712a57c211f"],
        rules: {
          userName: [
            { required: true, message: '请输入用户名', trigger: 'blur' },
          ],
          email: [
            { required: true, message: '请输入邮箱地址', trigger: 'blur' },
            { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
          ],
          tel: [
            { required: true, validator:checkPhone, message: '请输入正确的联系电话', trigger: 'blur' },
          ],
        },
      }
    },
    methods: {
      submit() {
        this.$refs["ruleForm"].validate((valid) => {
          if (valid) {
            setUserInfo(this.user).then(res => {
              if(res.code == 1000) {
                this.$message({
                  type: 'success',
                  message: '保存成功!'
                });
                this.getUserInfo()
              } else {
                this.$notify.error({
                  title: '错误',
                  message: res.message
                });
              }
            })
          } else {
            return false;
          }
        });
      },
      getUserInfo() {
        getUser().then(res => {
            if(res.code == 1000) {
              this.user = res.data
              this.user.sex = res.data.sex + ""
              this.avatar[0] = this.$store.state.configure.HOST + this.user.avatar
              this.setUser()
            } else {
              this.$notify.error({
                title: '错误',
                message: res.message
              });
            }
        })
      },
      setUser() {
        this.$store.commit('user/setUser', JSON.stringify(this.user))
      },
      changePassword() {
        //修改密码
        this.$bus.$emit('password', true)
      },
      handleAvatorSuccess(res){
        let _this = this;
        if(res.code == 1000){
            _this.$message({
              type: 'success',
              message: '上传成功!'
            });
            this.getUserInfo()
        }else{
          _this.$notify.error({
            title: '错误',
            message: res.message
          });
        }
      },
    },
    created() {
     
    },
    mounted() {
      this.getUserInfo()
    }
 }
</script>

<style  scoped>
  .content {
      width: 100%;
      height: 550px;
      display: flex;
      flex-direction: row;
      font-family: "黑体";
  }
  .master {
      width: 60%;
      border-right: 1px solid #E5E5E5;
  }
  .submit {
    width: 100%;
    text-align: center;
  }
  .slave {
      width: 40%;
  }
  .img {
      width: 100%;
      height: 75%;
      display: flex;
      justify-content: center;
      align-items: center;
  }
  .btns {
      width: 100%;
      height: 25%;
      display: flex;
      flex-direction: column;
      align-items: center;
  }
</style>