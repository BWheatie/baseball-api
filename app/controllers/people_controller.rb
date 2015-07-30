class PeopleController < ApplicationController
  def index
    @people = Person.page params[:page]
    render json: @people, meta: { total: @people.total_count, pages: (@people.total_count / @people.size) }
  end

  def show
    @person = Person.find(params[:id])
    render json: @person
  end
end
