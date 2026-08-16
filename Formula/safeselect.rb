class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.0/safeselect-v0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "a47b4cda85c742d7ed69d400a93bd5fb46699bee5f31dad1baae8f8fccb58807"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.0/safeselect-v0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "50c9610e3f0185262db0109894f9a97ace6b485c93e27bc3771123d4fb8bb308"
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
