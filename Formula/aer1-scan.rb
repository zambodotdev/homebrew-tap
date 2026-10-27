class Aer1Scan < Formula
  desc "Check every Zambo receipt link in a file or page (AER-1)"
  homepage "https://github.com/zambodotdev/aer1-scan"
  url "https://registry.npmjs.org/aer1-scan/-/aer1-scan-1.0.1.tgz"
  sha256 "7ec058bb2aef8c81e3e67258c0e52bb678f81eea2a13efb7fd4641ef0ae6b29a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_install_args(libexec)
    bin.install_symlink libexec/"bin/aer1-scan"
  end

  test do
    (testpath/"empty.txt").write("nothing here\n")
    assert_match "no zambo receipt links found", shell_output("#{bin}/aer1-scan #{testpath}/empty.txt", 1)
  end
end
