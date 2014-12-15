require "formula"

# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Tuio < Formula
  homepage "https://github.com/vyslexia/TUIO.git"
  head "https://github.com/vyslexia/TUIO.git", :branch => "master"


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
