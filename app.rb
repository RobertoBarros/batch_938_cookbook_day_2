require "open-uri"
require "nokogiri"


require_relative 'cookbook'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'
require_relative 'recipe'
require_relative 'scrape_allrecipes_service'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)
controller = Controller.new(cookbook)

router = Router.new(controller)

# Start the app
router.run
