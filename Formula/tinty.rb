class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  license "MIT"
  version "0.31.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.31.0/tinty-aarch64-apple-darwin.tar.gz" # aarch64-apple-darwin
      sha256 "4ac0f84a5cb8a73ffb356d2882a29ad3750cf5c69b927e8300587ec7f724d631" # aarch64-apple-darwin
    elsif Hardware::CPU.intel?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.31.0/tinty-x86_64-apple-darwin.tar.gz" # x86_64-apple-darwin
      sha256 "6bf6ac305a4cccb12ab0ac78da8ae5759c6bde64d752f415158c599fa34f088a" # x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinty/releases/download/v0.31.0/tinty-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "6a8e843f974a4f6e38862e7feb969c26baa7e6e149814cf8cff20184bbcbaa04" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinty/releases/download/v0.31.0/tinty-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "78627280b75a540f101ea77906243e14d33e705094587dd9cedb111c24f67095" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.31.0/tinty-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "c3aed972a00ceeb4cf8247feffe6fb305c4936914133a584143b624ac8516a70" # aarch64-unknown-linux-gnu
    end
  end

  def install
    if OS.mac? || (OS.linux? && (Hardware::CPU.intel? || (Hardware::CPU.arm? && Hardware::CPU.is_64_bit?)))
      bin.install "tinty"
    else
      system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    end
  end

  test do
    assert_match "tinty #{version}", shell_output("#{bin}/tinty --version")
  end
end
