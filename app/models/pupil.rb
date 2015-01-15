class Pupil
  include MongoMapper::Document

  key :email,     required: true
  key :rut,       required: true
  key :name,      required: true
  key :last_name, required: true

  belongs_to :trainer

  timestamps!

  def get_name
    "#{name} #{last_name}"
  end

end