# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class LibmadTen < Formula
  desc "MPEG audio decoder library (Tenacity fork)"
  homepage "https://codeberg.org/tenacityteam/libmad"
  url "https://codeberg.org/tenacityteam/libmad/archive/0.16.4.tar.gz"
  sha256 "f4eb229452252600ce48f3c2704c9e6d97b789f81e31c37b0c67dd66f445ea35"
  license "GPL-1.0-or-later"

  depends_on "cmake" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,  "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libmad-tenacity`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
