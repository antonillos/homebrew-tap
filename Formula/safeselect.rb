class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.5/safeselect-v0.7.5-aarch64-apple-darwin.tar.gz"
    sha256 "3ed46b32fbe9093c52d1c6ba52f653abc826b56db37d8ab10c50b1af51209f8b"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.5/safeselect-v0.7.5-x86_64-apple-darwin.tar.gz"
    sha256 "2ad24c1a1545ce0d394f7d01a592254f23ce727f600553341f96e10ae8517dd1"
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
