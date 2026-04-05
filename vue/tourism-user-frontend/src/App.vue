<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style>
  html,body,#app,.common-layout{
    margin: 0;
    padding: 0;
    height:100%;
  }
  .xiaoshi {
    display: none;
  }
  body::-webkit-scrollbar {
      width: 0px;
      height: 0px;
  }
  //滚动条的宽度
  ::-webkit-scrollbar {
    width: 8px;
    height: 8px;
    background-color: #e4e4e4;
    border-radius: 6px;
  }
  //滚动条的滑块
  ::-webkit-scrollbar-thumb {
    background-color: #a1a3a9;
    border-radius: 6px;
  }
  .el-pagination {
    padding-bottom:10px!important;
    padding-top:10px!important;
    display:flex;
    justify-content: flex-end
  }
    // 对话框圆角
  .el-dialog__wrapper {
    .el-dialog {
      border-radius: 8px;
    }
  }
  .el-dialog__title {
    font-size: 14px !important;
    font-family: "黑体";
  }
  // 对话框样式
  .el-dialog__header {
    border-bottom: 1px solid #e3e8ee;
  }
 
</style>
