$(document).ready(
  function() {
    $('.hidden-recommendation').hide();
    $('#recommendation-head').hide();

    $('#bermuda').click(
      function() {
        $('#recommendation-head').show();
        $('#bermuda-info').show();
      }
    );

    $('#seattle').click(
      function() {
        $('#hidden-recommendation').hide();
        $('#recommendation-head').show();
        $('#seattle-info').show();
      }
    );
    
    $('#alaska').click(
      function() {
        $('#recommendation-head').show();
        $('#alaska-info').show();
      }
    );
    
    $('#florida').click(
      function() {
        $('#recommendation-head').show();
        $('#florida-info').show();
      }
    );
    
    $('#hawaii').click(
      function() {
        $('#recommendation-head').show();
        $('#hawaii-info').show();
      }
    );
    
    $('#newyork').click(
      function() {
        $('#recommendation-head').show();
        $('#newyork-info').show();
      }
    );
    
    $('#ireland').click(
      function() {
        $('#recommendation-head').show();
        $('#ireland-info').show();
      }
    );
    
    $('#canada').click(
      function() {
        $('#recommendation-head').show();
        $('#canada-info').show();
      }
    );
  }
);


