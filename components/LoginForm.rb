class LoginForm
    include ActiveModel::Model
    attr_accessor :email, :password
  
    validates :email, presence: true
    validates :password, presence: true
  
    def user
      User.find_by(email: email, password: password)
    end
  end
  