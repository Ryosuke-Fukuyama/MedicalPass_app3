<template>
  <div>
    <select name="guide_label[status_id]" id="guide_label_status_id" placeholder="status" v-model="guide_label.status">
      <option v-for="status in statuses" :key="status" :label="status" :value="status">
        {{ status.text }}
      </option>
    </select>
  </div>
</template>

<script>
  import axios from 'axios';
  // import 'formdata-polyfill'
  // import "fetch-polyfill";

  export default {
    // name: 'SelectStatus',
    data: function () {
      // const id = $(this).data('id');
      // const health_interview_id = $(this).data('health-interview-id');
      return {
        // id: this.$route.params.id,
        // health_interview_id: this.$route.params.health-interview-id,
        guide_label: {
          // id: '',
          // health_interview_id: '',
          status: [],
        },
      }
    },
    mounted: function () {
      // this.setSelectStatus(this.id);
      var hospital_id = this.health-interview.hospital-id
      axios.get('/hospital/${hospital_id}/api/health_interviews/index.json')
        .then(response => (this.health_interview = response.data))
    },
    methods: {
    //   updateHealthInterview(id) {
    //     if (!this.health_interview.guide_label.status) return;
    //     axios.put(`/api/health_interviews/${id}`, { health_interview: this.health_interview }).then((res) => {
    //       this.$router.push({ path: '/hospital/${hospital_id}/health_interviews' });
    //     }, (error) => {
    //       console.log(error);
    //     });
    //   },

      handleUpdate: function (index, id, event) {
        const form_data = new FormData(event.target);
        const txt_status = form_data.get('txt_status');

        if (
            (!(this.items[index].status == txt_status))
          ){
          this.$select_sratus.$set(this.items[index], "status", txt_status);
          this.$select_sratus.$set(this.items[index], "updated_at", new Date());

          this.run_ajax("PUT",
                      "http://localhost:5000/hospital/" + hospital_id + "/api/health_interviews",
                      {:health_interview {guide_label: {status: txt_status}}}
                     );
          }
      }
    },

    computed: {
      // none
    }
  }
</script>