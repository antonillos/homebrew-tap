class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.1/makevn-v0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "e11dd2ac9dc12ececdc17a4429f611f831e143016352f28507eeb66b1ecacd8b"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.1/makevn-v0.1.1-x86_64-apple-darwin.tar.gz"
    sha256 "fe8af019cdb655093ae2b0f0cdea0299b8fe3eb48b24111c9356afec1b37e431"
  end

  def install
    bin.install "bin/makevn"
    bin.install "bin/makevn-mcp"
    libexec.install "libexec/makevn"
    share.install "share/makevn"
  end

  def caveats
    <<~EOS
      makevn has been installed. To get started:

        makevn --help

      For MCP (Model Context Protocol) support, add to your client config:

      {
        "mcpServers": {
          "makevn": {
            "command": "#{HOMEBREW_PREFIX}/bin/makevn-mcp"
          }
        }
      }
    EOS
  end

  test do
    assert_match "makevn", shell_output("#{bin}/makevn --help")
    assert_path_exists bin/"makevn-mcp"
  end
end
