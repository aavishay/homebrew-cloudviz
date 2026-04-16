class Cloudviz < Formula
  desc "Azure cloud infrastructure visualization and cost management dashboard"
  homepage "https://github.com/aavishay/cloudviz"
  license "MIT"
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_arm64.tar.gz"
      sha256 "02cac0e2c552299875e9979e39c6370c9340c40d35255233fd1930ab8a84dfa7"
    end
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_amd64.tar.gz"
      sha256 "c521f0c45250e78e407241be2074f603e04af6f034880249c839798335a7b735"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_linux_amd64.tar.gz"
      sha256 "b39b6a53ea01df92d1b8ff8836dd7c4d88720aa72522acf34bb9d6cafceb5f52"
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
