class StaticPagesController < ApplicationController
  skip_before_action :signed_in_user, only: :home
end
