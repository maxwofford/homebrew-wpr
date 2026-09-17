class Wpr < Formula
  desc "Write shaders, use them as your wallpaper."
  homepage "https://github.com/maxwofford/wpr"
  url "https://github.com/maxwofford/wpr/releases/download/v0.1.1/wpr-v0.1.1-macos.tar.gz"
  sha256 "47033bfcd4de8edc72828e93d6c3985f5f27a643a3e3ede544b06dd952597772"
  license "MIT"
  head "https://github.com/maxwofford/wpr.git", branch: "main"

  depends_on macos: :sonoma

  def install
    if build.head?
      system "swift", "build", "-c", "release", "--disable-sandbox"
      bin.install ".build/release/wpr"
    else
      bin.install "wpr"
    end
  end

  test do
    assert_match "wallpapers", shell_output("#{bin}/wpr --help")
  end
end
