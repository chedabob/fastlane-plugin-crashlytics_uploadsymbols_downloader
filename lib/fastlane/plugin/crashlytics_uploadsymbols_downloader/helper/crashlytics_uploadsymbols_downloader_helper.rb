require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class CrashlyticsUploadsymbolsDownloaderHelper
      # class methods that you define here become available in your action
      # as `Helper::CrashlyticsUploadsymbolsDownloaderHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the crashlytics_uploadsymbols_downloader plugin helper!")
      end

      def self.format_url(version = nil)
        version_string = version.nil? ? 'master' : version

        "https://github.com/firebase/firebase-ios-sdk/raw/#{version_string}/Crashlytics/upload-symbols"
      end
    end
  end
end
