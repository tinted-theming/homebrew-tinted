class TintedBuilderRust < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  license "APACHE-2.0 OR MIT"
  version "0.9.3"

  on_macos do
    url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.9.3/tinted-builder-rust-universal-apple-darwin.tar.gz" # universal-apple-darwin
    sha256 "c8840a66c2338cd3756f0e81228e0f5f91e8bbbfbb023ee8c5c159b7258302c9" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.9.3/tinted-builder-rust-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "051240384388ae6eb2f1b267e765618fbfc9033518ea014d0b95b1b36810511d" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.9.3/tinted-builder-rust-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "bd8f53582ec28814c1a0098e0c4e7da1cec42a64398d868293bcff5606cd9f01" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.9.3/tinted-builder-rust-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "81d7028839790cc340431d13e7741105921e2c91adfbaf486749d7c65bdab995" # aarch64-unknown-linux-gnu
    end
  end

  def install
    if OS.mac? || (OS.linux? && (Hardware::CPU.intel? || (Hardware::CPU.arm? && Hardware::CPU.is_64_bit?)))
      bin.install "tinted-builder-rust"
    else
      system "cargo", "install", "--locked", "--root", prefix, "--path", "tinted-builder-rust"
    end
  end

  test do
    assert_match "tinted-builder-rust #{version}", shell_output("#{bin}/tinted-builder-rust --version")
  end
end
