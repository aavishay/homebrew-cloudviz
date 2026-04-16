class Cloudviz < Formula
  desc "Azure cloud infrastructure visualization and cost management dashboard"
  homepage "https://github.com/aavishay/cloudviz"
  license "MIT"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_arm64.tar.gz"
      sha256 "2a932398c86ecfd8b0abb98dce994e080afa11e0c9d28d920eb5bc0d69d6e221"
    end
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_amd64.tar.gz"
      sha256 "609b223d2af2d05e47abdcb92a00e87854ae90082ef65ede51fd7e44d8acb147"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_linux_amd64.tar.gz"
      sha256 "86b7b307812cf0becc51635e9dd45c759c557d97523fee17046f01abb3535311"
    end
  end

  def install
    bin.install "cloudviz_#{version}_#{OS.kernel_name.downcase}_#{Hardware::CPU.arch.to_s.gsub(/x86_64/, "amd64")}" => "cloudviz"
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
