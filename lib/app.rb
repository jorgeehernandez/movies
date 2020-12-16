require_relative '../lib/appprueba/version'

require_relative '../lib/appprueba/adapters/api/grape_movie_api'
require_relative '../lib/appprueba/adapters/api/grape_reservation_api'

require 'json'
require 'grape'
require 'sequel'

class App < Grape::API
  class Error < StandardError; end

  version 'v1', using: :header, vendor: 'tolkien cinema'
  format :json
  prefix :api

  get :status do
    { status: 'ok' }
  end

  mount APIRoutes::GrapeMovieAPI
  mount APIRoutes::GrapeReservationAPI

end

Application = Rack::Builder.new do
  map "/" do
    run App
  end
end