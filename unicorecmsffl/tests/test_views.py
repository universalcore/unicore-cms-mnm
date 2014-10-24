from pyramid import testing

from unicorecmsffl import main
from cms.tests.base import UnicoreTestCase
from webtest import TestApp


class TestViews(UnicoreTestCase):

    def setUp(self):
        self.workspace = self.mk_workspace()
        settings = {
            'git.path': self.workspace.working_dir,
            'git.content_repo_url': '',
            'es.index_prefix': self.workspace.index_prefix,
            'cache.enabled': 'false',
            'cache.regions': 'long_term, default_term',
            'cache.long_term.expire': '1',
            'cache.default_term.expire': '1',
            'pyramid.default_locale_name': 'eng_UK',
        }
        self.config = testing.setUp(settings=settings)
        self.app = TestApp(main({}, **settings))

    def test_credits_page(self):
        resp = self.app.get('/credits/', status=200)
        self.assertTrue(
            '<div class="intro">Thanks to our partners</div>' in
            resp.body)
