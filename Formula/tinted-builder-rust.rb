class TintedBuilderRust < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  license "APACHE-2.0 OR MIT"
  version "0.17.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.17.0/tinted-builder-rust-aarch64-apple-darwin.tar.gz" # aarch64-apple-darwin
      sha256 "3f5cce350b5f8e40573c83adf293b3966c434939c0fbbc3b02a34410f883c2ab" # aarch64-apple-darwin
    elsif Hardware::CPU.intel?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.17.0/tinted-builder-rust-x86_64-apple-darwin.tar.gz" # x86_64-apple-darwin
      sha256 "09373cd005d5ca11ef6015b02c3b5302e47f69326ce5b7c33d639bf95b295ad6" # x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.17.0/tinted-builder-rust-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "803cbada2a5a6f589d73ceedec79c04db6e30a9ad5d61aa35da3049792baa642" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.17.0/tinted-builder-rust-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "3841a38f17a54eed4850f28baff66b2225114f85876c5742d46ad1ba971c7b02" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.17.0/tinted-builder-rust-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "cddfb2797718c9df6416d20dee075f7870960f2b4336aa6ae82b83e2133d485d" # aarch64-unknown-linux-gnu
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
