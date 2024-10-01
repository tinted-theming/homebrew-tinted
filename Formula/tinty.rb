class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  license "MIT"
  version "0.21.0"

  on_macos do
    url "https://github.com/tinted-theming/tinty/releases/download/v0.21.0/tinty-universal-apple-darwin.tar.gz" # universal-apple-darwin
    sha256 "8ae1e85eece790b5af762e45a1198348c808f5d2752fd1af6d296fe82c689565" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinty/releases/download/v0.21.0/tinty-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "70fb9555f0499e8775ffc1821cccb34cddfc42aabebce9f04d2084263958ff8c" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinty/releases/download/v0.21.0/tinty-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "2b33ee3f4f6f89cc0a9926a17a1e688e48249eda9f783413f86dec48e13aabe4" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.21.0/tinty-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "ffc6514ef4f1e76f7ef61aa4d6cd30453fdec0c3b2567966cb7a5eadbeeca73b" # aarch64-unknown-linux-gnu
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
