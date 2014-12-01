// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//
//= require foundation/foundation
//= require foundation/foundation.dropdown
//= require foundation/foundation.topbar
//= require foundation/foundation.orbit
//= require foundation/foundation.offcanvas
//
//= require turbolinks
//= require_tree .
$(document).foundation({
    orbit: {
      animation: 'fade',
      timer_speed: 3500,
      pause_on_hover: false,
      next_on_click: true,
      container_class: 'orbit-wrapper',
      animation_speed: 500,
      navigation_arrows: false,
      bullets: true,
      slide_number: false,
      timer: false
    },
    topbar: {
      scrolltop: true,
      is_hover: false
    }
  });
