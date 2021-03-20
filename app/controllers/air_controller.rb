class AirController < ApplicationController
  require "net/http"
  def index
    @url="https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=27832&distance=25&API_KEY=FA77B85E-9CDC-4E8F-9DEB-D230C9968A6B"
    @uri=URI(@url)
    @response=Net::HTTP.get(@uri)
    @output=JSON.parse(@response)

    if @output.empty?
      @final_output="Please enter a valid pin code"
    else
      @final_output=@output[0]['AQI']
      if @final_output > 0 && @final_output <= 20
        @color="green"
        @value="Good"
      elsif @final_output > 20 && @final_output <= 40
        @color="orange"
        @value="Moderate"
      elsif @final_output > 40 && @final_output <= 60
        @color="red"
        @value="Bad"
      else
        @color="maroon"
        @value="Danger"
      end
    end


  end
end
