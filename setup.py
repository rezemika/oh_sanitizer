from setuptools import setup, find_packages
import os

import oh_sanitizer

BASE_DIR = os.path.dirname(os.path.realpath(__file__))

setup(
    name=oh_sanitizer.__appname__,
    version=oh_sanitizer.__version__,
    packages=find_packages(),
    author="rezemika",
    author_email="reze.mika@gmail.com",
    description="A corrector for the 'opening_hours' fields from OpenStreetMap.",
    long_description=open(BASE_DIR + "/README.md", 'r').read(),
    install_requires=["lark-parser"],
    include_package_data=True,
    url='http://github.com/rezemika/oh_sanitizer',
    keywords="openstreetmap opening_hours",
    classifiers=[
        "Programming Language :: Python",
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: GNU Affero General Public License v3",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 2",
        "Programming Language :: Python :: 3",
        "Topic :: Utilities",
        "Topic :: Other/Nonlisted Topic",
    ]
)
