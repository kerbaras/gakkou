// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .
//= require bootstrap-datepicker

$(() => {
  $(".datepicker").datepicker({
    format: "yyyy-mm-dd"
  })

  $(".message .notice").fadeOut(6000)

  let assistances = document.querySelectorAll(".test-table tbody .test")
  let pops = document.querySelectorAll(".test-table tbody .test .popconfirm")
  assistances.forEach(assistance => {
    let popconfirm = assistance.querySelector(".popconfirm")
    let btnClose = popconfirm.querySelector(".cls")

    assistance.onclick = function () {
      pops.forEach(p => p.classList.remove("open"))
      popconfirm.classList.add("open")
    }

    btnClose.onclick = function(){
      pops.forEach(p => p.classList.remove("open"))
    }
  })
})
