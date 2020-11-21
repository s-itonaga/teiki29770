$(function(){
  //ページトップへのスクロール
  $('#pagetop').on('click',(function () {
    //id名#pagetopがクリックされたら、以下の処理を実行
    $("html,body").animate({scrollTop:0},"200");
  }));
  $('#pagetop').hide();
  //ページトップの出現
  $(window).on('scroll',(function () {
      if($(window).scrollTop() > 10) {
          $('#pagetop').slideDown(600);
      } else {
          $('#pagetop').slideUp(200);
      }
  }));
  //マウスオーバー時の色変化
  $('#pagetop').on("mouseover", function () {
    $(this).css({ "background-color": "gray" });
  }).on("mouseout", function () {
    $(this).css({ "background-color": "#ccc" });
  });
});

