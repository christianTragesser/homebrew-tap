# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Dispatch < Formula
  desc "A CLI utility for deploying KOPS Kubernetes in AWS"
  homepage "https://github.com/christianTragesser/dispatch"
  version "0.1.1"
  license "MIT"

  on_macos do
    url "https://github.com/christianTragesser/dispatch/releases/download/v0.1.1/dispatch_0.1.1_darwin_amd64.tar.gz"
    sha256 "d053b04be975c38ec602e21278ea4cee112c6e4667c1203104a223ce2dcbce93"

    def install
      bin.install "dispatch-darwin-amd64"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the Dispatch
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/christianTragesser/dispatch/releases/download/v0.1.1/dispatch_0.1.1_linux_amd64.tar.gz"
      sha256 "a43b2c8c6d6b165e687085589f5458019d9d5b941a31ff6cf86b9f9937dfd916"

      def install
        bin.install "dispatch-linux-amd64"
      end
    end
  end

  test do
    system "#{bin}/dispatch version"
  end
end
