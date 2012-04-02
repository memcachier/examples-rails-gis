$(function() {
  $("input[data-perform-lookup]").live("click", function() {
    var coordinates = $("#coordinates");
    coordinates.html("Working ...");
    $.get(
      "/lookup?location=" + $("#location").val(),
      function(data) {
        coordinates.html(data);
      }
    );
  });
});