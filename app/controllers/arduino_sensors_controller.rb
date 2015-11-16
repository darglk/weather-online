class ArduinoSensorsController < ApplicationController
  def index
    @data = ArduinoSensor.last
  end
end

#curl -i -X DELETE https://weather-online-dk.herokuapp.com/api/auth/sign_out -F access-token="<access-token>" -F client="<client>" -F uid="ciprojektwimiip@gmail.com"

#curl -X POST -v -H 'Content-Type: application/json' https://weather-online-dk.herokuapp.com/api/auth/sign_in -d '{"email": "ciprojektwimiip@gmail.com", "password": "" }'
#curl -X POST -v -H 'Content-Type: application/json' -H 'uid: ciprojektwimiip@gmail.com' -H 'access-token: <access-token>' -H 'client: <client>' https://weather-online-dk.herokuapp.com/api/arduino_sensors -d '{"ground_humidity":"99.2","israining":"1", "shakes":"10.2", "nonrelative_asl":"1000.1", "relative_asl":"999.1", "temperature":"20.1", "pressure":"999999", "air_humidity":"10.3"}'