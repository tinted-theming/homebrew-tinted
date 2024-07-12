class TintedBuilderRust < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  license "APACHE-2.0 OR MIT"
  version ""

  on_macos do
    url "" # universal-apple-darwin
    sha256 "" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "" # x86_64-unknown-linux-gnu
        sha256 "" # x86_64-unknown-linux-gnu
      else
        url "" # i686-unknown-linux-gnu
        sha256 "" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "" # aarch64-unknown-linux-gnu
      sha256 "" # aarch64-unknown-linux-gnu
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
