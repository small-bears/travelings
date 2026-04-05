<template>
<div>
  <el-dialog title="编辑酒店预约" width="40%" :destroy-on-close="true" :visible.sync="updateVisible" :before-close="handleClose">
    <el-form :model="form" :rules="rules" ref="ruleForm">
      <el-row :gutter="10">
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                酒店id:
                </span>
            <el-form-item prop="hotelId" style="margin-bottom:0">
                <el-input v-model="form.hotelId" size="mini" placeholder="请输入酒店id" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                名称:
                </span>
            <el-form-item prop="name" style="margin-bottom:0">
                <el-input v-model="form.name" size="mini" placeholder="请输入名称" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                简介:
                </span>
            <el-form-item prop="introduce" style="margin-bottom:0">
                <el-input v-model="form.introduce" size="mini" placeholder="请输入简介" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                图片:
                </span>
            <el-form-item prop="images" style="margin-bottom:0">
                <el-input v-model="form.images" size="mini" placeholder="请输入图片" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                人数:
                </span>
            <el-form-item prop="num" style="margin-bottom:0">
                <el-input v-model="form.num" size="mini" placeholder="请输入人数" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">预约时间:</span>
             <el-form-item prop="time" style="margin-bottom:0">
                <el-date-picker size="mini"
                  v-model="form.time"
                  type="date"
                  placeholder="预约时间">
                </el-date-picker>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                信息:
                </span>
            <el-form-item prop="people" style="margin-bottom:0">
                <el-input v-model="form.people" size="mini" placeholder="请输入信息" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                状态:
                </span>
            <el-form-item prop="state" style="margin-bottom:0">
                <el-input v-model="form.state" size="mini" placeholder="请输入状态" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                用户id:
                </span>
            <el-form-item prop="userId" style="margin-bottom:0">
                <el-input v-model="form.userId" size="mini" placeholder="请输入用户id" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                房型id:
                </span>
            <el-form-item prop="itemId" style="margin-bottom:0">
                <el-input v-model="form.itemId" size="mini" placeholder="请输入房型id" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                房型:
                </span>
            <el-form-item prop="itemName" style="margin-bottom:0">
                <el-input v-model="form.itemName" size="mini" placeholder="请输入房型" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
        <el-col :xs="24" :sm="24" :md="12" :lg="12" :xl="12">
            <span class="search-title">
                价格:
                </span>
            <el-form-item prop="price" style="margin-bottom:0">
                <el-input v-model="form.price" size="mini" placeholder="请输入价格" autocomplete="off"></el-input>
            </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button size="mini" type="primary" @click="submit">确 定</el-button>
      <el-button size="mini" @click="handleClose">取 消</el-button>
    </div>
  </el-dialog>
</div>
</template>

<script>
  import {editSysHotelOrder,getSysHotelOrderById} from '../../../api/api'
  export default {
    data() {
      return{
        formLabelWidth: '80px',
        form: {
          hotelId: "",
          name: "",
          introduce: "",
          images: "",
          num: "",
          time: "",
          people: "",
          state: "",
          userId: "",
          itemId: "",
          itemName: "",
          price: "",
        },
        rules: {
        },
      }
    },
    props: ['updateVisible','updateId'],
    methods: {
      submit() {
        this.$refs["ruleForm"].validate((valid) => {
          if (valid) {
            editSysHotelOrder(this.form).then(res => {
              if(res.code == 1000) {
                this.$notify.success({
                  title: '成功',
                  message: "保存成功"
                });
                this.handleClose();
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
      handleClose() {
        this.$emit("updateFalse")
      },
     
    },
    created() {
     
    },
    mounted() {
      
    },
    watch: {
      updateId(newVal) {
        if(newVal) {
          getSysHotelOrderById({id:newVal}).then(res => {
            if(res.code == 1000) {
              this.form = res.data
              this.form.num = res.data.num + ""
              this.form.state = res.data.state + ""
            } else {
              this.$notify.error({
                title: '错误',
                message: res.message
              });
            }
          })
        }
        
      }
    }
 }
</script>

<style lang=scss scoped>
  .el-col {
      display: flex;
      flex-direction: row;
      align-items: center;
      margin-top: 12px
  }
  .search-title {
      font-family: '黑体';
      float: right;
      white-space: nowrap;
      font-size: 14px;
      width: 84px;
      text-align: right;
  }
  .el-tree {
      border: 1px solid #BDC1C9;
  }
</style>