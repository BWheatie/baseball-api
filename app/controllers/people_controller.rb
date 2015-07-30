class PeopleController < ApplicationController
  def index
    @people = Person.page params[:page]
    render json: @people, meta: { total: @people.total_count, pages: (@people.total_count / @people.size) }
  end
end
