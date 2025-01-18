class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  license "MIT"
  version "0.26.0"

  on_macos do
    url "https://github.com/tinted-theming/tinty/releases/download/v0.26.0/tinty-universal-apple-darwin.tar.gz" # universal-apple-darwin
    sha256 "6a00fddc4c438632bfbf9b990b4c836256352154e5e3b0f7024bd683596febfb" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinty/releases/download/v0.26.0/tinty-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "cb2094ab3f563be19cf09705fc5790c4a3bce86cf3066a2e571b456810098a29" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinty/releases/download/v0.26.0/tinty-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "15763445ae2047c7c2f326c3275bce314dadd0890b9942f74d9fb31c7941b1d5" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.26.0/tinty-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "47c4bcd53c3c4994ff2fbf5ec693977bb1621abf9478a80b58ecec99c1840697" # aarch64-unknown-linux-gnu
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
