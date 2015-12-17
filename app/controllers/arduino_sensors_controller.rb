class ArduinoSensorsController < ApplicationController
  def index
    @recent = ArduinoSensor.last
    render "arduino_sensors/recent_record"
  end

  def today
    @data = ArduinoSensor.where(:created_at => Date.today..Time.now).order(created_at: :desc).paginate(:page => params[:page])
    fetch_data(@data, "There are no records from today.")
  end

  def yesterday
    @data = ArduinoSensor.where(:created_at => Date.yesterday..Time.now).order(created_at: :desc).paginate(:page => params[:page])
    fetch_data(@data,"There are no records from yesterday.")

  end

  def this_month
    @data = ArduinoSensor.where(:created_at => 1.month.ago..Time.now).order(created_at: :desc).paginate(:page => params[:page])
    fetch_data(@data, "There are no records since last month")
  end

  def this_year
    @data = ArduinoSensor.where(:created_at => 1.year.ago..Time.now).order(created_at: :desc).paginate(:page => params[:page])
    fetch_data(@data, "There are no records since last year")
  end

  private

  def fetch_data(data, alert)
    unless data.empty?
      render "arduino_sensors/index"
    else
      flash[:alert] = alert
      redirect_to root_path
    end
  end
end

#curl -i -X DELETE https://weather-online-dk.herokuapp.com/api/auth/sign_out -F access-token="<access-token>" -F client="<client>" -F uid="ciprojektwimiip@gmail.com"

#curl -X POST -v -H 'Content-Type: application/json' https://weather-online-dk.herokuapp.com/api/auth/sign_in -d '{"email": "ciprojektwimiip@gmail.com", "password": "" }'
#curl -X POST -v -H 'Content-Type: application/json' -H 'uid: ciprojektwimiip@gmail.com' -H 'access-token: <access-token>' -H 'client: <client>' https://weather-online-dk.herokuapp.com/api/arduino_sensors -d '{"ground_humidity":"99.2","israining":"1", "shakes":"10.2", "nonrelative_asl":"1000.1", "relative_asl":"999.1", "temperature":"20.1", "pressure":"999999", "air_humidity":"10.3"}'