import "babel-polyfill";
import Vue from 'vue'
import StatusUpdate from '../status_update.vue'
// import superagent    from 'superagent';


document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(StatusUpdate)
  }).$mount()
  document.getElementById('ajax_rendering').appendChild(app.$el)
})

// const token = document.getElementsByName('csrf-token')[0].getAttribute('content')

// window.onload = function(){
//   var guide_label = new Vue({
//     el: "#guide_label",
//     data: {
//       statuses: []
//     },
//     created: function() {
//       superagent
//       .get(`/health_interviews/index.json`)
//       .set('X-CSRF-Token', token)
//       .set('Accept', 'application/json')
//       .end(function(error, data){
//         guide_label.$data.statuses = data.body.statuses
//       })
//     }
//   })
// }
