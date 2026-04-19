class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  license "MIT"
  version "0.30.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.30.0/tinty-aarch64-apple-darwin.tar.gz" # aarch64-apple-darwin
      sha256 "d44eef232c7d7d83f372cf660e9c58a41dc4866b60182e7d1f2bf1e073b75448" # aarch64-apple-darwin
    elsif Hardware::CPU.intel?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.30.0/tinty-x86_64-apple-darwin.tar.gz" # x86_64-apple-darwin
      sha256 "147915140f396bc3fb14a3e72d905dc7e26e3e3a8bffd1dce662c953824d259a" # x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinty/releases/download/v0.30.0/tinty-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "bbbf3212bd5761817cb582e9b357858552c6e64b284c34e58594bd0d4867e650" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinty/releases/download/v0.30.0/tinty-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "7c6bc197fcfffddbe8c7cbeafd7db1c2fe9825a842af3f2ebc342dd7cc869a1f" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.30.0/tinty-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "0dcd294c0fef8d22f5320178255dfe14734e28598b21121e173a7285e3d278bb" # aarch64-unknown-linux-gnu
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
