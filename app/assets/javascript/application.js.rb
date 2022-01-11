require "opal"

# Uncomment the following to print out you're hello-world with Opal:
#
#   puts "hello world!"
#
# The following will append a hello-world to your <body> element:
#
#   require "native"
#   $$[:document].addEventListener :DOMContentLoaded do
#     $$[:document][:body][:innerHTML] = '<h2>Hello World!</h2>'
#   end

puts "hello world!"

require "native"
$$.document.addEventListener(:DOMContentLoaded) do
  $$.document.body.innerHTML = '<h2>Hello, World!</h2><button>Update Greeting</button>'

  button = $$.document.getElementsByTagName('button')[0]

  button.addEventListener(:click) do
    greeting = $$.document.getElementsByTagName('h2')[0]
    greeting.innerHTML = 'Howdy, Partner!'
  end
end
