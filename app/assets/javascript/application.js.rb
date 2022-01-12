require 'opal'
require 'native'
require 'json'

card_image_updater = proc do
  name_input = $$.document.getElementById('baseball_card_name')
  unless name_input.value.empty?
    url = "http://api.giphy.com/v1/gifs/search?q=#{name_input.value}&limit=20&api_key=fM6ptBz7qPw79xrXOagWvHiPzRBSQK7f"
    xhttp = Native(`new XMLHttpRequest`)
    xhttp.onload = proc do |response|
      if `this.readyState` == 4 && `this.status` == 200
        response_hash = JSON.parse(`this.responseText`)
        image_url = response_hash['data'].sample['url']
        image_url = "https://media1.giphy.com/media/#{image_url.split('-').last}/giphy.gif"
        card_element = $$.document.querySelectorAll('.card')[0]
        card_element.style['background-image'] = "url(#{image_url})"
        hidden_image_url_field = $$.document.getElementById('baseball_card_image_url')
        hidden_image_url_field.value = image_url
      end
    end
    xhttp.open('GET', url, true)
    xhttp.send
  end
end

$$.document.addEventListener(:DOMContentLoaded) do
  name_input = $$.document.getElementById('baseball_card_name')

  name_input&.addEventListener(:change) do
    card_name = $$.document.getElementById('card_name')
    card_name.innerHTML = name_input.value
    card_image_updater.call
  end
  
  team_select = $$.document.getElementById('baseball_card_team')

  team_select&.addEventListener(:change) do
    card_team_image = $$.document.getElementById('card_team')
    card_team_value = team_select.value.downcase.gsub(' ', '-')
    card_team_value = 'redsox' if card_team_value == 'red-sox' # special case for the red sox
    image_url = "https://sportslogosvg.com/wp-content/uploads/2020/09/#{card_team_value}-1200x864.png"
    card_team_image.style['display'] = 'inline-block'
    card_team_image.src = image_url
  end
  
  position_select = $$.document.getElementById('baseball_card_position')
  
  position_select&.addEventListener(:change) do
    card_position_image = $$.document.getElementById('card_position')
    card_position_image.style['display'] = 'inline-block'
    svg_element_id = "text-#{position_select.value.downcase.gsub(' ', '-')}"
    $$.document.querySelectorAll('svg text').to_a.each { |text| text.style['fill'] = 'transparent'}
    $$.document.getElementById(svg_element_id).style['fill'] = 'yellow'
  end
  
  update_card_player_image_button = $$.document.getElementById('update_card_player_image')
  
  update_card_player_image_button&.addEventListener(:click) do |event|
    Native(event).preventDefault
    card_image_updater.call
  end
end
