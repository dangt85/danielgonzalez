# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

currentPage = 1

jQuery ->
  $('#load a').click ->
    $('#load').hide()
    $('#loading').show()
    currentPage++
    $.ajax
       type: 'GET',
       url: '/tweets/' + currentPage,
       dataType: "script"
    return false
