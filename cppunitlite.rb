# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Cppunitlite < Formula
  desc "C plus plus unit test framework"
  homepage "https://github.com/denleyhsiao/CppUnitLite/releases"
  url "https://github.com/denleyhsiao/CppUnitLite/archive/v0.1.tar.gz"
  sha256 "5f4fae633ad46314df62219622a25a77841396d6b37af760672b68c0335ad77a"
  depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # system "./configure", "--disable-debug",
    #                       "--disable-dependency-tracking",
    #                       "--disable-silent-rules",
    #                       "--prefix=#{prefix}"
    mkdir "build" do 
      system "cmake", "..", *std_cmake_args
      system "make", "install" # if this fails, try separate make/make install steps
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test CppUnitLite`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
