class OpenOscarServer < Formula
  version "0.21.0"
  desc "Self-hostable instant messaging server compatible with classic AIM and ICQ clients"
  homepage "https://github.com/mk6i/open-oscar-server"
  url "https://github.com/mk6i/open-oscar-server/archive/refs/tags/v#{version}.tar.gz"
  sha256 "e5f9fc668cf8662605c41f934593862047b4370c8f9e7c4a04f1764b18406c4b"
  license "MIT"
  
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/server"
    (etc/"open-oscar-server").install "./config/ssl/settings.env"
  end

  def caveats
      <<~EOS
        The settings file is located in:
          #{etc}/open-oscar-server/settings.env
        It can be called by the binary by using:
          #{output} -config #{etc}/open-oscar-server/settings.env
      EOS
  end

  test do
    system "false"
  end
end
