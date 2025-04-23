class Cb < Formula
    desc "CLI for Crunchy Bridge"
    homepage "https://crunchybridge.com"
    version "v4.0.0-alpha.0"
    license "Apache-2.0"

    on_macos do
      if Hardware::CPU.intel?
        url "https://github.com/CrunchyData/bridge-cli-v2/releases/download/vv4.0.0-alpha.0/cb-v4.0.0-alpha.0_macos_amd64.zip"
        sha256 "75e3b3afa8ece514558a4e7dcb3c75bc85d76ebc6b805395ea66a1c378fe6212"
      end
      if Hardware::CPU.arm?
        url "https://github.com/CrunchyData/bridge-cli-v2/releases/download/vv4.0.0-alpha.0/cb-v4.0.0-alpha.0_macos_arm64.zip"
        sha256 "850e357ce64e27b6449cbf0b435cf93833dddbe0a2333cab14e34b244a700159"
      end
    end

    on_linux do
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/CrunchyData/bridge-cli-v2/releases/download/vv4.0.0-alpha.0/cb-v4.0.0-alpha.0_linux_amd64.zip"
        sha256 "9f9ca7e461b409eff28bbd015d8941a7b7b59f99126c33e79361ce74dd2d2c69"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/CrunchyData/bridge-cli-v2/releases/download/vv4.0.0-alpha.0/cb-v4.0.0-alpha.0_linux_arm64.zip"
        sha256 "b4fc5d6deed7c050d69eb7f8a0cd655d729afa8767def748a58b6a89081c4598"
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
      assert_match "cb vv4.0.0-alpha.0", shell_output(bin / "cb version")
    end
end`