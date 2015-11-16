class ArduinoSensor < ActiveRecord::Base
  validates_presence_of :ground_humidity, :israining, :shakes, :nonrelative_asl, :relative_asl, :temperature,
                        :pressure, :air_humidity
  validates_numericality_of :ground_humidity, :shakes, :nonrelative_asl, :relative_asl, :temperature,
                            :pressure, :air_humidity
end

#curl -X POST  -H "Accept: Application/json" -H "Content-Type: application/json" https://weather-online-dk.herokuapp.com/api/arduino_sensors?auth_token= -d '{"ground_humidity":"99.2","israining":"1", "shakes":"10.2", "nonrelative_asl":"1000.1", "relative_asl":"999.1", "temperature":"20.1", "pressure":"999999", "air_humidity":"10.3"}' -F access-token="GG5m5EAGDxeO10mttxcE1w" -F client="e2BQMvY-Soti7FirM23dsA" -F uid="ciprojektwimiip@gmail.com"
#curl -X POST  -H "Accept: Application/json" -H "Content-Type: application/json" http://localhost:3000/api/arduino_sensors?access-token=GG5m5EAGDxeO10mttxcE1w&client=e2BQMvY-Soti7FirM23dsA&uid=ciprojektwimiip@gmail.com" -d '{"ground_humidity":"99.2","israining":"1", "shakes":"10.2", "nonrelative_asl":"1000.1", "relative_asl":"999.1", "temperature":"20.1", "pressure":"999999", "air_humidity":"10.3"}'