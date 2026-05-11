class TintedBuilderRust < Formula
  desc "A base16, base24 and tinted8 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  license "GPL-3.0"
  version "0.20.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.20.1/tinted-builder-rust-aarch64-apple-darwin.tar.gz" # aarch64-apple-darwin
      sha256 "2405d87f7d872c49fa952496b1958bb2e8c01d08af5196521222fd9463f79e62" # aarch64-apple-darwin
    elsif Hardware::CPU.intel?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.20.1/tinted-builder-rust-x86_64-apple-darwin.tar.gz" # x86_64-apple-darwin
      sha256 "6279d19a2c94c43341b6e4f6b13658d0c98e9633304f0c59a0abbb46b0081a71" # x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.20.1/tinted-builder-rust-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "fdb31d448b6e5eb05c35117955e27cc2f8199acb8f64f6ebf7b301b4c0937b03" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.20.1/tinted-builder-rust-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "8da0c97c84c55197e49b4c4531042090b850a9ccfee8d3987ee59433fcef62e5" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.20.1/tinted-builder-rust-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "245783d5aae04be56e6b0289776a74b095b398d272876da7babb0917fe6e2c0e" # aarch64-unknown-linux-gnu
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
