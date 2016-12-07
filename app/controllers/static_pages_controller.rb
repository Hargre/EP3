class StaticPagesController < ApplicationController
  def home
    @group = current_user.groups.build if logged_in?
  end

  def about
  end
end
