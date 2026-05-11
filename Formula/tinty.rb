class Tinty < Formula
  desc "Change the theme of your terminal, text editor and anything else with one command."
  homepage "https://github.com/tinted-theming/tinty"
  license "GPL-3.0"
  version "0.32.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.32.2/tinty-aarch64-apple-darwin.tar.gz" # aarch64-apple-darwin
      sha256 "748133941f0fd380ded923c2fda8c53cf95b83b786690f303fc01b064f360be5" # aarch64-apple-darwin
    elsif Hardware::CPU.intel?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.32.2/tinty-x86_64-apple-darwin.tar.gz" # x86_64-apple-darwin
      sha256 "4b47bdf90c50d3be985157de373966bef17c3881e9d48974176027561c540cc2" # x86_64-apple-darwin
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/tinty/releases/download/v0.32.2/tinty-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "70c4846090fd2a7262621c1f519b85d8a89f51c962ea603236e958d194ada77a" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/tinty/releases/download/v0.32.2/tinty-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "4ef6733dce14bace2bb30010994d82208fd4c314b15a106c8461c6ebb16ccc9e" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/tinty/releases/download/v0.32.2/tinty-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "710a1c1b9ee24d61a94163e06954a85749ba483dcdcf018628d85f1e557fda4a" # aarch64-unknown-linux-gnu
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
