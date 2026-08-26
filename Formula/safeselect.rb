class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.4/safeselect-v0.7.4-aarch64-apple-darwin.tar.gz"
    sha256 "778a1862b5c3685a35036356e21b0083493cd5c52ca5c22ad0f403b699ee0df4"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.4/safeselect-v0.7.4-x86_64-apple-darwin.tar.gz"
    sha256 "33fda5119a38ba13be56cb86442a58af92a1fca9afb28b68c8b161dc14945fb9"
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
