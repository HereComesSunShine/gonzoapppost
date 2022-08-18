class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  
  attr_accessor :remember_token   
    validates_length_of :password, :in => 6..20, :on => :create
    
    has_secure_password validations: false
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
      end
      def feed
        Micropost.where("user_id = ?", id)
      end
      # Возвращает случайный токен.
      def User.new_token
        SecureRandom.urlsafe_base64
      end
    
      # Запоминает пользователя в базе данных для использования в постоянной сессии.
      def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
      end

      def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
      end
end
