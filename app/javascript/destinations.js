$(document).on('turbo:load', function() {

  $('#add-destination').on("click", function() {
    const html = "<div class=\"select-grid\"><div class=\"mb-3\"><input name=\"locations[][destination]\" class=\"form-control\" required=\"required\" placeholder=\"Enter destination (Country, Region or City )\" type=\"text\" id=\"destination\"></div><div class=\"select-list\"><select class=\"form-select mb-3\" name=\"locations[][days]\" required=\"required\" id=\"days\"><option value>Days</option><option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option><option value=\"4\">4</option><option value=\"5\">5</option><option value=\"6\">6</option><option value=\"7\">7</option><option value=\"8\">8</option><option value=\"9\">9</option><option value=\"10\">10</option></select><span class=\"material-symbols-outlined\">expand_more</span></div></div>"

    $("#parent-container").append(html);
  });

  $("#destinations-form").on("submit", function(){
    $('#prepare_trip').prop('disabled', true);
    return true;
  });

  $('.dayDetail').on("click", function() {
    $("#modal-loader-spinner").removeClass('d-none');
    $.get($(this).data("path"));
  });
});
