class Cloudviz < Formula
  desc "Azure cloud infrastructure visualization and cost management dashboard"
  homepage "https://github.com/aavishay/cloudviz"
  license "MIT"
  version "0.8.5"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_arm64.tar.gz"
      sha256 "5bf33fd7c81cc205c66a4220d59038f80807a820bd22d3981a594a78f61e883b"
    end
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_darwin_amd64.tar.gz"
      sha256 "7c3af4a4e34f3c03bfca8a88108a6f3626cafe785928914b56e93ba3ad717e33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v#{version}/cloudviz_#{version}_linux_amd64.tar.gz"
      sha256 "a0503556675562dc8f17adf123391fa3574fb850b32389b918c231820cadc269"
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
