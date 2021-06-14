import pytest


@pytest.mark.parametrize("name", [
    ("teams")
])
def test_packages(host, name):
    pkg = host.package(name)
    assert pkg.is_installed
