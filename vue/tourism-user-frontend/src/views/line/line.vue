<template>
  <div class="line">
    <headers></headers>
    <div class="line1">
        <div class="line2">
            <el-input size="small" style="width:300px;margin-left:20px" v-model="search.name" placeholder="请输入旅游线路名称"></el-input>
            <el-input size="small" style="width:300px;margin-left:20px" v-model="search.geography" placeholder="请输入地理情况"></el-input>
            <el-input size="small" style="width:300px;margin-left:20px" v-model="search.temperature" placeholder="请输入温度"></el-input>
            <el-button size="small" style="margin-left:20px" type="primary" plain @click="searchPage">搜索</el-button>
        </div>
        <div class="line3">
            <div class="line4" v-for="(item,index) in tableData" @click="toInfo(item.id)">
                <div class="line5">
                    <img style="width:100%;height:100%" :src="item.images.split(',')[0]">
                </div>
                <div class="line6">
                    <div class="line7">{{item.name}}</div>
                    <div class="line8">{{item.introduce}}</div>
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
  import {getSysLinePage} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        search: {
          name: "",
          geography: "",
          temperature: "",
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
        this.getSysLinePage()
      },
      getSysLinePage() {
        getSysLinePage(this.search).then(res => {
          if (res.code == 1000) {
            this.tableData = res.data.records
            this.total = res.data.total
          }
        })
      },
      toInfo(id) {
        this.$router.push("/lineInfo?id=" + id)
      },
      handleCurrentChange(val) {
        this.search.pageNumber = val
        this.getSysLinePage()
      }, 
    },
    created() {
     
    },
    mounted() {
      this.getSysLinePage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/line.css');
</style>