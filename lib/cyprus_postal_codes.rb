# frozen_string_literal: true

require_relative "cyprus_postal_codes/version"

module CyprusPostalCodes
  autoload :Client, "cyprus_postal_codes/client"
  autoload :Error, "cyprus_postal_codes/error"
  autoload :Addresses, "cyprus_postal_codes/client/addresses"
  autoload :AddressesPaginator, "cyprus_postal_codes/client/addresses_paginator"
  autoload :Districts, "cyprus_postal_codes/client/districts"
end
