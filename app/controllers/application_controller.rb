class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def render_json_api obj
    if obj.respond_to? :total_pages
      render json: obj, content_type: "application/vnd.api+json", meta: {total_pages: obj.total_pages}
    else
      render json: obj, content_type: "application/vnd.api+json"
    end
  end
end
