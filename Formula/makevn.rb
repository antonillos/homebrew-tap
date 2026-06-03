class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/makevn/releases/download/v0.1.6/makevn-v0.1.6-aarch64-apple-darwin.tar.gz"
    sha256 "4c9d003bab2400e5903f2944816d33d14217c3985e99454c32e79c7a64d41cef"
  else
    url "https://github.com/antonillos/makevn/releases/download/v0.1.6/makevn-v0.1.6-x86_64-apple-darwin.tar.gz"
    sha256 "2c40b93feac50b2ebfb89af7f40bc5cd5b94ffe7601682e04299ab0c467d947e"
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
