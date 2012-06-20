# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  update_cheater_list()
  $('#add_cheater_form').submit(submit_add_cheater_form)

update_cheater_list = () ->
  cheaters_url = '/cheaters.json'

  jQuery ($) ->
    $.getJSON(cheaters_url,
      (data) ->
        rslt = ("
          <div id=\"cheater_#{ cheater._id }\">
            <div class=\"cheater_mobile\">#{ cheater.mobile }</div>
            <p class=\"cheater_desc\">#{ cheater.desc }</p>
            <input type=\"button\" class=\"vote span1 btn\" id=\"vote_up\" value=\"Up\">#{ cheater.vote_up }
            <input type=\"button\" class=\"vote span1 btn\" id=\"vote_down\" value=\"Down\">#{ cheater.vote_down }
          </div>" for cheater in data).join '<hr/>'

        $('#cheater_list').html(rslt)
    )


submit_add_cheater_form = (event) ->
  event.preventDefault()

  create_cheater_url = '/cheaters.json'
  post_data = {
    'cheater_mobile': $('#cheater_mobile').val(),
    'cheater_desc': $('#cheater_desc').val(),
    'provider_email': $('#provider_email').val()
  }
  console.log(post_data)
  $.post(create_cheater_url, post_data,
    (data) ->
      console.log(data)
  ).success((data) ->
    $('#add_cheater_rslt').addClass('alert alert-success span8')
    $('#add_cheater_rslt').html("Cheater #{ data } added")
  ).error((data) ->
    $('#add_cheater_rslt').addClass('alert alert-error span8')
    $('#add_cheater_rslt').html("Cheater #{ data.responseText }")
  )
  # Change the class to notify_success
  $('#add_cheater_rslt').show()

