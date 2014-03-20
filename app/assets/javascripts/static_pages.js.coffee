# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".spinner").hide()
  $("#refresh-rec-btn").click ->
      $(".spinner").fadeIn()
      $("#output").hide()

      #hide this
         #on click show
         # when ajax done hide the bar
