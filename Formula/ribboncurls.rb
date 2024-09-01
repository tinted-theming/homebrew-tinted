class Ribboncurls < Formula
  desc "Mustache template rendering engine"
  homepage "https://github.com/tinted-theming/ribboncurls"
  license "APACHE-2.0 OR MIT"
  version "0.4.0"

  on_macos do
    url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.4.0/ribboncurls-universal-apple-darwin.tar.gz" # universal-apple-darwin
    sha256 "1e4d18fe20862efd72b8ed3cfccda704569513f7bd93860a975468668072aaa5" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.4.0/ribboncurls-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "fb1d63e653c4425bf4d743ad49046ebe8a56a0603d2971f59e935240cd6ab552" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.4.0/ribboncurls-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "7a2cd9a8fb84b1d95a5454ff201f64d4360bce61a2d80c2d9c3a931b8e2b1835" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.4.0/ribboncurls-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "db7ee78f29d9f51b2bf7fb4dd826811160f84ac347444c84311333b15e04dca7" # aarch64-unknown-linux-gnu
    end
  end

  def install
    if OS.mac? || (OS.linux? && (Hardware::CPU.intel? || (Hardware::CPU.arm? && Hardware::CPU.is_64_bit?)))
      bin.install "ribboncurls"
    else
      system "cargo", "install", "--locked", "--root", prefix, "--path", "ribboncurls-cli"
    end
  end

  test do
    assert_match "ribboncurls #{version}", shell_output("#{bin}/ribboncurls --version")
  end
end
