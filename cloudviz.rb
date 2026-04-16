class Cloudviz < Formula
  desc "Azure cloud infrastructure visualization and cost management dashboard"
  homepage "https://github.com/aavishay/cloudviz"
  license "MIT"
  version "0.8.4"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_arm64.tar.gz"
      sha256 "2cf86a5d1a0abfdfa2e6fbd719ab7278b0bb2120b30cd3869532a8fddc116131"
    end
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_amd64.tar.gz"
      sha256 "be0a575256789d4253a0ab0ddc0d089a0c74b7c329c5274f961b56bdcd002419"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_linux_amd64.tar.gz"
      sha256 "4e349c1bf1d53632bda32d515019f1d0109f5b453c766534e152103396488a34"
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
