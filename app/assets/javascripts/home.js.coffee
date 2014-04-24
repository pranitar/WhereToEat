String::multi = (num) ->
  n = 0
  ret = ""
  ret += this  while n++ < num
  ret

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
  $(".filter_button").click ->
    window.filter_restaurants.submit_filter($(this).attr("filter_type"))
  return
return