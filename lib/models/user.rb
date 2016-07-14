module Shop
  class User
    attr_reader :id, :name, :email, :password, :role

    @@id = 0

    def initialize(name, email, password, role)
      @id = set_id
      @name = name
      @email = email
      @password = password
      @role = role
    end

    private
    def set_id
      @@id += 1
    end
  end
end
