class Wpr < Formula
  desc "Write shaders, use them as your wallpaper."
  homepage "https://github.com/maxwofford/wpr"
  url "https://github.com/maxwofford/wpr/releases/download/v0.1.2/wpr-v0.1.2-macos.tar.gz"
  sha256 "20efc01747519ce03e90605555eefd7615e12173aad9a85e17521f09879b2b7c"
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
