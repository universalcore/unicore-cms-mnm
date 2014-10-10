import os
from pyramid import testing

from unicorecmsffl import main
from cms.tests.utils import BaseTestCase, RepoHelper
from webtest import TestApp


class TestViews(BaseTestCase):

    def setUp(self):
        super(TestViews, self).setUp()
        self.repo = RepoHelper.create(
            os.path.join(os.getcwd(), '.test_repos', self.id()))
        settings = {
            'git.path': self.repo.path,
            'git.content_repo_url': '',
            'cache.enabled': 'false',
            'cache.regions': 'long_term, default_term',
            'cache.long_term.expire': '1',
            'cache.default_term.expire': '1',
            'pyramid.default_locale_name': 'eng_UK',
        }
        self.config = testing.setUp(settings=settings)
        self.app = TestApp(main({}, **settings))

    def tearDown(self):
        self.repo.destroy()
        testing.tearDown()

    def test_credits_page(self):
        resp = self.app.get('/credits/', status=200)
        self.assertTrue(
            '<div class="intro">Thanks to our partners</div>' in
            resp.body)
