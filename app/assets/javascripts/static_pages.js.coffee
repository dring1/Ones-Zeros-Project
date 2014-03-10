# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
	$.ajax '/',
	url: "/elephants/dancing",
    cache: false,
    success: (html) ->
      $("#rec-data").append(html)
    