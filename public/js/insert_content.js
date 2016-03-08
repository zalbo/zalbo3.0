var pannel = false
$(function() {
    $('#zone_insert' )
    .mouseenter(function() {
      $('#line').fadeIn('fast');
    })
    .mouseleave(function() {
      if (pannel == false)
      $('#line').fadeOut('fast');
    });
});

function open_pannel_content() {
  $('#line').fadeIn('fast');
  $('#pannel_button_content').fadeIn('fast');
  pannel = true;
}

function close_pannel_content() {
  pannel = true
  $('#line').fadeOut('fast');
  $('#pannel_button_content').fadeOut('fast');
  pannel = false;
}


var order = 0
