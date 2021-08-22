module.exports = {
  resolve: {
    alias: {
      jquery: 'jquery/src/jquery',
      vue: 'vue/dist/vue.js',
      // React: 'react',
      // ReactDOM: 'react-dom',
      vue_resource: 'vue-resource/dist/vue-resource'
    },
    fallback: {
      dgram: false,
      fs: false,
      net: false,
      tls: false,
      child_process: false
    }
  }
}