<template>
  <el-select placeholder="status" v-model="guide_label.status">
    <el-option
      v-for="status in statuses"
      :key="status"
      :label="status"
      :value="status"
    >
  </el-select>

<!-- <select status="guide_label[health_interview_id]" id="guide_label_id">
  <option v-for="cat in guide_labels" :value="cat.code">
    {{ cat.status }}
  </option>
</select>

<f.select v-model="selected">
  <option v-for="option in options" v-bind:value="option.value">
    {{ option.text }}
  </option>
</select>

  :status,
    GuideLabel.statuses_i18n.invert,
    { selected: h_i.guide_label.status },
    health_interviews_path ,remote: true, -->
</template>

<script>

  import axios from 'axios';

  export default {
    data() {
      return {
        guide_labels: []
      }
    },
    mounted() {
      axios.get('/api/health_interviews/index.json')
        .then(response => (this.guide_labels = response.data))
    }
  }

  export default {

  // ---------------------
  //  データ定義
  // ---------------------
  data: function () {
    return {
      items: [],    // アイテム
      mode: [],     // アイテムのモード(表示/編集)
      name: '',     // 投稿 - 名前
      comment: '',  // 投稿 - コメント
      status: 'ここに「Ajax」に関するメッセージが表示されます。'
    }
  },

  methods: {

    // ---------------------
    //  Ajax通信(送信用)
    // ---------------------
    run_ajax: function(method, url, data) {

      fetch(url,
           {
             method: method,
             body: JSON.stringify(data),
             headers:{
              // JSON
              'Content-Type': 'application/json',
              // CSRFトークン
              'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('status')
             }
           })
        .then(res => res.json())
        .then(
          (result) => {

            this.status = "サーバーからのメッセージ(" +
                          this.formatConversion(new Date())  + ") ：" + result.registration;

            // 新規登録時のみIDなどが返却される
            if(result.id){

              // 失敗
              if(result.id == "error"){

                // エラー制御は行っていないので各自で。

              // 成功
              }else{
                // 先頭にアイテムを追加する
                this.items.unshift({id: result.id,
                                    name: result.name,
                                    comment: result.comment,
                                    updated_at: result.updated_at}
                                   );
                this.mode.unshift(false);
              }
            // 更新/削除
            }else{
              // エラー制御は行っていないので各自で。
            }

          },
          (error) => {
            this.status = error.message;
          }
        )
        .catch((error) => {
             this.status = error.message;
          }
        );
    },

    // ---------------------
    //  データの更新
    // ---------------------
    handleUpdate: function (index, id, event) {
      const form_data = new FormData(event.target);

      const txt_name = form_data.get('txt_name');
      const txt_comment = form_data.get('txt_comment');

      if (
          (txt_name && txt_comment) &&
          (!(this.items[index].name == txt_name &&
             this.items[index].comment == txt_comment))
         ){

        this.$root.$set(this.items[index], "name", txt_name);
        this.$root.$set(this.items[index], "comment", txt_comment);
        this.$root.$set(this.items[index], "updated_at", new Date());

        // Ajax
        this.run_ajax("PUT",
                      "http://localhost:3000/vue_crud_data/"  + id ,
                      {datum: {name: txt_name, comment: txt_comment}}
                     );
      }
    },
  },

  computed: {
    // none
  }
}

</script>


<!-- <script>
  new Vue({
    el: '#form',
    data: function() {
      // <script> 要素として書き込まれたデータを読み込む
      return JSON.parse(document.getElementById('server_side_data').textContent)
    }
  })
</script>

<script src="https://unpkg.com/vue"></script>
<script>
    var ajax_status_update = new Vue({
      el: '#ajax_status_update',
      data: {
        guide_label: {
          id: id,
          health_interview_id: health_interview_id,
          status: status
        } +
        guide_label.update
      }
    })
</script> -->