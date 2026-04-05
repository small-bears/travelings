<template>
<div>
  <el-dialog title="新增旅游线路" width="40%" :destroy-on-close="true" :visible.sync="addVisible" :before-close="handleClose">
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
                温度:
                </span>
            <div style="width:100%">
                <el-form-item prop="temperature" style="margin-bottom:0">
                    <el-input type="number" v-model="form.temperature" size="mini" placeholder="请输入温度" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                地理情况:
                </span>
            <div style="width:100%">
                <el-form-item prop="geography" style="margin-bottom:0">
                    <el-input v-model="form.geography" size="mini" placeholder="请输入地理情况" autocomplete="off"></el-input>
                </el-form-item>
            </div>
        </el-col>
        <el-col :xs="24" :sm="24" :md="24" :lg="24" :xl="24">
            <span class="search-title">
                介绍:
                </span>
            <div style="width:100%">
                <el-form-item prop="introduce" style="margin-bottom:0">
                    <el-input type="textarea" v-model="form.introduce" size="mini" placeholder="请输入介绍" autocomplete="off"></el-input>
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
                内容:
                </span>
            <div style="width:100%">
                <el-form-item prop="content" style="margin-bottom:0">
                    <quill-editor ref="myQuillEditor" :options="editorOption"
                    v-model="form.content"/>
                    <el-upload class="Quill-uploader" :show-file-list="false" accept="image/*" v-show="0" ref="updateUpload" :multiple="false" :action="uploadImageUrl()"
                        :on-success="handleQillSuccess">
                    </el-upload>
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
  import { mixin } from '../../../minix/index';
  import {saveSysLine} from '../../../api/api'
  export default {
    mixins: [mixin],
    data() {
      return{
        fileList: [],
        dialogImageUrl: '',
        dialogVisible: false,
        formLabelWidth: '80px',
        form: {
          introduce: "",
          images: "",
          name: "",
          content: "",
          temperature: "",
          geography: "",
        },
        editorOption: {
          placeholder: "请输入文字内容",
          modules: { 
            toolbar: {
                container: [
                    ["bold", "italic", "underline", "strike"], 
                    ["blockquote", "code-block"], 
                    [{ header: 1 }, { header: 2 }], 
                    [{ list: "ordered" }, { list: "bullet" }], 
                    [{ script: "sub" }, { script: "super" }], 
                    [{ indent: "-1" }, { indent: "+1" }], 
                    [{ direction: "rtl" }], 
                    [{ size: ["small", false, "large", "huge"] }], 
                    [{ header: [1, 2, 3, 4, 5, 6, false] }], 
                    [{ color: [] }, { background: [] }], 
                    [{ font: [] }], [{ align: [] }], 
                    ["clean"], ["image"]
                ],
                handlers: {
                    'image': function ( value ) {
                        if ( value ) {
                            // 触发上传插件
                            document.querySelector('.Quill-uploader .el-upload__input').click()
                        } else {
                            this.quill.format( 'image', false );
                        }
                    }
                }
            },
            syntax: { 
                highlight: text => { 
                    return hljs.highlightAuto(text).value; // 这里就是代码高亮需要配置的地方 
                }
            }
          }
        },
        rules: {
          name: [
            { required: true, message: '请输入名称', trigger: 'blur' },
          ],
          content: [
            { required: true, message: '请输入内容', trigger: 'blur' },
          ],
          introduce: [
            { required: true, message: '请输入介绍', trigger: 'blur' },
          ],
          images: [
            { required: true, message: '请上传图片', trigger: 'blur' },
          ],
          temperature: [
            { required: true, message: '请输入温度', trigger: 'blur' },
          ],
          geography: [
            { required: true, message: '请输入地理情况', trigger: 'blur' },
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
      handleQillSuccess(res){
          let _this = this;
          if(res.code == 1000){
              _this.$notify({
                  title: '上传成功',
                  type: 'success'
              });
              let imgurl = this.$store.state.configure.HOST + res.message
              let quill = this.$refs.myQuillEditor.quill
              let position = quill.getSelection().index
              quill.insertEmbed(position, 'image', imgurl)
              quill.setSelection(position + 1)
          }else{
              _this.$notify({
                  title: '上传失败',
                  type: 'error'
              });
          }
      },
      submit() {
        var file = []
        for(let i = 0;i < this.fileList.length;i++) {
            file.push(this.fileList[i].url)
        }
        this.form.images = file.join(",")
        this.$refs["ruleForm"].validate((valid) => {
          if (valid) {
            saveSysLine(this.form).then(res => {
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
          content: "",
          introduce: "",
          images: "",
          temperature: "",
          geography: "",
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