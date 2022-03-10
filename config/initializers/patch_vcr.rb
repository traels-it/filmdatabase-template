# Problem with ruby 3.1.1 and VCR.
# Should be patched, but no release yet.
# This fixes it, and should probably be removed after next major VCR patch

# frozen_string_literal: true

if Rails.env.test?
  unless Gem.loaded_specs["vcr"].version == Gem::Version.create("6.0.0")
    raise "This patch is very likely already in the next VCR release after 6.0.0"
  end

  require "vcr/library_hooks/webmock"

  module VCR
    class LibraryHooks
      module WebMock
        def global_hook_disabled?(request)
          requests = Thread.current[:_vcr_webmock_disabled_requests]
          requests && requests.include?(request)
        end

        def global_hook_disabled_requests
          Thread.current[:_vcr_webmock_disabled_requests] ||= []
        end
      end
    end
  end
end
