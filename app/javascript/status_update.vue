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
  mounted() {
    axios.get('/health_interviews/index.json')
      .then(response => (this.guide_labels = response.data))
  },
  methods: {
    handleUpdate: function (index, id, event) {
      const form_data = new FormData(event.target);

      const status = form_data.get('status');

      if (
          (!(this.items[index].status == status))
         ){

        this.$root.$set(this.items[index], "status", status);
        this.$root.$set(this.items[index], "updated_at", new Date());
        this.run_ajax("PUT",
                      "http://localhost:3000/health_interviews/" ,
                      {guide_label: {status: status}}
                     );
      }
    },
  },

  computed: {
    // none
  }
}

</script>