class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: SightingSerializer.new(sightings)
    end
    
    def show
        sighting = Sighting.find(params[:id])
        options = {
            include: [:bird, :location]
          }
        render json: SightingSerializer.new(sighting, options)
    end
end


#Custom Service Class

# class SightingSerializer
#     def initialize(sighting_object)
#         @sighting = sighting_object
#     end

#     def to_serialized_json
#         options = {
#           include: {
#             bird: {
#               only: [:name, :species]
#             },
#             location: {
#               only: [:latitude, :longitude]
#             }
#           },
#           except: [:updated_at],
#         }
#         @sighting.to_json(options)
#     end
# end