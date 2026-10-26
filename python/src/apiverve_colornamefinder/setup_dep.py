from setuptools import setup, find_packages

setup(
    name='apiverve_colornamefinder',
    version='1.2.3',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Color Name Finder matches any hex color code to its closest named CSS color. Send a hex value to get the matching color name, RGB coordinates, and an exact match flag.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/colornamefinder?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
