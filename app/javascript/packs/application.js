console.log('Hello World from Webpacker')

// import "babel-polyfill";
import Vue from 'vue'
// import Vuex         from 'vuex'
// import App from './App.vue'
import SelectStatus from '../components/SelectStatus.vue'
// import SendMail       from '../components/SendMail.vue'
// import Router from '../router/router.js'

// Vue.use(Vuex)

// 本番時適用？
// Vue.config.productionTip = false

// const app = new Vue({
//   el: '#app',
//   router: Router,
//   render: h => h(App)
// })

// const token = document.getElementsByName('csrf-token')[0].getAttribute('content')
document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
  //   el: '#select_status',
  //   data: {
  //     guide_label: {
  //       id,
  //       health_interview_id,
  //       status: [],
  //     }
  //   },
  //   updated: function() {
  //     superagent
  //       .get(`/health_interviews/index.json`)
  //       .set('X-CSRF-Token', token)
  //       .set('Accept', 'application/json')
  //       .end(function(error, data){
  //         guide_label.$data.statuses = data.body.statuses
  //       })
  //   },
    render: h => h(SelectStatus)
  }).$mount function()
  document.getElementById('select_status').appendChild(app.$el)
})
