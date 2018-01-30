class PizzasController < ApplicationController

  def new
    @pizza = Pizza.new
  end

  private

    def comment_params
      params.require(:pizza).permit(:name, :selling_price)
    end
end
