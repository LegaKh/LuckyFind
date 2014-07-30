class WelcomeController < ApplicationController

  def index
    @ads = Ad.all
  end

end
