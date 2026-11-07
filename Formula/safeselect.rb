class Safeselect < Formula
  desc "Fail-closed read-only database access for AI agents over MCP"
  homepage "https://github.com/antonillos/safeselect"
  license "MIT OR Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/antonillos/safeselect/releases/download/v0.9.0/safeselect-v0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "48ad410b4b6c54c9124c2b85f8c7d469d3e63674c11e4d4157b812a04e3c4d58"
  else
    url "https://github.com/antonillos/safeselect/releases/download/v0.9.0/safeselect-v0.9.0-x86_64-apple-darwin.tar.gz"
    sha256 "23cd18de8c80253329ddb831b0cfa36954316819a7aba0bbef8c4441437d7079"
  end

  def install
    bin.install "safeselect"
  end

  def caveats
    <<~EOS
      Requires Java 17+ for database commands.

      Get started: https://github.com/antonillos/safeselect#quick-start
      CLI help:    safeselect --help
    EOS
  end

  test do
    assert_match "safeselect #{version}", shell_output("\#{bin}/safeselect --version")
  end
end
