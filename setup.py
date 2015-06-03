from distutils.core import setup


setup(
    name='PyHCUP',
    version='0.1.6.3.8',
    description='Python tools for working with data from the Healthcare Cost and Utilization Program (http://hcup-us.ahrq.gov).',
    long_description=open('README.rst').read(),
    classifiers=[
        'Development Status :: 3 - Alpha',
        'License :: OSI Approved :: MIT License',
        'Topic :: Scientific/Engineering',
    ],
    keywords='HCUP SAS healthcare analysis pandas',
    author='T.J. Biel',
    author_email='terry.biel@gmail.com',
    packages=['pyhcup'],
    license='MIT',
    provides=['pyhcup'],
    requires=['pandas (>=0.11.0)'],
    package_data={'pyhcup': [
                    'data/loadfiles/*/*.*',
                    'data/uflags/*.*',
                    'data/maps/*.*',
                    'data/summary_stats/*.*',
                    ]
                    },
)