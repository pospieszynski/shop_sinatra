require_relative '../models/user'

module Shop
  class AddUser
    attr_reader :user

    def initialize(params)
      @user = User.new(params.fetch('name'), params.fetch('email'), params.fetch('password'),params.fetch('role'))
    end

    def call
      USERS << user
      user
    end
  end
end