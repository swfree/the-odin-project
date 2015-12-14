$(document).ready(function() {
  //upon load, color "home" text
  $('#home').css({
    color: '#cc6600'
  });

  //when you click a tab...
  $('.tab').click(function() {
    //...reset color of all tabs
    $('.tab').css({
      color: '#F5F9FA'
    });

    //...set new color of clicked tab
    $(this).css({
      color: '#cc6600'
    })

    
    //...get text for clicked tab
    var current_tab_text = 'sdfsd';
    switch($(this).attr('id')) {
      case 'home':
        current_tab_text = 'Welcome to Gothic Cupcakes, home to your favorite spooky treats!';
        break;
      case 'location':
        current_tab_text = 'Gothic Cupcakes is located in: Hades, Halloweentown, and that Haunted House at the end of your street.';
        break;
      case 'apps':
        current_tab_text = 'This is apps';
        break;
      case 'sserts':
        current_tab_text = 'This is serts';
        break;
      case 'about':
        current_tab_text = 'This is about';
        break;
    }
    
    //console.log($(this).attr('id'));

    //Return new text to webpage
    $('#main').text(current_tab_text);
  });
    //then color that clicked text 
    //and remove the current text 
    //and append new text

});

