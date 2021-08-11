(self["webpackChunk"] = self["webpackChunk"] || []).push([["hello_vue"],{

/***/ "./app/packs/app.vue":
/*!***************************!*\
  !*** ./app/packs/app.vue ***!
  \***************************/
/***/ (function() {

throw new Error("Module parse failed: Unexpected token (1:0)\nYou may need an appropriate loader to handle this file type, currently no loaders are configured to process this file. See https://webpack.js.org/concepts#loaders\n> <template>\n|   <div id=\"app\">\n|     <p>{{ message }}</p>");

/***/ }),

/***/ "./app/packs/entrypoints/hello_vue.js":
/*!********************************************!*\
  !*** ./app/packs/entrypoints/hello_vue.js ***!
  \********************************************/
/***/ (function(__unused_webpack_module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var vue__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! vue */ "./node_modules/vue/dist/vue.runtime.esm.js");
/* harmony import */ var _app_vue__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../app.vue */ "./app/packs/app.vue");
/* harmony import */ var _app_vue__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_app_vue__WEBPACK_IMPORTED_MODULE_0__);
/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.


document.addEventListener('DOMContentLoaded', function () {
  var app = new vue__WEBPACK_IMPORTED_MODULE_1__.default({
    render: function render(h) {
      return h((_app_vue__WEBPACK_IMPORTED_MODULE_0___default()));
    }
  }).$mount();
  document.body.appendChild(app.$el);
  console.log(app);
}); // The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })

/***/ })

},
/******/ function(__webpack_require__) { // webpackRuntimeModules
/******/ var __webpack_exec__ = function(moduleId) { return __webpack_require__(__webpack_require__.s = moduleId); }
/******/ __webpack_require__.O(0, ["vendors-node_modules_vue_dist_vue_runtime_esm_js"], function() { return __webpack_exec__("./app/packs/entrypoints/hello_vue.js"); });
/******/ var __webpack_exports__ = __webpack_require__.O();
/******/ }
]);
//# sourceMappingURL=hello_vue-64847393bcce836da119.js.map