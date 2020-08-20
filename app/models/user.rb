# frozen_string_literal: true

# A user that can log on
class User < ApplicationRecord # :confirmable, :lockable, :timeoutable and :omniauthable # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  validates :name, presence: true
end
