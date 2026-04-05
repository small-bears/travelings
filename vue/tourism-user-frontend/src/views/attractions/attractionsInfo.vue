<template>
  <div class="attractionsInfo">
    <headers></headers>
    <div class="attractionsInfo1">
        <div class="attractionsInfo2">
            <div class="attractionsInfo3">
                <el-carousel height="500px">
                    <el-carousel-item v-for="(item,index) in info.images.split(',')" :key="index">
                        <img style="width:100%;height:100%" :src="item">
                    </el-carousel-item>
                </el-carousel>
            </div>
            <div class="attractionsInfo4">
                <div class="attractionsInfo5">{{info.name}}</div>
                <div class="attractionsInfo5">价格：{{info.price}}（元）</div>
                <div style="margin-left:20px;margin-top:10px">库存：{{info.num}} -{{info.realName == 0?'非实名':'实名'}}</div>
                <div class="attractionsInfo6">{{info.introduce}}</div>
                <div class="attractionsInfo7" style="margin-left:15px">
                    <el-button size="small" type="primary" plain @click="toOrder">立即预约</el-button>
                </div>
            </div>
        </div>
    </div>
    <div class="attractionsInfo1">
        <div class="attractionsInfo8" >
            <div style="margin-left:20px;margin-right:20px;margin-top:20px">
                介绍：{{info.content}}
            </div>
            <div style="margin-left:20px;margin-right:20px;margin-top:20px">
                预约须知：{{info.open}}
            </div>
            <div style="margin-left:20px;margin-right:20px;margin-top:20px;margin-bottom:20px">
                入园时间：{{info.time}}
            </div>
        </div>
    </div>
    <div class="attractionsInfo1">
        <div class="attractionsInfo8">
            <el-input style="margin-top:20px" v-model="content" type="textarea" rows="7" placeholder="请输入评论内容"></el-input>
           <el-rate v-model="score"></el-rate>
            <el-button style="margin-top:20px" type="primary" size="small" plain @click="saveSysComments">评论</el-button>
            <div class="forum1" style="width:100%">
                <div class="forum2" style="padding:0" v-for="(item,index) in tableData" :key="index">
                    <img style="border-radius:50%;width:40px;height:40px;margin-left:20px" :src="$store.state.HOST + item.avatar">
                    <div style="margin-left:10px">
                        {{item.createBy}}
                    </div>
                    <div style="margin-left:20px">
                        {{item.content}}
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
    </div>
    <el-dialog
    title="预约"
    :visible.sync="dialogVisible"
    width="40%">
    <span>
        <el-input-number size="small" v-model="num" :min="1" :max="10"></el-input-number>
        <el-date-picker size="small" style="margin-left:20px"
        v-model="date1"
        type="date"
        value-format="yyyy-MM-dd"
        placeholder="选择预约日期">
        </el-date-picker>
        <div class="attractionsInfo9" v-for="(item,index) in people">
            <el-input size="small" v-model="item.name" placeholder="请输入姓名"></el-input>
            <el-input size="small" style="margin-left:10px" v-model="item.tel" placeholder="请输入电话"></el-input>
            <el-input size="small" v-if="info.realName == 1" style="margin-left:10px" v-model="item.idCard" placeholder="请输入身份证号"></el-input>
            <div v-if="index == (people.length - 1)" @click="addKeyword" style="margin-left:10px"><i class="el-icon-circle-plus-outline"></i></div>
            <div @click="minusKeyword(index)" style="margin-left:10px" v-if="index != 0"><i class="el-icon-remove-outline"></i></div>
        </div>
    </span>
    <span slot="footer" class="dialog-footer">
        <el-button @click="closeOrder" size="small">取 消</el-button>
        <el-button type="primary" @click="saveOrder"  size="small">确 定</el-button>
    </span>
    </el-dialog>
    <bottoms></bottoms>
  </div>
</template>

<script>
  import {getSysAttractionsById,saveSysAttractionOrder,getSysCommentsPage,saveSysComments} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        id: "",
        dialogVisible: false,
        search: {
          attractionsId: "",
          pageSize: 10,
          pageNumber: 1,
        },
        info: {},
        total:100,
        tableData: [],
        content: "",
        score: null,
        num: "",
        userId: null,
        people: [
            {
                name: "",
                tel: "",
                idCard: ""
            }
        ],
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      saveSysComments() {
          if (!this.content) {
            this.$message({
                message: '请输入评论内容',
                type: 'warning'
            });
            return
          }
          var param = {
              content: this.content,
              score:this.score,
              attractionsId: this.id,
              userId:this.userId
          }
          saveSysComments(param).then(res => {
              if (res.code == 1000) {
                this.$message({
                    message: '评论成功',
                    type: 'success'
                });
                this.content = ""
                this.getSysCommentsPage()
              }
          })
      },
      getSysCommentsPage() {
          this.search.attractionsId = this.id
          getSysCommentsPage(this.search).then(res => {
            if (res.code == 1000) {
                this.tableData = res.data.records
                this.total = res.data.total
            }
          })
      },
      closeOrder() {
        this.date1 = ""
        this.num = ""
        this.people = [
            {
                name: "",
                tel: "",
                idCard: ""
            }
        ],
        this.dialogVisible = false
      },
      saveOrder() {
          if (!this.date1) {
            this.$message({
                message: '请选择预约时间',
                type: 'warning'
            });
            return
          }
          if (this.people.length < this.num) {
            this.$message({
                message: '请完善预约人信息',
                type: 'warning'
            });
            return
          }
          if (this.people.length > this.num) {
            this.$message({
                message: '预约人信息超出预约人数',
                type: 'warning'
            });
            return
          }
          for(let i = 0;i < this.people.length; i++) {
            var item = this.people[i]
            if (!item.name) {
                this.$message({
                    message: '请完善预约人姓名',
                    type: 'warning'
                });
                return
            }
            if (!item.tel) {
                this.$message({
                    message: '请完善预约人联系方式',
                    type: 'warning'
                });
                return
            }
            if (this.info.realName == 1&& !item.idCard ) {
                this.$message({
                    message: '请完善预约人证件号',
                    type: 'warning'
                });
                return
            }
          }
          var param = {
            attractionsId: this.id,
            num: this.num,
            time: this.date1,
            people: JSON.stringify(this.people)
          }
          saveSysAttractionOrder(param).then(res => {
              if (res.code == 1000) {
                this.$message({
                    message: '预约成功，请等待确认',
                    type: 'success'
                });
                this.closeOrder()
              } else {
                this.$message({
                    message: res.message,
                    type: 'warning'
                });
              }
          })
      },
      getSysAttractionsById() {
          getSysAttractionsById({id: this.id}).then(res => {
              if (res.code == 1000) {
                  this.info = res.data
              }
          })
      },
      toOrder() {
          this.dialogVisible = true
      },
      addKeyword() {
        var param = {
            name: "",
            tel: "",
            idCard: ""
        }
        this.people.push(param)
      },
      minusKeyword(index) {
        this.people.splice(index,1)
      },
      handleCurrentChange() {

      }
    },
    created() {

    },
    mounted() {
      this.id = this.$route.query.id
      this.userId = JSON.parse(window.localStorage.getItem("user_info")).id
      this.getSysAttractionsById()
      this.getSysCommentsPage()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/attractionsInfo.css');
</style>
