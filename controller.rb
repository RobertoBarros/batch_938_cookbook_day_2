require_relative 'view'
class Controller

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # 1. Pegar todas as receitas do cookbook
    recipes = @cookbook.all

    # 2. Mandar a view mostrar as receitas
    @view.display(recipes)

  end

  def  create
    # 1. Perguntar qual o nome da receita
    name = @view.ask_recipe_name

    # 2. Perguntar qual a descrição da receita
    description = @view.ask_recipe_description

    # 3. Perguntar qual a nota da receita
    rating = @view.ask_recipe_rating

    # 4. Perguntar qual o tempo de preparo
    prep_time = @view.ask_prep_time

    # 5. Instanciar uma nova receita
    recipe = Recipe.new(name, description, rating, prep_time)

    # 6. Adicionar a receita ao Cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # 1. Mostrar as receitas cadastradas
    list

    # 2. Perguntar o index da receita a ser excluída
    index = @view.ask_index

    # 3. Mandar o cookbook remover a receita pelo index
    @cookbook.remove_recipe(index)
  end

  def mark_as_done
    # 1. Mostrar todas as receitas
    list

    # 2. Perguntar qual receita marcar
    index = @view.ask_index

    # 3. Mandar o cookbook marcar a receita como feita
    recipe = @cookbook.all[index]
    @cookbook.mark_as_done(recipe)
  end

  def import
    # 1. Perguntar qual o ingrediente da receita
    ingredient = @view.ask_ingredient

    # 2. Chamar o serviço de importação de receitas da web
    service = ScrapeAllrecipesService.new(ingredient)
    recipe = service.call

    # 3. Salvar a receita no repositório
    @cookbook.add_recipe(recipe)
  end
end
