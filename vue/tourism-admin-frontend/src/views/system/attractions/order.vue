<template>
  <div class="_order">
      <div class="search-table">
        <div class="search">
            <el-row :gutter="10" style="padding:10px">
                <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
                    <span class="search-title">名称:</span>
                    <el-input
                        style="margin-top:10px"
                        size="mini"
                        placeholder="请输入名称"
                        v-model="search.name">
                    </el-input>
                </el-col>
                <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
                    <span class="search-title">状态:</span>
                    <el-select clearable style="margin-top:10px" size="mini" v-model="search.state" placeholder="请选择">
                      <el-option
                        label="未确认"
                        value="0">
                      </el-option>
                      <el-option
                        label="已确认"
                        value="1">
                      </el-option>
                      <el-option
                        label="取消中"
                        value="2">
                      </el-option>
                      <el-option
                        label="已取消"
                        value="3">
                      </el-option>
                      <el-option
                        label="取消失败"
                        value="4">
                      </el-option>
                      <el-option
                        label="已使用"
                        value="5">
                      </el-option>
                    </el-select>
                </el-col>
                <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
                    <span class="search-title">预约人:</span>
                    <el-input
                        style="margin-top:10px"
                        size="mini"
                        placeholder="请输入预约人"
                        v-model="search.createBy">
                    </el-input>
                </el-col>
                <el-col :xs="24" :sm="12" :md="8" :lg="8" :xl="8">
                    <el-button style="margin-top:10px" size="mini" icon="el-icon-search" type="primary" @click="searchPage">查询</el-button>
                    <el-button style="margin-top:10px" size="mini" icon="el-icon-refresh" @click="refresh">重置</el-button>
                </el-col>
            </el-row>
        </div>
        <div class="table">
            <el-row style="padding-top:10px;margin-left:10px">
                <el-button type="danger" :disabled="update.length <= 0 ?true:false" size="mini" icon="el-icon-delete" plain @click="deleteDataBtn">删除</el-button>
            </el-row>
            <el-table
            v-loading="loading"
            :data="tableData"
            @selection-change="handleSelectionChange"
            stripe
            style="width: 100%">
            <el-table-column
              type="selection"
              width="55">
            </el-table-column>
            <el-table-column
              prop="name"
              label="名称"
              >
            </el-table-column>
            <el-table-column
              prop="num"
              label="人数"
              >
            </el-table-column>
            <el-table-column
              prop="time"
              label="预约时间"
              >
            </el-table-column>
            <el-table-column
              prop="state"
              label="状态"
              >
              <template slot-scope="scope">
                  <el-tag v-if="scope.row.state == 0">未确认</el-tag>
                  <el-tag v-if="scope.row.state == 1" type="warning">已确认</el-tag>
                  <el-tag v-if="scope.row.state == 2">取消中</el-tag>
                  <el-tag v-if="scope.row.state == 3" type="warning">已取消</el-tag>
                  <el-tag v-if="scope.row.state == 4">取消失败</el-tag>
                  <el-tag v-if="scope.row.state == 5">已使用</el-tag>
              </template> 
            </el-table-column>
            <el-table-column
              prop="createBy"
              label="-预约人"
              >
            </el-table-column>
            <el-table-column
              prop="createTime"
              label="创建时间"
              >
            </el-table-column>
            <el-table-column
              label="操作"
              width="400"
              >
              <template slot-scope="scope">
                <el-button size="mini" type="warning" @click="editSysAttractionOrder(scope.row.id,5)">已使用</el-button>
                <el-button size="mini" v-if="scope.row.state == 2" type="primary" @click="editSysAttractionOrder(scope.row.id,4)">不可取消</el-button>
                <el-button size="mini" v-if="scope.row.state == 2" type="primary" @click="editSysAttractionOrder(scope.row.id,3)">取消</el-button>
                <el-button size="mini" v-if="scope.row.state == 0" type="primary" @click="editSysAttractionOrder(scope.row.id,1)">确认</el-button>
                <el-button size="mini" type="success" @click="updateData(scope.row.id)">修改</el-button>
                <el-popconfirm
                  style="margin-left:5px"
                  confirm-button-text='确认'
                  cancel-button-text='取消'
                  icon="el-icon-info"
                  icon-color="red"
                  title="确认删除选中的数据？"
                  @confirm="deleteDate(scope.row.id)"
                >
                  <el-button size="mini" slot="reference" type="danger">删除</el-button>
                </el-popconfirm>
              </template>
            </el-table-column>
          </el-table>
          <el-pagination
            background
            layout="total, sizes, prev, pager, next, jumper"
            :page-sizes="[10, 20, 50, 100]"
            :page-size="search.pageSize"
            :current-page="search.pageNumber"
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :total="total">
          </el-pagination>
          </div>
        </div>
      <update @updateFalse="updateFalse" :updateId = "updateId" :updateVisible = "updateVisible"></update>
    </div>
  </div>
</template>

<script>
  import {getSysAttractionOrderPage,removeSysAttractionOrder,editSysAttractionOrder} from '../../../api/api' 
  import update from '../../../components/system/attractions/viewOrder'
  export default {
    data() {
      return{
        loading: true,
        update: [],
        remove: [],
        updateId: "",
        addVisible: false,
        updateVisible: false,
        search: {
            attractionsId: "",
            name: "",
            introduce: "",
            images: "",
            num: "",
            time: "",
            people: "",
            state: "",
            userId: "",
            createBy: "",
            createTime: "",
            updateBy: "",
            updateTime: "",
            pageNumber: 1,
            pageSize:10
        },
        total: 0,
        tableData: []
      }
    },
    components: {
      update
    },
    methods: {
      editSysAttractionOrder(id,state) {
        var param = {
          id: id,
          state: state
        }
        editSysAttractionOrder(param).then(res => {
          if (res.code == 1000) {
            this.query()
          }
        })
      },
      searchPage() {
        this.search.pageNumber = 1
        this.query()
      },
      query() {
        getSysAttractionOrderPage(this.search).then(res => {
          if(res.code == 1000) {
            this.tableData = res.data.records
            this.total = res.data.total
            this.loading = false
          } else {
            this.$notify.error({
              title: '错误',
              message: res.message
            });
          }
        })
      },
      refresh() {
        this.search.attractionsId = ""
        this.search.name = ""
        this.search.introduce = ""
        this.search.images = ""
        this.search.num = ""
        this.search.people = ""
        this.search.state = ""
        this.search.userId = ""
        this.search.createBy = ""
        this.search.updateBy = ""
        this.query()
      },
      handleCurrentChange(val) {
        this.search.pageNumber = val
        this.query()
      },
      handleSizeChange(val) {
        this.search.pageSize = val
        this.query()
      },
      handleSelectionChange(val) {
        this.update = []
        this.remove = []
        for (let i = 0;i < val.length;i++) {
          var item = val[i]
          this.update.push(item.id)
          this.remove.push(item.id)
        }
      },
      updateFalse() {
        this.updateId = ''
        this.updateVisible = false
        this.query()
      },
      updateData(id) {
        this.updateId = id
        this.updateVisible = true
      },
      updateDataBtn() {
        this.updateData(this.update[0])
      },
      deleteDataBtn() {
        this.$confirm('确定删除选中的'+ this.remove.length +'条数据?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.deleteDate(this.remove.join(","))
        }).catch(() => {
                 
        });
      },
      deleteDate(ids) {
        removeSysAttractionOrder({ids:ids}).then(res => {
            if(res.code == 1000) {
              this.$message({
                type: 'success',
                message: '删除成功!'
              });
              this.query()
            } else {
              this.$notify.error({
                title: '错误',
                message: res.message
              });
            }
          })
      },
    },
    mounted() {
      this.query()
    }
 }
</script>
<style lang=scss scoped>
  .search-table {
      width: 100%;
  }
  .search {
      background: #ffffff;
      border-radius: 7px;
      box-shadow: 0 2px 12px 0 rgba(0,0,0,.1)
  }
  .table {
      background: #ffffff;
      border-radius: 7px;
      box-shadow: 0 2px 12px 0 rgba(0,0,0,.1);
      margin-top: 10px
  }
  .el-col {
      display: flex;
      flex-direction: row;
      align-items: center;
  }
  .search-title {
      font-family: '黑体';
      float: right;
      white-space: nowrap;
      font-size: 14px;
      margin-top:10px;
      width: 63px;
      text-align: right;
  }
  .el-table {
      padding: 10px;
  }
  .el-dialog__header {
    border-bottom: 1px solid #F4F8F9 !important;
  }
  .el-dialog {
    border-radius: 10px!important;
  }
</style>