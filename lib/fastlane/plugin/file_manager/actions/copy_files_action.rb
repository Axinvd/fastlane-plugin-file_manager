require "fastlane/action"

module Fastlane
  module Actions
    class CopyFilesAction < Action
      if FastlaneCore::Helper.is_windows?
        Actions.sh("chcp 65001")
      end
      def self.run(params)
        if FastlaneCore::Helper.is_windows?
            Actions.sh("copy \"#{params[:source].gsub("/", "\\\\")}\" \"#{params[:destination]}\" /Y")
        else
            Actions.sh("cp", params[:source], params[:destination])
        end
      end

      def self.description
        "Copy files"
      end

      def self.authors
        ["Jason Nam"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :source,
                              short_option: "-s",
                               description: "Source",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :destination,
                              short_option: "-d",
                               description: "Destination",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
