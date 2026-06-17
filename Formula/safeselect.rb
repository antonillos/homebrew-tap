class Safeselect < Formula
  desc "MCP SQL Fail-Closed for AI Agents"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.1.1/safeselect-v0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "78f3125213a9106d765403513516473fcc6cc9ee4100f4d32a4bc5eb65bcb82f"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.1.1/safeselect-v0.1.1-x86_64-apple-darwin.tar.gz"
    sha256 "97270e7fdd819232bd45169f55e9385f0fc80da107b466b137d1783ceacd4dd9"
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
