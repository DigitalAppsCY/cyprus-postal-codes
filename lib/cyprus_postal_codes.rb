# frozen_string_literal: true

require_relative "cyprus_postal_codes/version"

module CyprusPostalCodes
  autoload :Client, "cyprus_postal_codes/client"
  autoload :Error, "cyprus_postal_codes/error"
  autoload :Addresses, "cyprus_postal_codes/client/addresses"
  autoload :Paginator, "cyprus_postal_codes/client/paginator"
  autoload :Areas, "cyprus_postal_codes/client/areas"
  autoload :Districts, "cyprus_postal_codes/client/districts"
  autoload :Search, "cyprus_postal_codes/client/search"
  autoload :GovernmentServices, "cyprus_postal_codes/client/government_services"
end
