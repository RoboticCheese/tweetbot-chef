require_relative '../../../spec_helper'

describe 'resource_tweetbot_app::mac_os_x::10_10' do
  let(:action) { nil }
  let(:runner) do
    ChefSpec::SoloRunner.new(step_into: 'tweetbot_app',
                             platform: 'mac_os_x',
                             version: '10.10')
  end
  let(:chef_run) do
    runner.converge("tweetbot_app_test::#{action}")
  end

  context 'the default action (:install)' do
    let(:action) { :default }

    it 'configures the Mac App Store' do
      expect(chef_run).to include_recipe('mac-app-store')
    end

    it 'installs the Tweetbot app' do
      expect(chef_run).to install_tweetbot_app('default')
    end

    it 'installs via the App Store' do
      expect(chef_run).to install_mac_app_store_app('Tweetbot for Twitter')
        .with(bundle_id: 'com.tapbots.TweetbotMac')
    end
  end
end
