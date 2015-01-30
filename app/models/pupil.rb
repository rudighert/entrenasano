class Pupil
  include MongoMapper::Document

  key :email,     required: true
  key :rut,       required: true, unique: true
  key :name,      required: true
  key :last_name, required: true
  key :notes
  key :birthday,  Date



  timestamps!

  def get_name
    "#{name} #{last_name}"
  end

end