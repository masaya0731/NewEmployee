// スライドショー
$(document).on('turbolinks:load',function () {
  $("#theTarget").skippr({
    transition : 'fade',
    speed : 1000,
    easing : 'easeOutQuart',
    navType : 'block',
    childrenElementType : 'div',
    autoPlay : true,
    autoPlayDuration : 2700,
    keyboardOnAlways : true,
    hidePrevious : false
  });
});

// フラッシュメッセージ
$(document).ready(function() {
   //queue()で処理を溜めてdequeue()で実行。3秒経ったらfadeOut()
  $("#timeout").fadeIn().queue(function() {
    setTimeout(function(){$("#timeout").dequeue();
    }, 3000);
  });
  $("#timeout").fadeOut();
});