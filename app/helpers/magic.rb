helpers do

  def current_card
    Card.find(session[:cards][session[:num]])
  end

  def get_set_ip_and_address_in_sessions
    # ip_address = request.ip
    ip_address = '74.122.9.196' #Hard-coded DBC ip b/c real ip is hidden behind router on local server
    # Create ip in sessions
    session[:ip] = ip_address

    # Use freegoip.net get request to get longitude and latitude
    longlat_query = 'http://freegeoip.net/json/' + ip_address
    freegeoip_response = Net::HTTP.get_response(URI.parse(longlat_query))
    freegeoip_parsed_results = JSON.parse(freegeoip_response.body)
    longitude = freegeoip_parsed_results['longitude']
    latitude = freegeoip_parsed_results['latitude']

    # Use google maps API to get closest local address using longitude and latitude
    google_address_query = 'http://maps.googleapis.com/maps/api/geocode/json?latlng=' + latitude.to_s + "," + longitude.to_s + "&sensor=true"
    # google_response = Net::HTTP.get_response(URI.parse(google_address_query))
    # google_parsed_results = JSON.parse(google_parsed_results)
    google_parsed_results = open(google_address_query) do |file|
      JSON.parse(file.read)
    end
    google_address = google_parsed_results['results'][0]['formatted_address']

    # Create address in sessions
    session[:address] = google_address
  end

end
