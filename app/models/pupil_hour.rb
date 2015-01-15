class PupilHour
  include MongoMapper::Document

  key :day
  key :month
  key :year
  belongs_to :pupil


  timestamps!


end