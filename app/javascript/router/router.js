import Vue            from 'vue'
import VueRouter      from 'vue-router'

Vue.use(VueRouter)

binding.irb
const hospital_id = this.hospital_id
const routes = [
  { path: '/hospital/${hospital_id}/health_interviews',  name: 'Health_interviews', component: Health_interviews },
];

export default new VueRouter({ routes });