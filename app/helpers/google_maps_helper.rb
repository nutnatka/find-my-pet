module GoogleMapsHelper

  def google_maps_tag(idMap = "")
    javascript_include_tag google_maps_source(idMap),
                           async: true,
                           defer: true
  end

  def google_maps_initialize(idMap = "")
    javascript_include_tag "google_maps#{idMap}"
  end

  private

  def google_maps_source(idMap)
    "https://maps.googleapis.com/maps/api/js?key=#{google_maps_key}&region=UK&language=uk&callback=initMap#{"&libraries=places" if idMap == "_posts"}"
  end

  def google_maps_key
    Rails.application.credentials.dig(:google, :api_key)
  end
end
