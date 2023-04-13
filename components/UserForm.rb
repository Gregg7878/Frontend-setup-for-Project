class UserForm
    include ActiveModel::Model
    attr_accessor :name, :email, :password, :password_confirmation
  
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
  
    def save
      user = User.create(name: name, email: email, password: password)
      if user.valid?
        user
      else
        errors.merge!(user.errors)
        false
      end
    end
  end
  