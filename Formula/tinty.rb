class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  license "GPL-3.0"
  version "0.34.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.34.0/tinty-aarch64-apple-darwin.tar.gz" # aarch64-apple-darwin
      sha256 "d43ea17f29f3399a88b68fb34c9ee0816ba517be3ebca38550e47e46bdf72ff6" # aarch64-apple-darwin
    elsif Hardware::CPU.intel?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.34.0/tinty-x86_64-apple-darwin.tar.gz" # x86_64-apple-darwin
      sha256 "771a0530c7877daedb204544ae322398b1d86f09807015aa570632f8369f15a9" # x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinty/releases/download/v0.34.0/tinty-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "79bca0945006553e62469f363a4b50ecc3284c8263c1a223f00f95e335ee0907" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinty/releases/download/v0.34.0/tinty-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "a23b5ef6963d5983ca431bf965c53db74df6c3d6f51588f04e9289faca4ae3d0" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.34.0/tinty-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "cead27818e660459a39de26cc55d469073a80d5e0b5fe52576f3e91bf9e0ace6" # aarch64-unknown-linux-gnu
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
