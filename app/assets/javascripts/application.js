// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap-sprockets
//= require_tree .

$(window).scroll(function () {
    if ($(this).scrollTop() > 125) {
       $('#navbar').addClass('show_bgcolor')
   } else {
       $('#navbar').removeClass('show_bgcolor')
   }
})
$(function(){
    // 初始化轮播
    $(".start-slide").click(function(){
        $("#myCarousel").carousel('cycle');
    });
    // 停止轮播
    $(".pause-slide").click(function(){
        $("#myCarousel").carousel('pause');
    });
    // 循环轮播到上一个项目
    $(".prev-slide").click(function(){
        $("#myCarousel").carousel('prev');
    });
    // 循环轮播到下一个项目
    $(".next-slide").click(function(){
        $("#myCarousel").carousel('next');
    });
    });
/*===== Welcome#index - 回到頁面頂端 =====*/
if ($(this).scrollTop() > 2500) {
  $(".goTop").fadeIn(100); //按钮出现时间（画面下移）
} else {
  $(".goTop").fadeOut(200); //按钮消失时间（画面上移）
}

$(".goTop").click(
  function() {
    $('html,body').scrollTop(0);
  });
})
