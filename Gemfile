source "https://rubygems.org"

ruby ">= 3"

gem "fastlane", git: "git@github.com:kentrh/fastlane.git", branch: "bug/20012-scan-cannot-find-xcresult-testing-swift-package"
plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
