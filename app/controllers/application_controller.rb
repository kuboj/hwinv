class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper
  include ApplicationHelper

  def handle_unverified_request
    sign_out
    super
  end

  def index
    model_name = self.class.name[0..-11].singularize
    var_name   = "@#{model_name.pluralize.underscore.to_sym}"
    instance_variable_set(var_name, Object.const_get(model_name).send(:all))

    respond_to do |format|
      format.html
      format.json { render json: var_name }
    end
  end
end
