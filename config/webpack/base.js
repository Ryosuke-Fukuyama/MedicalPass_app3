const { webpackConfig, merge, environment } = require('@rails/webpacker')
const customConfig = require('./custom')
// const vueConfig = require('./rules/vue')

environment.config.delete('node.dgram')
environment.config.delete('node.fs')
environment.config.delete('node.net')
environment.config.delete('node.tls')
environment.config.delete('node.child_process')

environment.config.merge(customConfig);

module.exports = merge(webpackConfig, environment, customConfig) // , vueConfig
