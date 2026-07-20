class GitReconcile < Formula
  desc "Reconcile local Git branches with their upstream"
  homepage "https://github.com/matthewevans/git-reconcile"
  url "https://github.com/matthewevans/git-reconcile/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "25aa52da20afbabe5e84adce5b7c72569cdeaa77a931fb8d56683710ece7f89b"
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
