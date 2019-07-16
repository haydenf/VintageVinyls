class HomeController < ApplicationController
  def page
    @vinyl = Vinyl.all
  end
end
