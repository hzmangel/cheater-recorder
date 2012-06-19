# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  update_cheater_list()

update_cheater_list = () ->
  cheaters_url = '/cheaters.json'

  jQuery ($) ->
    $.getJSON(cheaters_url,
      (data) ->
        rslt = ("<div id=\"cheater_#{ cheater._id }\"><div class=\"cheater_mobile\">#{ cheater.mobile }</div><div class=\"cheater_desc\">#{ cheater.desc }</div></div>" for cheater in data).join '<hr/>'
        $('#cheater_list').html(rslt)
    )


