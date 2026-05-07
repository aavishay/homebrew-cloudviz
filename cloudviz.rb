class Cloudviz < Formula
  desc "Azure cloud infrastructure visualization and cost management dashboard"
  homepage "https://github.com/aavishay/cloudviz"
  license "MIT"
  version "1.10.3"

  depends_on "go" => :build
  depends_on "node" => :build

  head do
    url "https://github.com/aavishay/cloudviz.git", branch: "main"
  end

  stable do
    url "https://github.com/aavishay/cloudviz/archive/refs/tags/v#{version}.tar.gz"
    sha256 "5f6197dfd7b8ed3d535ba0e8d58807b238e9ac7d79393fb068b070ef387fe674"
  end

  def install
    system "cd frontend && npm install && npm run build"
    cp_r "frontend/dist", "backend/dist"
    cd "backend" do
      system "go", "build", "-o", "cloudviz", "main.go", "azure.go", "db.go", "types.go", "dependencies.go", "webhooks.go"
    end
    bin.install "backend/cloudviz"
  end

  def post_install
    puts "CloudViz v#{version} installed!"
    puts "Run 'cloudviz serve' to start the server."
    puts "Run 'cloudviz --help' for all available commands."
  end

  test do
    system "#{bin}/cloudviz", "--help"
  end
end
