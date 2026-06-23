class Safeselect < Formula
  desc "MCP SQL Fail-Closed for AI Agents"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.4.0/safeselect-v0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "a42669f7a4a54e23721505b3b6f61c8f0d3ff79800755e44ad513014201bf9c3"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.4.0/safeselect-v0.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "812ebd0c53b237e333a7f987459bc9993ccef2adbf8adcd1491ec189c7e018ad"
  end

  depends_on "openjdk@17"

  def install
    bin.install "safeselect"
  end

  def caveats
    <<~EOS
      SafeSelect has been installed. To get started:

        safeselect --help

      A JDBC driver is required. Download the PostgreSQL driver:

        safeselect driver download --vendor postgresql

      For MCP (Model Context Protocol) support, install the integration:

        safeselect agent install opencode --environment <env> --name <name>

      (Run from your project repo — .safeselect/ is auto-detected.)
    EOS
  end

  test do
    assert_match "safeselect #{version}", shell_output("\#{bin}/safeselect --version")
  end
end
