<template>
<div>
  <el-dialog title="新增景点" width="40%" :destroy-on-close="true" :visible.sync="addVisible" :before-close="handleClose">
    <el-form :model="form" :rules="rules" ref="ruleForm">
      <el-row :gutter="10">
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                名称:
                </span>
            <div style="width:100%">
                <el-form-item prop="name" style="margin-bottom:0">
                    <el-input v-model="form.name" size="mini" placeholder="请输入名称" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                价格:
                </span>
            <div style="width:100%">
                <el-form-item prop="price" style="margin-bottom:0">
                    <el-input type="number" v-model="form.price" size="mini" placeholder="请输入价格" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                简介:
                </span>
            <div style="width:100%">
                <el-form-item prop="introduce" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.introduce" size="mini" placeholder="请输入简介" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                介绍:
                </span>
            <div style="width:100%">
                <el-form-item prop="content" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.content" size="mini" placeholder="请输入介绍" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                库存:
                </span>
            <div style="width:100%">
                <el-form-item prop="num" style="margin-bottom:0">
                    <el-input type="number" v-model="form.num" size="mini" placeholder="请输入库存" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                实名:
                </span>
            <div style="width:100%">
                <el-form-item prop="realName" style="margin-bottom:0">
                    <el-radio v-model="form.realName" label="0">关闭</el-radio>
                    <el-radio v-model="form.realName" label="1">开启</el-radio>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                图片:
                </span>
            <div style="width:100%">
                <el-form-item prop="images" style="margin-bottom:0">
                    <el-upload
                        :file-list="fileList"
                        ref="upload"
                        :action="uploadImageUrl()"
                        accept="image/*"
                        :multiple="false"
                        :limit="5"
                        :before-upload="beforeAvatorUpload"
                        list-type="picture-card"
                        :on-preview="handlePictureCardPreview"
                        :on-exceed="handleExceed"
                        :on-success="handleAvatorSuccess"
                        :on-remove="handleRemove">
                        <i class="el-icon-plus"></i>
                    </el-upload>
                    <el-dialog title="预览" :visible.sync="dialogVisible">
                        <img width="100%" :src="dialogImageUrl" alt="">
                    </el-dialog>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                预约须知:
                </span>
            <div style="width:100%">
                <el-form-item prop="open" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.open" size="mini" placeholder="请输入预约须知" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                入园时间:
                </span>
            <div style="width:100%">
                <el-form-item prop="time" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.time" size="mini" placeholder="请输入入园时间" autocomplete="off"></el-input>
                </el-form-item>
            </div>
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
  import {mixin} from "../../../minix";
  import {saveSysAttractions} from '../../../api/api'
  export default {
    mixins: [mixin],
    data() {
      return{
        formLabelWidth: '80px',
        form: {
          name: "",
          price: "",
          introduce: "",
          content: "",
          num: "",
          realName: "0",
          images: "",
          open: "",
          time: "",
        },
        fileList: [],
        dialogImageUrl: '',
        dialogVisible: false,
        rules: {
          name: [
            { required: true, message: '请输入名称', trigger: 'blur' },
          ],
          price: [
            { required: true, message: '请输入价格', trigger: 'blur' },
          ],
          introduce: [
            { required: true, message: '请输入简介', trigger: 'blur' },
          ],
          content: [
            { required: true, message: '请输入介绍', trigger: 'blur' },
          ],
          num: [
            { required: true, message: '请输入库存', trigger: 'blur' },
          ],
          realName: [
            { required: true, message: '请选择实名', trigger: 'blur' },
          ],
          images: [
            { required: true, message: '请上传图片', trigger: 'blur' },
          ],
          open: [
            { required: true, message: '请输入预约须知', trigger: 'blur' },
          ],
          time: [
            { required: true, message: '请输入入园时间', trigger: 'blur' },
          ],
        },
      }
    },
    props: ['addVisible'],
    methods: {
      handleAvatorSuccess(res) {
        let _this = this;
        if(res.code == 1000){
            _this.$message({
              type: 'success',
              message: '上传成功!'
            });
            this.fileList.push({url:this.$store.state.configure.HOST + res.message})
        }else{
          _this.$notify.error({
            title: '错误',
            message: res.message
          });
        }
      },
      handleRemove(file, fileList) {
        this.fileList = fileList
      },
      handlePictureCardPreview(file) {
        this.dialogImageUrl = file.url;
        this.dialogVisible = true;
      },
      submit() {
        var file = []
        for(let i = 0;i < this.fileList.length;i++) {
            file.push(this.fileList[i].url)
        }
        this.form.images = file.join(",")
        this.$refs["ruleForm"].validate((valid) => {
          if (valid) {
            saveSysAttractions(this.form).then(res => {
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
        this.form = {
          name: "",
          price: "",
          introduce: "",
          content: "",
          num: "",
          realName: "0",
          images: "",
          open: "",
          time: "",
        },
        this.fileList = []
        this.$emit("addFalse")
      },
     
    },
    created() {
     
    },
    mounted() {
      
    }
 }
</script>

<style lang=scss scoped>
  .el-col {
      display: flex;
      flex-direction: row;
      align-items: center;
      margin-top: 24px
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