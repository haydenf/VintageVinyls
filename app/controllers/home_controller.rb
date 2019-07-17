class HomeController < ApplicationController
  def index
    @vinyls = Vinyl.all
  end
end
