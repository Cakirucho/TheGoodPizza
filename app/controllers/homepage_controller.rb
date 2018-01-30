class HomepageController < ApplicationController

  def index
    @pizzas = Pizza.all
  end
end
