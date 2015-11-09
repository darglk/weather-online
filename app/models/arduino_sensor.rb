class ArduinoSensor < ActiveRecord::Base
  validates_presence_of :ground_humidity, :israining, :shakes, :nonrelative_asl, :relative_asl, :temperature,
                        :pressure, :air_humidity
  validates_numericality_of :ground_humidity, :israining, :shakes, :nonrelative_asl, :relative_asl, :temperature,
                            :pressure, :air_humidity
end
