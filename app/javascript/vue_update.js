import "babel-polyfill";
import Vue          from 'vue'
import Vuex         from 'vuex'
import router       from '../router/router.js'
import axios        from 'axios'
import StatusUpdate from '../status_update.vue'
// import superagent    from 'superagent';

Vue.use(Vuex)

// 本番時適用？
// Vue.config.productionTip = false

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#select_update',
    render: h => h(StatusUpdate)
  }).$mount()
  document.getElementById('select_update').appendChild(app.$el)
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
