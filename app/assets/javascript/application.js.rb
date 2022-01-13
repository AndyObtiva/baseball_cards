require 'opal'
require 'native'
require 'jquery'
require 'opal-jquery'

card_image_updater = proc do
  name_input = Element['#baseball_card_name']
  if !name_input.val.empty?
    url = "https://api.giphy.com/v1/gifs/search?q=#{name_input.value}&limit=20&api_key=fM6ptBz7qPw79xrXOagWvHiPzRBSQK7f"
    HTTP.get(url) do |response|
      if response.ok?
        response_hash = response.json
        image_url = response_hash['data'].sample['url']
        image_url = "https://media1.giphy.com/media/#{image_url.split('-').last}/giphy.gif"
        card_element = Element['.card']
        card_element.css('background-image', "url(#{image_url})")
        hidden_image_url_field = Element['#baseball_card_image_url']
        hidden_image_url_field.val(image_url)
      end
    end
  end
end

Document.ready? do
  name_input = Element['#baseball_card_name']

  name_input.on(:change) do
    card_name = Element['#card_name']
    card_name.html(name_input.value)
    card_image_updater.call
  end
  
  team_select = Element['#baseball_card_team']

  team_select.on(:change) do
    card_team_image = Element['#card_team']
    card_team_value = team_select.value.downcase.gsub(' ', '-')
    card_team_value = 'redsox' if card_team_value == 'red-sox' # special case for the red sox
    image_url = "https://sportslogosvg.com/wp-content/uploads/2020/09/#{card_team_value}-1200x864.png"
    card_team_image.css('display', 'inline-block')
    card_team_image.attr('src', image_url)
  end
  
  position_select = Element['#baseball_card_position']
  
  position_select.on(:change) do
    card_position_image = Element['#card_position']
    card_position_image.css('display', 'inline-block')
    svg_element_id = "text-#{position_select.value.downcase.gsub(' ', '-')}"
    Element['svg text'].each { |text| text.css('fill', 'transparent')}
    Element["##{svg_element_id}"].css('fill', 'yellow')
  end
  
  update_card_player_image_button = Element['#update_card_player_image']
  
  update_card_player_image_button.on(:click) do |event|
    event.prevent
    card_image_updater.call
  end
end
