class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/CrunchyData//home/runner/work/bridge-cli-v2/bridge-cli-v2/homebrew-bridge-unstable/releases/download/v4.0.0-alpha.0/cb-v4.0.0-alpha.0_macos_amd64.zip"
      sha256 "691c83332e91874f0d47bf4f1d16eaf376f2f0e1241c433f9bf20c7f6aa53fa3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/CrunchyData//home/runner/work/bridge-cli-v2/bridge-cli-v2/homebrew-bridge-unstable/releases/download/v4.0.0-alpha.0/cb-v4.0.0-alpha.0_macos_arm64.zip"
      sha256 "57a773a857894e52ce059e7716928d385eb748ab0bd2fcb8e21511ec5f48182a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CrunchyData//home/runner/work/bridge-cli-v2/bridge-cli-v2/homebrew-bridge-unstable/releases/download/v4.0.0-alpha.0/cb-v4.0.0-alpha.0_linux_arm64.zip"
      sha256 "6caefa4acc01f89ff57217079f817eabe8e24cb05a17dcd994fd7fde81b154f9"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/CrunchyData//home/runner/work/bridge-cli-v2/bridge-cli-v2/homebrew-bridge-unstable/releases/download/v4.0.0-alpha.0/cb-v4.0.0-alpha.0_linux_amd64.zip"
      sha256 "9ece36a6217a5eca1e5a191fec7f594a31814b8fdce37af7e205e6486aaeff02"
    end
  end

  def install
    bin.install "cb"
    ["bash", "fish", "zsh"].each do |shell|
      if shell == "bash" && which("bash")
        bash_completion.install "#{bin}/cb completion bash" => "cb"
      elsif shell == "fish" && which("fish")
        fish_completion.install "#{bin}/cb completion fish"
      elsif shell == "zsh" && which("zsh")
        zsh_completion.install "#{bin}/cb completion zsh" => "_cb"
      end
    end
  end

  test do
    assert_match "cb v4.0.0-alpha.0", shell_output(bin / "cb version")
  end
end
