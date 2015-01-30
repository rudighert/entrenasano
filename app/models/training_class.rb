class TrainingClass
  include MongoMapper::Document

  key :init_hour, Time, required: true
  key :finish_hour, Time, required: true
  key :days, Array


  many :pupils
  many :pupil_hours

  belongs_to :trainer

  timestamps!

  def add_pupil params
    pupil = Pupil.create params
    self.pupils << pupil
  end

  def add_pupil_hour pupil_hour
    self.pupil_hours = [] if self.pupil_hours.nil?
    ap self.pupil_hours
    self.pupil_hours << pupil_hour
    self.save
  end
end