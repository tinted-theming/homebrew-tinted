class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  license "MIT"
  version "0.19.0"

  on_macos do
    url "https://github.com/tinted-theming/tinty/releases/download/v0.19.0/tinty-universal-apple-darwin.tar.gz" # universal-apple-darwin
    sha256 "b1adaa2711dbebd37ab0224569c7e83242c9f65569c6ee5df4a2c0b3d80fc155" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinty/releases/download/v0.19.0/tinty-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "944b7fd0bb597ed5e99f85d8518475f6cf8e458420d44ba8368311a64d4dd4c3" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinty/releases/download/v0.19.0/tinty-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "f65aff07310ae597078b791e821df30c005f6185e74ea0baa7a3d2ae003bf863" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.19.0/tinty-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "870c84131a73013d6d5749ab013ef0b5461560ab8cd5aeb9195dc49ff9c0aacf" # aarch64-unknown-linux-gnu
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
