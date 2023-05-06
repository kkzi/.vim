import os
import subprocess


def __get_stl_dir():
    msvc_version = '14.29.30133'
    vswhere = 'C:/Program Files (x86)/Microsoft Visual Studio/Installer/vswhere.exe'
    cp = subprocess.run([vswhere, '-latest', '-property', 'installationPath'], capture_output=True)
    if cp.stderr:
        return ''
    return f'{cp.stdout.decode("utf-8").strip()}\\VC\Tools\MSVC\{msvc_version}\\include'


def __get_env(var):
    val = os.getenv(var)
    return str(val) if val else ''


def get_cpp_include_dirs():
    return [__get_stl_dir(), __get_env('BOOST-LATEST'), __get_env('SIMPLE_CPP')]

print(get_cpp_include_dirs())
