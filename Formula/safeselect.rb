class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.6.2/safeselect-v0.6.2-aarch64-apple-darwin.tar.gz"
    sha256 "77f62ad3260ed4f60b4722525b884f1a4d341abe9b5d29d69eac60164f656a88"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.6.2/safeselect-v0.6.2-x86_64-apple-darwin.tar.gz"
    sha256 "2855f5655c9fe188ff71fbeca17eb1c3e6cef1da27d04c5ee66c5ee7443169f3"
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
