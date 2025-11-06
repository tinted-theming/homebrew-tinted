class TintedBuilderRust < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  license "APACHE-2.0 OR MIT"
  version "0.13.2"

  on_macos do
    url "" # universal-apple-darwin
    sha256 "" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.13.2/tinted-builder-rust-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "51a68e43b86192bf081f99bf3c1798d9e346d5dd016d76f31ea75a58585d9386" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.13.2/tinted-builder-rust-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "fe7021d35acb9ee6bab24c9818809339cde963081360912eff41ada6f3c23159" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.13.2/tinted-builder-rust-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "fc00249ccadaa4e0dfcdee5058b1bedcaba90c5021fe44bb82be105ff2b20ff4" # aarch64-unknown-linux-gnu
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
