String::multi = (num) ->
  n = 0
  ret = ""
  ret += this  while n++ < num
  ret

window.check_in =
  submit: (restaurant_id) ->
    $.ajax({
      type: "PATCH",
      url: "users/check_in/" + id,
      data: {user: {location: restaurant_id}},
      success: (data) ->
        return console.log(data);
      error: (data) ->
        return console.log(data);
      });

window.filter_restaurants =

  submit_filter: (filter_type) ->
    console.log(filter_type)
    $.ajax({
        type: "POST",
        url: "/home/filter",
        dataType: 'script',
        data: {filter: filter_type},
        success:(data) ->
          $('#restaurants').empty()
          restaurants = JSON.parse(data)
          i = 0
          while i < restaurants.length
            money = "$"
            restaurant = JSON.parse(restaurants[i])
            element = $("<a>").addClass('list-group-item').attr("href", "http://localhost:3000/restaurants/" + restaurant.id)
            element.addClass(restaurant.area.toLowerCase())
            content = $("<div>").addClass('title')
            content.append($("<h4>").html(restaurant.name))
            content.append($("<p>").html(restaurant.street + ", " + restaurant.city + ", " + restaurant.state + ", " + restaurant.zip_code))
            content.append($("<span>").addClass('badge').html(restaurant.cuisine))
            content.append($("<span>").append($("<h5>").html(money.multi(restaurant.price))))
            element.append(content)
            $('#restaurants').append(element)
            i++
          return false
        error: (data) ->
          return false
      })

$(document).ready ->

  $('.list-group').hide();
  $('#alphabetical').show();

  jQuery("abbr.timeago").timeago();

  $(".filter_button").click ->
    console.log('clicked')
    window.filter_restaurants.submit_filter($(this).attr("filter_type"))
  return

  $(".check-in").click ->
    console.log('clicked')
    window.check_in.submit($(this).attr("restaurant_id"))
  return
return
