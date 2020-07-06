# frozen_string_literal: true

# Base class for records
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
