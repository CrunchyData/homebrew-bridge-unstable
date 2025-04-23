class Cb < Formula
    desc "CLI for Crunchy Bridge"
    homepage "https://crunchybridge.com"
    version "4.0.0-alpha.0"
    license "GPL-3.0-or-later"
    revision 1

    if OS.mac? && Hardware::CPU.arm?
      url "https://github.com/CrunchyData/bridge-cli-v2/releases/download/v#{version}/cb-v#{version}_macos_arm64.zip"
      sha256 "20801e6703fbce1228a699b40bf24727cd1d6d1aa30fcdf2f24b11a783a30992"
    end

    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/CrunchyData/bridge-cli-v2/releases/download/v#{version}/cb-v#{version}_macos_amd64.zip"
      sha256 "ce39f562832ae7f9ca9d7f9ad791760349668264e155e664537bdb9152ae5c39"
    end

    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/CrunchyData/bridge-cli-v2/releases/download/v#{version}/cb-v#{version}_linux_arm64.zip"
      sha256 "44d74bc05d5da9f13bedb00162fc37050c5539c7622134e64d2ce22327431228"
    end

    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/CrunchyData/bridge-cli-v2/releases/download/v#{version}/cb-v#{version}_linux_amd64.zip"
      sha256 "87a6f0bf90452b0184db165a658df62ff493093f23cce9a38e9ebed88302718b"
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


    test do
      assert_match "cb v#{version}", shell_output(bin / "cb version")
    end
  end