class GitReconcile < Formula
  desc "Reconcile local Git branches with their upstream"
  homepage "https://github.com/matthewevans/git-reconcile"
  url "https://github.com/matthewevans/git-reconcile/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "824bc3f99a491047898642634e29bf4ada9a8d51ed97394b6caf139f1a45217e"
  license "MIT"

  depends_on "bash"
  depends_on "git"

  def install
    libexec.install "bin/git-reconcile"
    (bin/"git-reconcile").write_env_script(
      libexec/"git-reconcile",
      PATH: "#{Formula["bash"].opt_bin}:$PATH",
    )
  end

  test do
    assert_match "git-reconcile #{version}", shell_output("#{bin}/git-reconcile --version")
  end
end
