{
    {
        flutter_js
    }
}
{
    {
        flutter_build_config
    }
}


_flutter.loader.load({
    onEntrypointLoaded: function (engineInitializer) {
        engineInitializer.initializeEngine().then(function (appRunner) {
            // Oculta o loader após o app Flutter ser carregado
            document.getElementById('loader-content').style.display = 'none';
            appRunner.runApp();
        });
    }
});