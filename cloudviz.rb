class Cloudviz < Formula
  desc "Azure cloud infrastructure visualization and cost management dashboard"
  homepage "https://github.com/aavishay/cloudviz"
  license "MIT"
  version "1.9.0"

  depends_on "go" => :build
  depends_on "node" => :build

  head do
    url "https://github.com/aavishay/cloudviz.git", branch: "main"
  end

  stable do
    url "https://github.com/aavishay/cloudviz/archive/refs/tags/v#{version}.tar.gz"
    sha256 "a7a963fbcdd15fe385f4687545962d213d7be01165ce39f361eeb756ecde55cf"
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
