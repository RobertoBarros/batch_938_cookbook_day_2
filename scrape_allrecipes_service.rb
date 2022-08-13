class ScrapeAllrecipesService
  def initialize(keyword)
    @keyword = keyword
    @view = View.new
  end

  def call
    # 1. Preparar a URL
    url = "https://www.allrecipes.com/search/results/?search=#{@keyword}"

    html = Nokogiri::HTML(URI.open(url).read)

    recipes = html.search('.card__detailsContainer a.card__titleLink').first(5)

    # 2. Mostrar as top 5 receitas do ingrediente
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} #{recipe.text.strip}"
    end

    # 3. Perguntar qual o index da receita para importar
    index = @view.ask_index

    # 4. Encontrar o link da receita a importar
    url =  recipes[index].attributes['href'].value
    html = Nokogiri::HTML(URI.open(url).read)

    # 5. Encontrar os atributos da receita
    name = html.search('h1').text
    description = html.search('.recipe-summary').text.strip
    rating = html.search('.recipe-reviews-decimal-avg').text.strip
    prep_time = html.search('.recipe-meta-item-body')[3].text.strip

    # 6. Criar uma receita
    Recipe.new(name, description, rating, prep_time)
  end

end
