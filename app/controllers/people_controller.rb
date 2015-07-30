class PeopleController < ApplicationController
  def index
    @people = Person.page params[:page]
    render json: @people
  end
end
