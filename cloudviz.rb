class Cloudviz < Formula
  desc "Azure cloud infrastructure visualization and cost management dashboard"
  homepage "https://github.com/aavishay/cloudviz"
  license "MIT"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_arm64.tar.gz"
      sha256 "04db27196a8c4cee23f2a65ada9a75a1506e8973f428846d65016d3d1b07fdde"
    end
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_amd64.tar.gz"
      sha256 "68e48734f9009527ea6a661ab130a3d9390c883e53a7128ff98169a2786a6549"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_linux_amd64.tar.gz"
      sha256 "b56526ce0f108ca01cca38a0f53fc0ced0d04a0e2a29ce9868a098db147f8974"
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
