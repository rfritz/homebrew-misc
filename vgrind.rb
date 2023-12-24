# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Vgrind < Formula
  desc "The venerable BSD prettyprinter"
  homepage "https://github.com/rfritz/vgrind"
  url "https://github.com/rfritz/vgrind/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "209da075365b255d51b2b7efb0c3ffdfb8ccef8d3019fe008e810ba4094fd1c4"
  license "BSD-2-Clause"

  depends_on "cmake" => :build
  # This might not be necessary, but the version provided with macOS
  # is nearly two decades old
  depends_on "groff"            

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test vgrind`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
