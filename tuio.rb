require "formula"

# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Tuio < Formula
  homepage "https://github.com/kaust-vislab/TUIO.git"
  # url "https://github.com/kaust-vislab/TUIO.git", :using => git, :tag => "v1.4.1"
  url "https://github.com/kaust-vislab/TUIO/archive/v1.4.1.tar.gz"
  sha1 "c6e3ea706e1e7e80758c40fbf0e916e43c4397c9"

  head "https://github.com/kaust-vislab/TUIO.git", :branch => "master"


  depends_on "cmake" => :build

  def install
    args = std_cmake_args

    if MacOS.prefer_64_bit?
      args << "-DCMAKE_OSX_ARCHITECTURES=x86_64"
    else
      args << "-DCMAKE_OSX_ARCHITECTURES=i386"
    end
    args << "-DCMAKE_BUILD_TYPE=Release"
    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
