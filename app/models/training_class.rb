class TrainingClass
  include MongoMapper::Document

  many :pupils

  belongs_to :trainer

  timestamps!

  def add_pupil params
    pupil = Pupil.create params
    self.pupils << pupil
  end
end