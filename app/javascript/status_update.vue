<template>

  <select placeholder="status" v-model="guide_label.status">
    <option
      v-for="status in statuses"
      :key="status"
      :label="status"
      :value="status"
    >
    {{ status.text }}
    </option>
  </select>
<!--
  <select status="guide_label[health_interview_id]" id="guide_label_id">
    <option v-for="cat in guide_labels" :value="cat.code">
      {{ cat.status }}
    </option>
  </select>

  <f.select v-model="selected">
    <option v-for="option in options" v-bind:value="option.value">
      {{ option.text }}
    </option>
  </select>
-->
</template>

<script>

import 'formdata-polyfill'
import "fetch-polyfill";
import axios from 'axios';

export default {
  //  データ定義
  data: function () {
    return {
      guide_labels: [],
      id: id,
      status: '',
      health_interview_id: health_interview_id,
      message: 'ここに「Ajax」に関するメッセージが表示。'
    }
  },
  //  Ajax通信(送信用)
  mounted() {
    axios.get('/health_interviews/index.json')
      .then(response => (this.guide_labels = response.data))
  },
  methods: {
  //   run_ajax: function(method, url, data) {
  //     fetch(url,
  //          {
  //            method: method,
  //            body: JSON.stringify(data),
  //            headers:{
  //             'Content-Type': 'application/json',
  //             'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('status')
  //            }
  //          })
  //       .then(res => res.json())
  //       .then(
  //         (result) => {
  //           this.status = "サーバーからのメッセージ(" +
  //                         this.formatConversion(new Date())  + ") ：" + result.registration;
  //           // 新規登録時のみIDなどが返却される
  //           if(result.id){
  //             // 失敗
  //             if(result.id == "error"){
  //               // エラー制御は行っていないので各自で。

  //             // 成功
  //             }else{
  //               // 先頭にアイテムを追加する
  //               this.items.unshift({id: result.id,
  //                                   name: result.name,
  //                                   comment: result.comment,
  //                                   updated_at: result.updated_at}
  //                                  );
  //               this.mode.unshift(false);
  //             }
  //           // 更新/削除
  //           }else{
  //             // エラー制御は行っていないので各自で。
  //           }

  //         },
  //         (error) => {
  //           this.status = error.message;
  //         }
  //       )
  //       .catch((error) => {
  //            this.status = error.message;
  //         }
  //       );
  //   },

    //  データの更新
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