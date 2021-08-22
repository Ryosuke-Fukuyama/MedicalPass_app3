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
  data: function () {
    const id = $(this).data('id');
    const health_interview_id = $(this).data('health-interview-id');
    return {
      // guide_labels: [],
      id: id,
      status: '',
      health_interview_id: health_interview_id
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
      }
    },
  },

  computed: {
    // none
  }
}

</script>