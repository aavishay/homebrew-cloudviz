class Cloudviz < Formula
  desc "Azure cloud infrastructure visualization and cost management dashboard"
  homepage "https://github.com/aavishay/cloudviz"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/aavishay/cloudviz/releases/download/v0.3.0/cloudviz_0.3.0_darwin_arm64.tar.gz"
      sha256 "e948180002497cd4f1b614b2cafc23a67cfb676ddd4a199af324af3861bf3047"
    end
    on_intel do
      url "https://github.com/aavishay/cloudviz/releases/download/v0.3.0/cloudviz_0.3.0_darwin_amd64.tar.gz"
      sha256 "50087e8a2067f46ffee1c6b0235d336f46894b37fc01f6f28272c1710469945b"
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
