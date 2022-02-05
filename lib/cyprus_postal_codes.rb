# frozen_string_literal: true

require_relative "cyprus_postal_codes/version"

module CyprusPostalCodes
  autoload :Addresses, "cyprus_postal_codes/client/addresses"
  autoload :Areas, "cyprus_postal_codes/client/areas"
  autoload :Client, "cyprus_postal_codes/client"
  autoload :Districts, "cyprus_postal_codes/client/districts"
  autoload :Error, "cyprus_postal_codes/error"
  autoload :GovernmentServices, "cyprus_postal_codes/client/government_services"
  autoload :OccupiedAreas, "cyprus_postal_codes/client/occupied_areas"
  autoload :Paginator, "cyprus_postal_codes/client/paginator"
  autoload :Parcel24Locations, "cyprus_postal_codes/client/parcel24_locations"
  autoload :PostOfficeBoxes, "cyprus_postal_codes/client/post_office_boxes"
  autoload :Search, "cyprus_postal_codes/client/search"
end
