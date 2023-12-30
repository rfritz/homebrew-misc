# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Vgrind < Formula
  desc "The venerable BSD prettyprinter"
  homepage "https://github.com/rfritz/vgrind"
  url "https://github.com/rfritz/vgrind/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "b136df845d3bc6be9c84a280a16982e6cccbd3c986b81bba7031cea887261892"
  license "BSD-2-Clause"

  depends_on "cmake" => :build
  # some versions of macOS provide this, others don't.  Require the
  # Homebrew version, just in case.
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
    # This script really ought to return error if the input file doesn't exist
    # system bin/"pprint", "-lcsh", bin/"pprint"
    system "false"
  end
end
