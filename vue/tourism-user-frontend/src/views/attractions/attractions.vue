<template>
  <div class="attractions">
    <headers></headers>
    <div class="attractions1">
      <div class="attractions2">
        <el-input size="small" style="width:300px;margin-left:20px" v-model="search.name" placeholder="请输入景点名称"></el-input>
        <el-button size="small" style="margin-left:20px" type="primary" plain @click="searchPage">搜索</el-button>
      </div>
      <div class="attractions3">
        <div class="index5" v-for="(item,index) in tableData" :key="index" style="margin-top:15px">
          <img style="width:100%;height:300px" :src="item.images.split(',')[0]">
          <div class="index6">
            <div class="index7">{{item.name}}</div>
            <div class="index8">{{item.introduce}}</div>
            <div class="index9" @click="toInfo(item.id)" style="margin-bottom:10px;cursor: pointer;margin-top:10px">
              预 约
            </div>
          </div>
        </div>
      </div>
      <el-pagination
        background
        :page-size="search.pageSize"
        layout="prev, pager, next"
        @current-change="handleCurrentChange"
        :total="total">
      </el-pagination>
    </div>
    <bottoms></bottoms>
  </div>
</template>

<script>
  import {getSysAttractionsPage} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        search: {
          name: "",
          state: 1,
          pageSize: 12,
          pageNumber: 1,
        },
        total:100,
        tableData: [],
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      searchPage() {
        this.pageNumber = 1
        this.getSysAttractionsPage()
      },
      getSysAttractionsPage() {
        getSysAttractionsPage(this.search).then(res => {
          if (res.code == 1000) {
            this.tableData = res.data.records
            this.total = res.data.total
          }
        })
      },
      toInfo(id) {
        this.$router.push("/attractionsInfo?id=" + id)
      },
      handleCurrentChange(val) {
        this.search.pageNumber = val
        this.getSysAttractionsPage()
      }, 
    },
    created() {
     
    },
    mounted() {
      this.getSysAttractionsPage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/attractions.css');
</style>