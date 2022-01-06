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
