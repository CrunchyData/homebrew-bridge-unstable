class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/crunchydata/homebrew-bridge-unstable/releases/download/v4.0.0-alpha.0/cb-4.0.0-alpha.0.tar.gz"
  sha256 "a24de0ec44af02e4c1a4371fa0349ed2d55046de9899978700d01836b7e4f6a9"

  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "make" => :build
  depends_on "wget" => :build

  def install
    ENV["VERSION"] = "v#{version}"
    system "make", "release"
    bin.install "build/cb"
    # ["bash", "fish", "zsh"].each do |shell|
    #   if shell == "bash" && which("bash")
    #     bash_completion.install "#{bin}/cb completion bash" => "cb"
    #   elsif shell == "fish" && which("fish")
    #     fish_completion.install "#{bin}/cb completion fish"
    #   elsif shell == "zsh" && which("zsh")
    #     zsh_completion.install "#{bin}/cb completion zsh" => "_cb"
    #   end
    # end
  end

  test do
    assert_match "cb v4.0.0-alpha.0", shell_output(bin/"cb version")
  end
end
