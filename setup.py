from setuptools import setup, find_packages

requires = [
    'pyramid',
    'unicore-cms',
]

setup(name='unicore-cms-ffl',
      version='0.1',
      description='JSON based CMS for Universal Core',
      long_description='JSON based CMS for Universal Core',
      classifiers=[
      "Programming Language :: Python",
      "Framework :: Pyramid",
      "Topic :: Internet :: WWW/HTTP",
      "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
      ],
      author='Praekelt Foundation',
      author_email='dev@praekelt.com',
      url='http://github.com/praekelt/unicore-cms-ffl',
      license='BSD',
      keywords='web pyramid pylons',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      install_requires=requires,
      tests_require=requires,
      test_suite="unicorecmsffl",
      entry_points="""\
      [paste.app_factory]
      main = unicorecmsffl:main
      """,
      )
