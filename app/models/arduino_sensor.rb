class ArduinoSensor < ActiveRecord::Base
  validates_presence_of :ground_humidity, :israining, :shakes, :nonrelative_asl, :relative_asl, :temperature,
                        :pressure, :air_humidity
  validates_numericality_of :ground_humidity, :shakes, :nonrelative_asl, :relative_asl, :temperature,
                            :pressure, :air_humidity
end

#curl -X POST  -H "Accept: Application/json" -H "Content-Type: application/json" https://weather-online-dk.herokuapp.com/api/arduino_sensors -d '{"ground_humidity":"99.2","israining":"1", "shakes":"10.2", "nonrelative_asl":"1000.1", "relative_asl":"999.1", "temperature":"20.1", "pressure":"999999", "air_humidity":"10.3"}'