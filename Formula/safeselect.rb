class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.8.0/safeselect-v0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "af7d2df308546a579235d10afd9cb5464401c70af9e9654bcd2fa4f3155c69f6"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.8.0/safeselect-v0.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "75703cb48f863e7afc320d384cd17959789ad72e0c26f971855b664c5c6aecf8"
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
