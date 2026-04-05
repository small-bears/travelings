<template>
    <el-main class="el-main">
      <el-dialog
        title="修改密码"
        :visible.sync="passwordDialogVisible"
        width="30%"
        :before-close="handlePasswordClose">
        <span>请输入{{user.userName}}的旧密码：</span>
        <el-input style="margin-top:10px" show-password v-model="oldPassword" size="mini" autocomplete="off"></el-input>
        <span>请输入{{user.userName}}的新密码：</span>
        <el-input style="margin-top:10px" show-password v-model="newPassword" size="mini" autocomplete="off"></el-input>
        <span slot="footer" class="dialog-footer">
          <el-button size="mini" @click="handlePasswordClose">取 消</el-button>
          <el-button size="mini" type="primary" @click="passwordSubmit">确 定</el-button>
        </span>
      </el-dialog>
      <keep-alive max=10>
      <router-view :key="fullPath"></router-view>
      </keep-alive>
    </el-main>
</template>

<script>
  import {changePassword} from '../../api/api'
  import { mapState,mapGetters } from 'vuex'
  export default {
    name: "main",
    data() {
      return{
        user: {},
        oldPassword: "",
        newPassword: "",
        passwordDialogVisible: false,
      }
    },
    methods: {
      handlePasswordClose() {
        this.$bus.$emit('password', false)
      },
      passwordSubmit() {
        var param = {
          id: this.user.id,
          password: this.oldPassword,
          newPassword: this.newPassword
        }
        changePassword(param).then(res => {
          if(res.code == 1000) {
            this.$notify.success({
              title: '成功',
              message: "密码修改成功"
            });
            this.$bus.$emit('password', false)
          } else {
            this.$notify.error({
              title: '错误',
              message: res.message
            });
          }
        })
      },
      // 根据fullUrl清除keepAlive
      clearKeepAlive(fullUrl) {
        this.$children.forEach((item) => {
          item.$children.forEach((child) => {
            if (child.$vnode.data.key == fullUrl) {
              this._myDestory(child);
            }
          })
        });
      },
      // 封装清除某个组件的keepAlive状态,并销毁
      _myDestory(keepAliveComponent) {
        // 你可以根据自己的业务更改此处的判断逻辑，酌情决定是否摧毁本层缓存。
        if (
          keepAliveComponent.$vnode &&
          keepAliveComponent.$vnode.data.keepAlive
        ) {
          if (
            keepAliveComponent.$vnode.parent &&
            keepAliveComponent.$vnode.parent.componentInstance &&
            keepAliveComponent.$vnode.parent.componentInstance.cache
          ) {
            if (keepAliveComponent.$vnode.componentOptions) {
              var key =
                keepAliveComponent.$vnode.key == null
                  ? keepAliveComponent.$vnode.componentOptions.Ctor.cid +
                    (keepAliveComponent.$vnode.componentOptions.tag
                      ? `::${keepAliveComponent.$vnode.componentOptions.tag}`
                      : "")
                  : keepAliveComponent.$vnode.key;
              var cache = keepAliveComponent.$vnode.parent.componentInstance.cache;
              var keys = keepAliveComponent.$vnode.parent.componentInstance.keys;
              if (cache[key]) {
                if (keys.length) {
                  var index = keys.indexOf(key);
                  if (index > -1) {
                    keys.splice(index, 1);
                  }
                }
                delete cache[key];
              }
            }
          }
        }
        keepAliveComponent.$destroy();
      },
    },
    computed: {
      fullPath() {
        return this.$route.fullPath;
      },
      ...mapGetters('user',['getUser'])
    },
    created() {
     
    },
    mounted() {
      // 注册监听全局的clearKeepAlive方法,可在其他组件中触发此方法
      this.$bus.$on("clearKeepAlive", this.clearKeepAlive);
      // 监听collapse
      this.$bus.$on('password', res=>{
        this.passwordDialogVisible = res
      })
      this.user = JSON.parse(this.getUser)
    }
 }
</script>

<style  scoped>
    .el-main {
        background-color: #F5F9FA;
        overflow-y: scroll;
        height: calc(100vh - 76px);
        position: relative;
    }
    .el-main.el-main::-webkit-scrollbar {
        width: 0px;
        height: 0px;
    }
    .setting {
      width:40px;
      height: 40px;
      position: fixed;
      right: 0;
      top: 150px;
      z-index: 999;
      border: 1px solid #DEDEDE;
      border-radius: 10px;
      overflow: hidden;
    }
</style>