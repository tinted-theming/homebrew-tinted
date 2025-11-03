class Ribboncurls < Formula
  desc "Mustache template rendering engine"
  homepage "https://github.com/tinted-theming/ribboncurls"
  license "APACHE-2.0 OR MIT"
  version "0.5.0"

  on_macos do
    url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.5.0/ribboncurls-universal-apple-darwin.tar.gz" # universal-apple-darwin
    sha256 "16246c437b1143c1b6750c44a8feb051972124dd3a64a0cf7622cf351e6bf0b5" # universal-apple-darwin
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.5.0/ribboncurls-x86_64-unknown-linux-gnu.tar.gz" # x86_64-unknown-linux-gnu
        sha256 "782f46db9170f74d20aa14fb89a0c584c937aa63cc9c2ba1ab0753d071be1c07" # x86_64-unknown-linux-gnu
      else
        url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.5.0/ribboncurls-i686-unknown-linux-gnu.tar.gz" # i686-unknown-linux-gnu
        sha256 "448f3f844c4f402791b8d1728d9f1c1c8ca6481ef635e1ea7e4080851ed2b7b7" # i686-unknown-linux-gnu
      end
    elsif Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tinted-theming/ribboncurls/releases/download/v0.5.0/ribboncurls-aarch64-unknown-linux-gnu.tar.gz" # aarch64-unknown-linux-gnu
      sha256 "35edbbececf7ac0868ebb0ea9b70bef1d49d29284ae232a28da488ccde302aae" # aarch64-unknown-linux-gnu
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
