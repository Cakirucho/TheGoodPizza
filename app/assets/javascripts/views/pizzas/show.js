$(function() {
  var $deleteNoticeButton = $(".delete-flash-notice");
  var $flashNotice = $(".flash-message");

  $deleteNoticeButton.click(function(){
    $flashNotice.fadeOut('slow');
  });
});
