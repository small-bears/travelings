<template>
  <div class="line">
    <headers></headers>
    <div class="line1">
        <div class="line3">
            <div class="line4" v-for="(item,index) in tableData" @click="toInfo(item.lineId)">
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
  import {getSysFavorPage} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        search: {
          userId: "",
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
      getSysFavorPage() {
        getSysFavorPage(this.search).then(res => {
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
        this.getSysFavorPage()
      }, 
    },
    created() {
     
    },
    mounted() {
      this.search.userId = JSON.parse(window.localStorage.getItem("user_info")).id
      this.getSysFavorPage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/line.css');
</style>