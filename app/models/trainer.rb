class Trainer
  include MongoMapper::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  # ///// Devise Vars
  key :email, :null => false, :default => ""
  key :encrypted_password, :null => false, :default => ""
  key :current_sign_in_at
  key :sign_in_count, :default => 0
  key :current_sign_in_at
  key :last_sign_in_at
  key :current_sign_in_ip
  key :last_sign_in_ip
  key :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
  key :unlock_token # Only if unlock strategy is :email or :both
  key :locked_at
  key :remember_created_at
  # ///// End Devise Vars

  key :name, required: true
  key :last_name, required: true

  many :training_classes

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :last_name

  def get_name
    "#{name} #{last_name}"
  end

  def get_classes
    self.training_classes
  end



end