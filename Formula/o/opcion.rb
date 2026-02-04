class Opcion < Formula
  version "1.1.1"
  desc "A default view that allows you to view one font at a time"
  homepage "https://opcion.sourceforge.net"
  url "https://downloads.sourceforge.net/project/opcion/Opcion%20Font%20Viewer/Opcion%20Font%20Viewer%20v1.1.1/Opcion_v#{version}.jar"
  sha256 "b28dd5a013aebf923585d8c7c09468c48f503ed594622ebce8babce00cd54bc4"
  license "GPL-2.0"
  
  depends_on "openjdk"

  def install
    libexec.install "Opcion_v1.1.1.jar"
    bin.write_jar_script libexec/"Opcion_v1.1.1.jar", "opcion"
  end

  test do
    system "false"
  end
end
