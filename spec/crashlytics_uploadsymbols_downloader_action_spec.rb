describe Fastlane::Actions::CrashlyticsUploadsymbolsDownloaderAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The crashlytics_uploadsymbols_downloader plugin is working!")

      Fastlane::Actions::CrashlyticsUploadsymbolsDownloaderAction.run(nil)
    end
  end
end
