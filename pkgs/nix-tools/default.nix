{
  python3Packages,
  setuptools,

}:
{
  windows-rebuild = python3Packages.buildPythonApplication rec {
    pname = "windows-rebuild";
    src = ./windows-rebuild;
  };
}
