class HomepageController < ApplicationController
  def index

  end

  private

    def comment_params
      params.require(:pizza).permit(:name, :selling_price)
    end
end
