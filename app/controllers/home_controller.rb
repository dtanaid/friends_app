class HomeController < ApplicationController
  def index
  end

  def about
    @about_me = "This is a testing project"
  end
end
