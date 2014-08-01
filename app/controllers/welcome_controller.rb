class WelcomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    @ads = Ad.all
  end

end
