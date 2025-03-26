class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  license "MIT"
  version "0.27.0"

  on_macos do
    url "https://github.com/tinted-theming/tinty/releases/download/v0.27.0/tinty-universal-apple-darwin.tar.gz" # universal-apple-darwin
    sha256 "c9865600d019d4f87e7942790a96c273649c35531adabb462542b765e594cb66" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinty/releases/download/v0.27.0/tinty-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "9576204033d2f8bcfeb2f7ffbf787051f526d4e048ffc601b80ddb6919954552" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinty/releases/download/v0.27.0/tinty-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "3c8fe32e7cd0cda87ffea9bf59b1d6568ea0046c59a2d565dc94e8f482899d35" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.27.0/tinty-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "9c33d07e8e7575f9aab4526e829956b4e64ba4dfd2f4d9eab05528f097ad19e3" # aarch64-unknown-linux-gnu
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
