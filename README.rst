Installation of Unicore CMS
===========================

.. code-block:: bash

    $ git clone https://github.com/universalcore/unicore-cms-mnm
    $ cd unicore-cms-mnm
    $ virtualenv ve
    $ source ve/bin/activate
    (ve)$ pip install -e .

Running Unicore CMS for local development
-----------------------------------------

This is a Pyramid_ application, that uses Elasticsearch.

For OS X we recommend you install Elasticsearch with Brew_:

.. code-block:: bash

    $ brew install elasticsearch

And start Elasticsearch in a separate Terminal tab:

.. code-block:: bash

    $ elasticsearch

For Linux install it with your package manager (apt, rpm, yum etc...)
and make sure it's running as a service.

Then start the server:

.. code-block:: bash

    (ve)$ pserve development.ini --reload

And view it in your web browser on http://localhost:8000/. You'll notice
it is empty. This is because Elasticsearch hasn't been updated yet with
the data from the sample Git repository, this can be done using the
command line ``eg-tools`` utility:

.. code-block:: bash

    (ve)$ eg-tools resync -f mappings/category.mapping.json -c development.ini -m unicore.content.models.Category -r True -p repo
    Destroying index for master.
    Creating index for master.
    unicore.content.models.Category: 9 updated, 0 removed.
    (ve)$ eg-tools resync -f mappings/page.mapping.json -c development.ini -m unicore.content.models.Page -p repo
    unicore.content.models.Page: 6 updated, 0 removed.
    (ve)$ eg-tools resync -f mappings/localisation.mapping.json -c development.ini -m unicore.content.models.Localisation -p repo
    unicore.content.models.Localisation: 3 updated, 0 removed.

Now loading http://localhost:8000/ should show the running site with
the default content.


Running Unicore CMS tests
-------------------------

.. code-block:: bash

    (ve)$ pip install -r requirements-dev.txt
    (ve)$ py.test cms


.. _Pyramid: http://docs.pylonsproject.org/en/latest/docs/pyramid.html
.. _Brew: http://brew.sh
