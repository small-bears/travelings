<template>
  <div class="forumInfo">
    <headers></headers>
    <div class="forumInfo1">
        <div class="forumInfo2">
            <div class="forumInfo3">
                {{info.title}}
            </div>
            <div class="forumInfo4" v-html="info.content">
                
            </div>
        </div>
    </div>
    <bottoms></bottoms>
  </div>
</template>

<script>
  import {getSysForumById} from '../../api/api'
  import headers from '@/components/header'
  import bottoms from '@/components/bottom'
  export default {
    data() {
      return{
        id: "",
        info: {},
      }
    },
    components: {
      headers,
      bottoms
    },
    methods: {
      getSysForumById() {
        getSysForumById({id: this.id}).then(res => {
          if (res.code == 1000) {
            this.info = res.data
          }
        })
      },
    },
    created() {
     
    },
    mounted() {
      this.id = this.$route.query.id
      this.getSysForumById()
    }
 }
</script>

<style scoped>
   @import url('../../assets/css/forumInfo.css');
  ::v-deep img {
    max-width: 100% !important;
  }
</style>