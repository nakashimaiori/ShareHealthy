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
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets

//= require froala_editor.min.js
//= require plugins/align.min.js
//= require plugins/char_counter.min.js
//= require plugins/code_beautifier.min.js
//= require plugins/code_view.min.js
//= require plugins/colors.min.js
//= require plugins/emoticons.min.js
//= require plugins/entities.min.js
//= require plugins/file.min.js
//= require plugins/font_family.min.js
//= require plugins/font_size.min.js
//= require plugins/fullscreen.min.js
//= require plugins/image.min.js
//= require plugins/image_manager.min.js
//= require plugins/inline_style.min.js
//= require plugins/line_breaker.min.js
//= require plugins/link.min.js
//= require plugins/lists.min.js
//= require plugins/paragraph_format.min.js
//= require plugins/paragraph_style.min.js
//= require plugins/quick_insert.min.js
//= require plugins/quote.min.js
//= require plugins/save.min.js
//= require plugins/table.min.js
//= require plugins/url.min.js
//= require plugins/video.min.js
//= require chartkick
//= require Chart.bundle
//= require_tree .

// -----------------------------------------------------------
$(function(){
    $(document).on('change', '.image-prev', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $(".profile_image").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
});
});


$(document).on("turbolinks:load", function(){
  // $('.form-froala').froalaEditor({
  //   heightMin: 500,
  //   heightMax: 750,
  // })

  $('#nav_btn').on('click', function(event) {
    $("body").toggleClass("nav_open");// .menu-triggerクリック時に行われる処理
  });
  $('#nav_bg').on('click', function(event) {
    $("body").removeClass("nav_open");// .menu-triggerクリック時に行われる処理
  });
});


            /* SP menu */

                // var body = document.body;
                // var hamburger = document.getElementById('nav_btn');
                // var blackBg = document.getElementById('nav_bg');
                // hamburger.addEventListener('click', function() {
                //     body.classList.toggle('nav_open'); //メニュークリックでnav-openというクラスがbodyに付与
                // });
                // blackBg.addEventListener('click', function() {
                //     body.classList.remove('nav_open'); //もう一度クリックで解除
                // });



