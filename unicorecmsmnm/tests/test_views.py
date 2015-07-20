from datetime import datetime
from pyramid import testing

from cms.tests.base import UnicoreTestCase
from unicorecmsmnm import main
from unicore.content.models import Page, Localisation, Category


class TestViews(UnicoreTestCase):

    def setUp(self):
        self.workspace = self.mk_workspace()
        self.workspace.setup_custom_mapping(Page, {
            'properties': {
                'slug': {
                    'type': 'string',
                    'index': 'not_analyzed',
                },
                'language': {
                    'type': 'string',
                    'index': 'not_analyzed',
                }
            }
        })
        self.workspace.setup_custom_mapping(Category, {
            'properties': {
                'slug': {
                    'type': 'string',
                    'index': 'not_analyzed',
                },
                'language': {
                    'type': 'string',
                    'index': 'not_analyzed',
                },
                'position': {
                    'type': 'long'
                }
            }
        })

        self.workspace.setup_custom_mapping(Localisation, {
            'properties': {
                'locale': {
                    'type': 'string',
                    'index': 'not_analyzed',
                }
            }
        })

        settings = {
            'git.path': self.workspace.working_dir,
            'git.content_repo_url': '',
            'es.index_prefix': self.workspace.index_prefix,
            'cache.enabled': 'false',
            'cache.regions': 'long_term, default_term',
            'cache.long_term.expire': '1',
            'cache.default_term.expire': '1',
            'pyramid.default_locale_name': 'eng_GB',
            'thumbor.security_key': 'sample-security-key',
        }
        self.config = testing.setUp(settings=settings)
        self.app = self.mk_app(self.workspace, settings=settings, main=main)

    def test_homepage_page(self):
        self.create_categories(self.workspace, count=1)
        self.create_localisation(
            self.workspace, 'eng_GB', image='some-uuid',
            image_host='http://some.site.com',
        )

        intro_page = Page({
            'title': 'Homepage Intro Title', 'language': 'eng_GB',
            'description': 'this is the description text',
            'slug': 'homepage-intro', 'content': 'this is the body of work',
            'position': 0, 'modified_at': datetime.utcnow().isoformat()})
        self.workspace.save(intro_page, 'save intro')
        self.workspace.refresh_index()

        resp = self.app.get('/', status=200)

        self.assertTrue(
            '<img alt="Malaria no More" '
            'src="http://some.site.com/VNlJN07VKnfaB6k1imziAts4n0o='
            '/320x0/some-uuid"/>' in
            resp.body)

    def test_views_no_primary_category(self):
        [page] = self.create_pages(
            self.workspace,
            count=1,
            featured=True,
            description='',
            created_at='2015-01-01T00:00:00')

        # checks that relevant views don't generate exceptions
        self.app.get('/')
        self.app.get('/spice/')
        self.app.get('/content/detail/%s/' % page.uuid)
        self.app.get('/spice/content/detail/%s/' % page.uuid)
        self.app.get('/content/comments/%s/' % page.uuid)
