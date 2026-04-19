class TintedBuilderRust < Formula
  desc "A base16 and base24 builder written in Rust, focused on convenience for template maintainers."
  homepage "https://github.com/tinted-theming/tinted-builder-rust"
  license "APACHE-2.0 OR MIT"
  version "0.15.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.3/tinted-builder-rust-aarch64-apple-darwin.tar.gz" # aarch64-apple-darwin
      sha256 "4861cd163600c673a4f5f20c5bf1d012b5781282cc5847e08dcd5b7849c8738f" # aarch64-apple-darwin
    elsif Hardware::CPU.intel?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.3/tinted-builder-rust-x86_64-apple-darwin.tar.gz" # x86_64-apple-darwin
      sha256 "0028b9964fac8dee7b0705554cd50991ee95a9ad60570f68539c2618ffa127a7" # x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.3/tinted-builder-rust-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "28f73da11df8f9336104f3e94040e2bb197c9d83abd004aac535b4c6e51cae63" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.3/tinted-builder-rust-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "c50fa20dc368fb73da0772048af20ace059acec7ea63f4302bf925bb3dfbd106" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinted-builder-rust/releases/download/v0.15.3/tinted-builder-rust-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "c6b82e222e90067341d650a3eb7fc4ea6a019dfd1e41baa90ddf93588e03b08b" # aarch64-unknown-linux-gnu
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
