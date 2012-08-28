# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("section.frame").hide()
;


$("ul.nav.nav-pills>li").click(
  (e) ->
    current = $(this)
    ;
    return if current.hasClass('active')
    ;
    current.parent().find('li.active').removeClass("active")
    ;
    current.addClass('active')
    ;
    $("section.frame").hide()
    ;
    $("section.frame." + current.attr("href")).show()
    ;
)
;