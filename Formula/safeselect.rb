class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.11/safeselect-v0.7.11-aarch64-apple-darwin.tar.gz"
    sha256 "e8e0f3bf7c3932909718577ce7cab92d017fbf7205281f4f213b9fdf46f9b5b3"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.11/safeselect-v0.7.11-x86_64-apple-darwin.tar.gz"
    sha256 "6ecc3bc044465b0ca373f7a9df0fd8d60f2b5ea54bc8c1a4a05129afa4053bd4"
  end

  def install
    bin.install "safeselect"
  end

  def caveats
    <<~EOS
      SafeSelect has been installed. To get started:

        safeselect --help

      SafeSelect requires Java 17 or newer at runtime. If needed, install it with:

        brew install openjdk@17

      PostgreSQL requires a JDBC driver. Download it with:

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
