class TintedBuilderRust < Formula
  desc "A base16, base24 and tinted8 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  license "GPL-3.0"
  version "0.21.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.21.0/tinted-builder-rust-aarch64-apple-darwin.tar.gz" # aarch64-apple-darwin
      sha256 "b8fee54cea95ff7631bfb9e7175a733d99c6131348146ff3932cbc67479eadf0" # aarch64-apple-darwin
    elsif Hardware::CPU.intel?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.21.0/tinted-builder-rust-x86_64-apple-darwin.tar.gz" # x86_64-apple-darwin
      sha256 "2eb5f4a49d1403269413b1630a6035fced06aeae161b779a9f24a8eeb649f264" # x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.21.0/tinted-builder-rust-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "58118cc6a3b2743443ca01346c1cb215763db51eb9ad724e130e583a1493044a" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.21.0/tinted-builder-rust-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "8666f020fe917637ccbf8227526d205f9f01bbd581769e56b63a19a5daba2062" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.21.0/tinted-builder-rust-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "1cd31a16104d69248766a71641bbd43802a1327e0aeba339db9f182553834a3a" # aarch64-unknown-linux-gnu
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
