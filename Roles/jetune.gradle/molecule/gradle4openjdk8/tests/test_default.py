import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_gradle_installed(host):

    # gradle expected version major
    gradle_major = '4'

    # gradle expected version minor
    gradle_minor = '10.3'

    # gradle expected version
    expected_gradle_version = gradle_major + '.' + gradle_minor

    # gradle Home Path
    expected_gradle_home_path = '/opt/gradle/gradle-{}'\
                                .format(expected_gradle_version)

    # gradle archive file
    expected_gradle_archive_path = '/tmp/gradle-{}.zip'\
                                   .format(expected_gradle_version)

    # Check gradle Home Path exists
    assert host.file(expected_gradle_home_path).exists
    assert host.file(expected_gradle_home_path).is_directory

    # gradle Downloaded file
    gradle_archive = host.file(expected_gradle_archive_path)

    # Check that gradle Archive exists
    assert gradle_archive.exists
    assert gradle_archive.is_file

    # Run gradle home
    gradle_home = host.run('. {} && echo $GRADLE_HOME'
                           .format('/etc/profile.d/gradle_home.sh'))\
                      .stdout.split('\n')[0]

    # Get GRADLE_HOME
    assert gradle_home == expected_gradle_home_path
