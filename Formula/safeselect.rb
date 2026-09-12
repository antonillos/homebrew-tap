class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.9/safeselect-v0.7.9-aarch64-apple-darwin.tar.gz"
    sha256 "ed56aecd3d9770d01ed33512db8faba093c35a0eaa202bd7fd895d67f2646e5e"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.7.9/safeselect-v0.7.9-x86_64-apple-darwin.tar.gz"
    sha256 "84400703e5cd9ece9d680077a44a9b1caad9cde1168b174bf7f2032037de0a81"
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
