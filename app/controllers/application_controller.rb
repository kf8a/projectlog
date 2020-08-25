# frozen_string_literal: true

# Test the application controller
# For APIs, you may want to use :null_session instead.
# Prevent CSRF attacks by raising an exception.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
