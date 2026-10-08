class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.12/safeselect-v0.7.12-aarch64-apple-darwin.tar.gz"
    sha256 "54e24e7bd16f47a753edfd7facaaa752192f7b00bf71e0782fbc295fde56073b"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.12/safeselect-v0.7.12-x86_64-apple-darwin.tar.gz"
    sha256 "77b829e97c5aba9eaa63c1e1bf67496836a1010af6b31a87ceb458cee3226feb"
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
