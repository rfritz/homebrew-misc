class Vgrind < Formula
  desc "Venerable BSD prettyprinter"
  homepage "https://github.com/rfritz/vgrind"
  url "https://github.com/rfritz/vgrind/archive/refs/tags/v2.1.2.tar.gz"
  sha256 "df6676eb173449d4660fd7d0963ecbdd4bb7aa1b7c48fb46e72b17a765682b30"
  license "BSD-2-Clause"

  depends_on "cmake" => :build
  # some versions of macOS provide this, others don't.  Require the
  # Homebrew version, just in case.
  depends_on "groff"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/pprint", "-lcsh", "#{bin}/pprint"
  end
end
