# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Dispatch < Formula
  desc "A CLI utility for deploying kOps Kubernetes in AWS"
  homepage "https://github.com/christianTragesser/dispatch"
  version "0.2.4"
  license "MIT"

  on_macos do
    url "https://github.com/christianTragesser/dispatch/releases/download/v0.2.4/dispatch_0.2.4_darwin_amd64.tar.gz"
    sha256 "baf234ec5402e7a272b49571062dc8c837bbe6b83eb80a504c2cd58ea8f05438"

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
      url "https://github.com/christianTragesser/dispatch/releases/download/v0.2.4/dispatch_0.2.4_linux_amd64.tar.gz"
      sha256 "156e3ef60bd8eed2a659e2d94a92c1741a468e7053cb18e90591b8a284df06be"

      def install
        bin.install "dispatch-linux-amd64"
      end
    end
  end

  def post_install
    system "rm -f /usr/local/bin/dispatch || true"
    system "ln -s #{bin}/dispatch-* /usr/local/bin/dispatch"
  end

  test do
    system "#{bin}/dispatch version"
  end
end
