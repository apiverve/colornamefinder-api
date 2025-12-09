from setuptools import setup, find_packages

setup(
    name='apiverve_colornamefinder',
    version='1.1.12',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Color Name Finder is a tool for finding the closest named color from a hex color value. It uses color distance algorithms to match hex codes to CSS/HTML named colors and provides similarity scores for accurate color identification.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
