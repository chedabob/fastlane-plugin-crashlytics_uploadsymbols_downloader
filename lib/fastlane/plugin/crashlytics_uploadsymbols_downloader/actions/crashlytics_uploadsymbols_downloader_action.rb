require 'fastlane/action'
require_relative '../helper/crashlytics_uploadsymbols_downloader_helper'

module Fastlane
  module Actions
    module SharedValues
      UPLOAD_SYMBOLS_PATH = :UPLOAD_SYMBOLS_PATH
    end
    class CrashlyticsUploadsymbolsDownloaderAction < Action
      def self.run(params)
        dst_pth = "#{Dir.mktmpdir}/upload-symbols"
        src_url = Helper::CrashlyticsUploadsymbolsDownloaderHelper.format_url(params[:version])

        require 'open-uri'
        download = URI.parse(src_url).open
        IO.copy_stream(download, dst_pth)

        require "fileutils"
        FileUtils.chmod("+x", dst_pth)

        Actions.lane_context[SharedValues::UPLOAD_SYMBOLS_PATH] = dst_pth

        dst_pth
      end

      def self.description
        "Downloads the upload-symbols binary for projects that use SPM but don't want to have to install all of the packages to use it"
      end

      def self.authors
        ["chedabob"]
      end

      def self.return_value
        "Path to the downloaded file"
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :version,
                                  env_name: "CRASHLYTICS_UPLOADSYMBOLS_DOWNLOADER_VERSION",
                               description: "What version to download (has to match the Git tag exactly)",
                                  optional: true,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
