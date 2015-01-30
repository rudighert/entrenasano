class PupilHour
  include MongoMapper::Document

  key :date_class, Date,  required: true
  key :time_class, Time,  required: true


  belongs_to :training_class



  timestamps!


end