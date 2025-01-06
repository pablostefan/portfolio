{{flutter_js}}
{{flutter_build_config}}


_flutter.loader.load({
    onEntrypointLoaded: async function (engineInitializer) {
        const appRunner = await engineInitializer.initializeEngine();
        await appRunner.runApp();
        try {
            console.log("Flutter carregado com sucesso.");
            const loader = document.getElementById('loader-content');
            loader.style.display = 'none';
        } catch (error) {
            console.error("Erro ao executar o app Flutter:", error);
        }
    }
});