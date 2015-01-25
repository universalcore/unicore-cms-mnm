from pyramid.config import Configurator


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    config = Configurator(settings=settings)
    config.add_translation_dirs('unicorecmsmnm:locale')
    config.include('cms')
    config.configure_celery(global_config['__file__'])
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.scan()

    config.override_asset('cms:templates/', 'unicorecmsmnm:templates/')
    return config.make_wsgi_app()
