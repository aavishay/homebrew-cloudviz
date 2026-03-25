class Cloudviz < Formula
  desc "Azure cloud infrastructure visualization and cost management dashboard"
  homepage "https://github.com/aavishay/cloudviz"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_darwin_arm64.tar.gz"
      sha256 "f47090cb1c3c2c7d615bc239e6e7f8ce3da6ae616d61c248c03188fcc40a355d"
    end
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_darwin_amd64.tar.gz"
      sha256 "229c656c367200e5c51766415fa2bee7a3407c5dc6ca8de95207ee5e472834b5"
    end
  end

  def install
    # The tar extracts to cloudviz/ directory with binary and dist/ inside
    bin.install Dir["cloudviz/cloudviz"].first => "cloudviz"
  end

  def post_install
    puts "CloudViz installed!"
    puts "Run 'cloudviz serve' to start the server."
    puts "Run 'cloudviz --help' for all available commands."
  end

  test do
    system "#{bin}/cloudviz", "--help"
  end
end
