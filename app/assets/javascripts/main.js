$(function() {
  $("input[data-perform-lookup]").click(function() {
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
