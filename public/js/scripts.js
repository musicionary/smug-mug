$(function() {
  $('#customer-button').click(function() {
    $('#customer-account').show();
    $('#farmer-button').hide();
    $('#roaster-button').hide();
    $('#customer-button').hide();
  });
  $('#farmer-button').click(function() {
    $('#farmer-account').show();
    $('#farmer-button').hide();
    $('#roaster-button').hide();
    $('#customer-button').hide();
  });
  $('#customer-button').click(function() {
    $('#customer-account').show();
    $('#farmer-button').hide();
    $('#roaster-button').hide();
    $('#customer-button').hide();
  });
  
});
