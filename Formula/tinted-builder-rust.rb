class TintedBuilderRust < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  license "APACHE-2.0 OR MIT"
  version "0.15.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.1/tinted-builder-rust-aarch64-apple-darwin.tar.gz" # aarch64-apple-darwin
      sha256 "c3bfa30fc34a3df22016c2eebdb611dc1c5b078b406ffa926aa3568212547399" # aarch64-apple-darwin
    elsif Hardware::CPU.intel?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.1/tinted-builder-rust-x86_64-apple-darwin.tar.gz" # x86_64-apple-darwin
      sha256 "7cd93a2f39a5b35b7e3836b47baf431808b2082a5a892222147018344a8af08f" # x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.1/tinted-builder-rust-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "f2309112c45760392c429c4b4592263f29bdd15cf2ad292beb58933bd98b0e2e" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.1/tinted-builder-rust-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "8f988751ff713818aa1eea2a006cc74be6a32e7f4ba8a74d44ebdf8a919f5be9" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.1/tinted-builder-rust-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "37048d0ba5fabea95709828a267611134489c7c213547c3abee98002596e5ddd" # aarch64-unknown-linux-gnu
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
