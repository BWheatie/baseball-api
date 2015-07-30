class PeopleController < ApplicationController
  def index
    @people = Person.page(params[:page]).includes(:battings)
    render_json_api @people
  end

  def show
    @person = Person.find(params[:id])
    render_json_api @person
  end
end
