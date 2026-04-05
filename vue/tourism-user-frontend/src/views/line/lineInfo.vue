<template>
  <div class="forumInfo">
    <headers></headers>
    <div class="forumInfo1">
        <div class="forumInfo2">
          <el-carousel height="500px">
            <el-carousel-item v-for="(item,index) in info.images.split(',')" :key="index">
              <img style="width:100%;height:100%" :src="item">
            </el-carousel-item>
          </el-carousel>
        </div>
    </div>
    <div class="forumInfo1">
        <div class="forumInfo2">
            <div class="forumInfo3">
                {{info.name}}
                <el-button v-if="!flag" size="small" type="success" icon="el-icon-star-on" circle @click="saveSysFavor"></el-button>
                <el-button v-if="flag" size="small" type="warning" icon="el-icon-star-off" circle @click="removeSysFavor"></el-button>
            </div>
            <div class="forumInfo4" v-html="info.content">
                
            </div>
        </div>
    </div>
    <bottoms></bottoms>
  </div>
</template>

<script>
  import {getSysLineById,getSysFavor,saveSysFavor,removeSysFavor} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        id: "",
        info: {
          content: "",
          name: ""
        },
        favor: {},
        flag: false,
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      removeSysFavor(id) {
        removeSysFavor({ids: this.favor.id}).then(res => {
          if (res.code == 1000) {
            this.getSysFavor()
          }
        })
      },
      saveSysFavor() {
        var param = {
          lineId: this.id
        }
        saveSysFavor(param).then(res => {
          if (res.code == 1000) {
            this.$message({
                message: '收藏成功',
                type: 'success'
            });
            this.getSysFavor()
          }
        })
      },
      getSysLineById() {
        getSysLineById({id: this.id}).then(res => {
          if (res.code == 1000) {
            this.info = res.data
          }
        })
      },
      getSysFavor() {
        getSysFavor({id:this.id}).then(res => {
          if (res.code == 1000) {
            this.favor = res.data
            this.flag = true
          } else {
            this.flag = false
          }
        })
      },
    },
    created() {
     
    },
    mounted() {
      this.id = this.$route.query.id
      this.getSysFavor()
      this.getSysLineById()
    }
 }
</script>

<style scoped>
  @import url('../../assets/css/forumInfo.css');
  ::v-deep img {
    max-width: 100% !important;
  }
</style>