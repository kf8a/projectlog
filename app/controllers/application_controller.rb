# frozen_string_literal: true

# Test the application controller
class ApplicationController < ActionController::Base # For APIs, you may want to use :null_session instead. # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
end
