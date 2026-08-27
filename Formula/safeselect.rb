class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.6/safeselect-v0.7.6-aarch64-apple-darwin.tar.gz"
    sha256 "612979b7877bc06600555d202e85ae241a586ea42a50d70dbef00a63817119d4"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.6/safeselect-v0.7.6-x86_64-apple-darwin.tar.gz"
    sha256 "519e70de296808e0f8a0fdecc62d5c75b957cbf69ca9e7da12ad615be7b41f66"
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
