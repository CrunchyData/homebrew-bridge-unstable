class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  version "4.0.0-alpha.0"
  url "https://github.com/crunchydata/homebrew-bridge-unstable/releases/download/v${version}/cb-${version}.tar.gz"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "make" => :build

  bottle do
  end

  def install
    ENV["VERSION"] = version
    system "make", "release"

    bin.install "build/cb" => "cb"
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
    assert_match "cb v4.0.0-alpha.0", shell_output(bin/"cb version")
  end
end