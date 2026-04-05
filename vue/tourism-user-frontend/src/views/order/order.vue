<template>
  <div class="attractions">
    <headers></headers>
    <div class="order" style="margin-top:20px">
        <el-tabs style="width:80%" v-model="activeName" type="card" @tab-click="handleClick">
            <el-tab-pane label="景点" name="first">
                <div class="attractions1">
                    <div class="attractions3">
                        <div class="index5" @click="toOrderInfo(index)" v-for="(item,index) in tableData" :key="index" style="margin-top:15px">
                        <img style="width:100%" :src="item.images.split(',')[0]">
                        <div class="index6">
                            <div class="index7">{{item.name}}</div>
                            <div class="index8">{{item.introduce}}</div>
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
            </el-tab-pane>
            <el-tab-pane label="酒店" name="second">
                <div class="attractions1">
                    <div class="attractions3">
                        <div class="index5" @click="toOrderInfo1(index)" v-for="(item,index) in tableData1" :key="index" style="margin-top:15px">
                        <img style="width:100%" :src="item.images.split(',')[0]">
                        <div class="index6">
                            <div class="index7">{{item.name}}</div>
                            <div class="index8">{{item.introduce}}</div>
                        </div>
                        </div>
                    </div>
                    <el-pagination
                        background
                        :page-size="search1.pageSize"
                        layout="prev, pager, next"
                        @current-change="handleCurrentChange1"
                        :total="total1">
                    </el-pagination>
                </div>
            </el-tab-pane>
        </el-tabs>
    </div>
    <bottoms></bottoms>
    <el-dialog
    title="预约详情"
    :visible.sync="dialogVisible"
    width="40%">
    <span>
        <div style="margin-bottom:10px">
          <el-button size="mini" type="primary" plain v-if="state == 0">未确认</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 1">已确认</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 2">取消中</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 3">已取消</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 4">取消失败</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 5">已使用</el-button>
        </div>
        <el-input-number disabled size="small" v-model="num" :min="1" :max="10"></el-input-number>
        <el-date-picker disabled size="small" style="margin-left:20px"
        v-model="date1"
        type="date"
        placeholder="选择预约日期">
        </el-date-picker>
        <div class="attractionsInfo9" v-for="(item,index) in people">
            <el-input size="small" disabled v-model="item.name" placeholder="请输入姓名"></el-input>
            <el-input size="small" disabled style="margin-left:10px" v-model="item.tel" placeholder="请输入电话"></el-input>
            <el-input size="small" disabled style="margin-left:10px" v-model="item.idCard" placeholder="请输入身份证号"></el-input>
        </div>
    </span>
    <span slot="footer" class="dialog-footer">
        <el-button @click="close" size="small">关 闭</el-button>
        <el-button type="primary" v-if="state != 5 && state != 3 && state != 2 && state != 4" @click="editSysAttractionOrder" size="small">取消预约</el-button>
    </span>
    </el-dialog>

    <el-dialog
    title="预约详情"
    :visible.sync="dialogVisible1"
    width="40%">
    <span>
        <div style="margin-bottom:10px">
          <el-button size="mini" type="primary" plain v-if="state == 0">未确认</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 1">已确认</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 2">取消中</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 3">已取消</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 4">取消失败</el-button>
          <el-button size="mini" type="primary" plain v-if="state == 5">已使用</el-button>
        </div>
        <el-input-number disabled size="small" v-model="num" :min="1" :max="10"></el-input-number>
        <el-date-picker disabled size="small" style="margin-left:20px"
        v-model="date1"
        type="date"
        placeholder="选择预约日期">
        </el-date-picker>
        <div class="attractionsInfo9">
          <el-input size="small" disabled v-model="people1.name" placeholder="请输入姓名"></el-input>
          <el-input size="small" disabled style="margin-left:10px" v-model="people1.tel" placeholder="请输入电话"></el-input>
          <el-input size="small" disabled style="margin-left:10px" v-model="people1.idCard" placeholder="请输入身份证号"></el-input>
        </div>
    </span>
    <span slot="footer" class="dialog-footer">
        <el-button size="small" @click="close1">关 闭</el-button>
        <el-button type="primary" v-if="state != 5 && state != 3 && state != 2 && state != 4" @click="editSysHotelOrder" size="small">取消预约</el-button>
    </span>
    </el-dialog>
  </div>
</template>

<script>
  import {getSysHotelOrderPage,getSysAttractionOrderPage,editSysAttractionOrder,editSysHotelOrder} from '../../api/api'
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
        search1: {
          userId: "",
          pageSize: 12,
          pageNumber: 1,
        },
        total:100,
        tableData: [],
        total1:100,
        tableData1: [],
        activeName: "first",
        id: "",
        state: "",
        num: "",
        date1: "",
        people: [],
        people1: {},
        dialogVisible: false,
        dialogVisible1: false
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      editSysAttractionOrder() {
        var param = {
          id: this.id,
          state: 2,
        }
        editSysAttractionOrder(param).then(res => {
          if(res.code == 1000) {
            this.$message({
                message: '取消申请成功,请等待审核通过',
                type: 'success'
            });
            this.close()
            this.getSysAttractionOrderPage()
          }
        })
      },
      editSysHotelOrder() {
        var param = {
          id: this.id,
          state: 2,
        }
        editSysHotelOrder(param).then(res => {
          if(res.code == 1000) {
            this.$message({
                message: '取消申请成功,请等待审核通过',
                type: 'success'
            });
            this.close1()
            this.getSysHotelOrderPage()
          }
        })
      },
      toOrderInfo(index) {
        var data = this.tableData[index]
        this.id = data.id
        this.people = JSON.parse(data.people)
        this.num = data.num
        this.date1 = data.time
        this.state = data.state
        this.dialogVisible = true
      },
      toOrderInfo1(index) {
        var data = this.tableData1[index]
        this.id = data.id
        this.people1 = JSON.parse(data.people)
        this.num = data.num
        this.date1 = data.time
        this.state = data.state
        this.dialogVisible1 = true
      },
      close() {
        this.id = ""
        this.people = []
        this.num = ""
        this.date1 = ""
        this.state = ""
        this.dialogVisible = false
      },
      close1() {
        this.id = ""
        this.people = {}
        this.num = ""
        this.date1 = ""
        this.state = ""
        this.dialogVisible1 = false
      },
      getSysAttractionOrderPage() {
        getSysAttractionOrderPage(this.search).then(res => {
          if (res.code == 1000) {
            this.tableData = res.data.records
            this.total = res.data.total
          }
        })
      },
      getSysHotelOrderPage() {
        getSysHotelOrderPage(this.search1).then(res => {
          if (res.code == 1000) {
            this.tableData1 = res.data.records
            this.total1 = res.data.total
          }
        })
      },
      handleCurrentChange(val) {
        this.search.pageNumber = val
        this.getSysAttractionOrderPage()
      }, 
      handleCurrentChange1(val) {
        this.search1.pageNumber = val
        this.getSysHotelOrderPage()
      }, 
      handleClick(tab, event) {
        console.log(tab, event);
      }
    },
    created() {
     
    },
    mounted() {
      this.search.userId = JSON.parse(window.localStorage.getItem("user_info")).id
      this.search1.userId = JSON.parse(window.localStorage.getItem("user_info")).id
      this.getSysAttractionOrderPage()
      this.getSysHotelOrderPage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/attractions.css');
   .order {
       width: 100%;
       display: flex;
       justify-content: center;
   }
</style>