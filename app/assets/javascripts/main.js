$(function() {
  $("input[data-perform-lookup]").live("click", function() {
    $.get(
      "/lookup?location=" + $("#location").val(),
      function(data) {
        $("#coordinates").html(data);
      }
    );
  });
});