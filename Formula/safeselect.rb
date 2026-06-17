class Safeselect < Formula
  desc "MCP SQL Fail-Closed for AI Agents"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.2.0/safeselect-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "dd24a7c25dc2532dc0384453147a12007e082c3148c0906db0983cdba6decc7f"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.2.0/safeselect-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "60e0672cf4fa0f392c0d7fb6fa9f5b2eab8b10c32a3f5cf19f136ff26a83a86a"
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
