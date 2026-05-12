class Makevn < Formula
  desc "Terminal-first workflows for Java Maven repositories"
  homepage "https://github.com/antonillos/makevn"
  license "MIT"

  head "https://github.com/antonillos/makevn.git", branch: "main"

  stable do
    url "https://github.com/antonillos/makevn/releases/download/v0.1.0/makevn-v0.1.0.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  depends_on "rust" => :build

  def install
    if build.head?
      system "./build-rust-dispatcher.sh"
    else
      system "cargo", "build", "--release", "--manifest-path", "rust/dispatcher/Cargo.toml"
    end

    bin.install "target/release/makevn"

    (libexec/"makevn").install Dir[
      "libexec/makevn/backend.sh",
      "libexec/makevn/cli.sh",
      "libexec/makevn/common.sh",
      "libexec/makevn/commands",
      "libexec/makevn/common",
      "libexec/makevn/coverage",
      "libexec/makevn/docker",
      "libexec/makevn/jdk",
      "libexec/makevn/compat",
    ]

    (share/"makevn").install Dir["share/makevn/*"]
    (share/"makevn/skills/makevn").install Dir["skills/makevn/*"]
  end

  def caveats
    <<~EOS
      makevn has been installed. To get started:

        makevn --help

      Run makevn from a Java Maven repository:

        makevn doctor
        makevn init
        makevn test --name UserRepositoryTest

      For MCP (Model Context Protocol) support:

        npx -y @antonillos/makevn-mcp

      Or add to your Claude Desktop config:

        "mcpServers": {
          "makevn": {
            "command": "npx",
            "args": ["-y", "@antonillos/makevn-mcp"]
          }
        }

      See https://github.com/antonillos/makevn for more.
    EOS
  end

  test do
    assert_match "makevn", shell_output("#{bin}/makevn --help")
  end
end
