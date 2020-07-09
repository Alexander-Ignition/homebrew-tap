class AirPush < Formula
  desc "Apple Push notifications"
  homepage "https://github.com/Alexander-Ignition/AirPush"
  url "https://github.com/Alexander-Ignition/AirPush.git"
  version "0.0.1"
  license "Apache-2.0"

  depends_on :xcode => ["11.5", :build]

  def install
    system "swift", "build", "-c", "release", "--package-path", name
    bin.install "air-push/.build/x86_64-apple-macosx/release/#{name}"
  end

  test do
    system "#{bin}/#{name}", "--version"
  end
end
