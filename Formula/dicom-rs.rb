class DicomRs < Formula
  version "0.9.0"
  desc "A DICOM implementation for the next generation of medical imaging systems"
  homepage "https://dicom-rs.github.io"
  url "https://github.com/Enet4/dicom-rs/archive/refs/tags/v#{version}.tar.gz"
  sha256 "e1ab480fb2c608b6a15a45afc0b9acf96435a786e254d390dc21f359ce15d711"
  license any_of: ["Apache-2.0", "MIT"]

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--locked", "--release"
    
    bin.install "target/release/dicom-dictionary-builder"
    bin.install "target/release/dicom-dump"
    bin.install "target/release/dicom-echoscu"
    bin.install "target/release/dicom-findscu"
    bin.install "target/release/dicom-fromimage"
    bin.install "target/release/dicom-scpproxy"
    bin.install "target/release/dicom-storescp"
    bin.install "target/release/dicom--storescu"
    bin.install "target/release/dicom-toimage"
    doc.install "CODE_OF_CONDUCT.md"
    doc.install "CONTRIBUTING.md"
    doc.install "LICENSE-APACHE"
    doc.install "LICENSE-MIT"
    doc.install "README.md"
  end

  test do
    system "false"
  end
end
