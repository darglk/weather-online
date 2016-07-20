require 'httparty'
#curl -X POST -v -H 'Content-Type: application/json' https://weather-online-dk.herokuapp.com/api/auth/sign_in -d '{"email": "ciprojektwimiip@gmail.com", "password": "RVCH4MP$AJ4KSR4" }'
def create_agent
    
  response = HTTParty.post("https://weather-online-dk.herokuapp.com/api/auth/sign_in",  :body => {"email": "ciprojektwimiip@gmail.com", "password": "RVCH4MP$AJ4KSR4"}.to_json, :headers => { 'Content-Type' => 'application/json' })
  puts  response.headers["access-token"]
  puts response.headers["client"]
  fake_data = {}
  #'{"ground_humidity":"99.2","israining":"1", "shakes":"10.2", "nonrelative_asl":"1000.1", "relative_asl":"999.1", "temperature":"20.1", "pressure":"999999", "air_humidity":"10.3"}'
  fake_data[:ground_humidity] = rand(0..2)
  fake_data[:israining]  = 1
  fake_data[:shakes] = rand(5..10)
  fake_data[:nonrelative_asl] = rand(150..160)
  fake_data[:relative_asl] = rand(140..150)
  fake_data[:temperature] = rand(18..21)
  fake_data[:pressure] = rand(99950..102400)
  fake_data[:air_humidity] = rand(50..70)
  post_response = HTTParty.post("https://weather-online-dk.herokuapp.com/api/arduino_sensors", :body => fake_data.to_json, :headers =>{ 'Content-Type' => 'application/json', 'access-token' => response.headers['access-token'], 'client' => response.headers['client'],'uid' => 'ciprojektwimiip@gmail.com'  })
  p post_response
  #logout_response = HTTParty.delete("https://weather-online-dk.herokuapp.com/api/auth/sign_out", :headers => {'Content-Type' => 'application/json', 'access-token' => post_response.headers['access-token'], 'client' => post_response.headers['client'], 'uid' => 'ciprojektwimiip@gmail.com'})
  
end

thread = Thread.new do
  loop do
    create_agent
    sleep(1800)
  end
end
thread.join
