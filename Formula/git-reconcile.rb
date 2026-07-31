class GitReconcile < Formula
  desc "Reconcile local Git branches with their upstream"
  homepage "https://github.com/matthewevans/git-reconcile"
  url "https://github.com/matthewevans/git-reconcile/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "bd3b3226509a6798d0af2f5f74e57509b1176d20c08481b3cc6031287126d9ed"
  license "MIT"

  depends_on "bash"
  depends_on "git"

  def install
    libexec.install "bin/git-reconcile"
    (bin/"git-reconcile").write_env_script(
      libexec/"git-reconcile",
      PATH: "#{formula_opt_bin("bash")}:$PATH",
    )
  end

  test do
    assert_match "git-reconcile #{version}", shell_output("#{bin}/git-reconcile --version")
    output = shell_output("#{bin}/git-reconcile not-a-ref 2>&1", 2)
    assert_match "'not-a-ref' is not a valid commit or ref.", output
  end
end
