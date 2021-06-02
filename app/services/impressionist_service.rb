class ImpressionistService

  attr_reader :model, :request

  def initialize(model,request)
    @model = model
    @request = request
  end

  def track
    model.impressionists.create(track_params)
  end

  private

  def track_params
    {
      ip_address: request.ip,
      country:    request.location.country,
      request_hash:   request
    }
  end
 
end