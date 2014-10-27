from pyramid.view import view_config
from cms.views.cms_views import CmsViews


class FflCmsViews(CmsViews):

    @view_config(
        route_name='credits', renderer='unicorecmsffl:templates/credits.pt')
    def credits(self):
        return {}
