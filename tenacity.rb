# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tenacity < Formula
  desc "Multi-track audio editor/recorder"
  homepage "https://tenacityaudio.org/"
  url "https://codeberg.org/tenacityteam/tenacity/archive/v1.3.4.tar.gz"
  sha256 "75329d2ecdee1a48c1a13f2727bc10b6fd2fe1057d5a4f80f989b67e33240f86"
  license "GPL-2.0-or-later"

  depends_on "cmake" => :build
  depends_on "lilv"
  depends_on "libid3tag"
  depends_on "libmad-ten"
  depends_on "twolame"
  depends_on "libsoxr"
  depends_on "sound-touch"
  depends_on "libsbsms"
  depends_on "portaudio"
  depends_on "portmidi"
  depends_on "portsmf"
  depends_on "lame"
  depends_on "zlib"
  depends_on "vamp-plugin-sdk"
  depends_on "expat"
  depends_on "sqlite3"
  depends_on "mkvtoolnix"
  depends_on "wxwidgets"
  

  # Additional dependency
  resource "libnyquist" do
    url "https://codeberg.org/tenacityteam/libnyquist.tgz",
        revision: "main"
#        revision: "951b636f7d0cba370d483a91f1897c71f3d98530"
#    sha256 ""
  end

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DVCPKG=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test tenacity`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
