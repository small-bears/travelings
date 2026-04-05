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
                <div class="" style="margin-top: 10px;margin-left: 20px;">所属景区：{{info.attractions}}</div>
                <div class="" style="margin-top: 10px;margin-left: 20px;">地址：{{info.address}}</div>
                <div class="attractionsInfo6">{{info.introduce}}</div>
                <div class="attractionsInfo7" style="margin-left:10px">
                    <el-button size="small" type="primary" plain @click="toOrder">立即预定</el-button>
                </div>
            </div>
        </div>
    </div>
    <el-dialog
    title="预定"
    :visible.sync="dialogVisible"
    width="40%">
    <span>
        <div>
            <el-radio style="margin-top:10px" v-for="(item,index) in hotel" :key="index" size="small" v-model="radio1" :label="item.id" border>{{item.name}} - 数量{{item.num}} - 价格{{item.price}}</el-radio>
        </div>
        <el-input-number style="margin-top:10px" size="small" v-model="num" :min="1" :max="10"></el-input-number>
        <el-date-picker size="small" style="margin-left:20px;margin-top:10px"
        v-model="date1"
        type="date"
        value-format="yyyy-MM-dd"
        placeholder="选择预定日期">
        </el-date-picker>
        <div class="attractionsInfo9">
            <el-input size="small" v-model="people.name" placeholder="请输入姓名"></el-input>
            <el-input size="small" style="margin-left:10px" v-model="people.tel" placeholder="请输入电话"></el-input>
            <el-input size="small" style="margin-left:10px" v-model="people.idCard" placeholder="请输入身份证号"></el-input>
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
  import {getSysHotelById,getSysHotelItemList,saveSysHotelOrder} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        id: "",
        dialogVisible: false,
        content: "",
        date1: "",
        num: "",
        people:{
            name: "",
            tel: "",
            idCard: ""
        },
        info: {},
        hotel: [],
        radio1: ""
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      getSysHotelItemList() {
        getSysHotelItemList({id:this.id}).then(res => {
          if (res.code == 1000) {
            this.hotel = res.data
          }
        })
      },
      closeOrder() {
        this.date1 = ""
        this.num = ""
        this.radio1 = ''
        this.people = 
        {
          name: "",
          tel: "",
          idCard: ""
        }
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
          if (!this.people.name) {
              this.$message({
                  message: '请完善预约人姓名',
                  type: 'warning'
              });
              return
          }
          if (!this.people.tel) {
              this.$message({
                  message: '请完善预约人联系方式',
                  type: 'warning'
              });
              return
          }
          if (!this.people.idCard ) {
              this.$message({
                  message: '请完善预约人证件号',
                  type: 'warning'
              });
              return
          }
          if (!this.radio1 ) {
              this.$message({
                  message: '请选择房型',
                  type: 'warning'
              });
              return
          }
          var param = {
            hotelId: this.id,
            num: this.num,
            itemId: this.radio1,
            time: this.date1,
            people: JSON.stringify(this.people)
          }
          saveSysHotelOrder(param).then(res => {
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
      getSysHotelById() {
        getSysHotelById({id:this.id}).then(res => {
          if (res.code == 1000) {
            this.info = res.data
          }
        })
      },
      toOrder() {
        this.dialogVisible = true
      },
    },
    created() {
     
    },
    mounted() {
      this.id = this.$route.query.id
      this.getSysHotelById()
      this.getSysHotelItemList()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/attractionsInfo.css');
</style>