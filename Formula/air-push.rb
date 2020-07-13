class AirPush < Formula
  desc "Apple Push notifications"
  homepage "https://github.com/Alexander-Ignition/AirPush"
  url "https://github.com/Alexander-Ignition/AirPush/archive/0.0.1.tar.gz"
  sha256 "3c3c0df0be6d86d003fda0c7cfa0ee82a50a6b5466e190e0343497bf2f1c4e12"
  version "0.0.1"
  license "Apache-2.0"

  depends_on :xcode => ["11.5", :build]

  bottle do
    root_url "https://github.com/Alexander-Ignition/AirPush/releases/download/0.0.1"
    cellar :any_skip_relocation
    sha256 "4b5fd04ec703ccba3e1e93e5323215b5666cbdef4e450f38dd5b9e3c26fd70ca" => :catalina
  end

  def install
    system "swift", "build", "-c", "release", "--package-path", name
    bin.install "air-push/.build/x86_64-apple-macosx/release/#{name}"
  end

  test do
    system "#{bin}/#{name}", "--version"
  end
end
