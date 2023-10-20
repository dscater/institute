const mix = require("laravel-mix");

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */
mix.setPublicPath("./")
    .js("resources/js/app.js", "./js")
    .vue()
    .sass("resources/sass/app.scss", "./css")
    .styles(
        [
            "resources/assets/css/all.min.css",
            "resources/assets/css/icheck-bootstrap.css",
            "resources/assets/css/adminlte.css",
            "resources/assets/css/config.css",
        ],
        "./css/plantilla.css"
    )
    .styles(
        [
            "resources/assets/css/all.min.css",
            "resources/assets/css/portal/linearicons.css",
            "resources/assets/css/portal/magnific-popup.css",
            "resources/assets/css/portal/nice-select.css",
            "resources/assets/css/portal/animate.min.css",
            "resources/assets/css/portal/owl.carousel.css",
            "resources/assets/css/portal/jquery-ui.css",
            "resources/assets/css/portal/util.css",
            "resources/assets/css/portal/slick.css",
            "resources/assets/css/portal/main.css",
            "resources/assets/css/portal.css",
        ],
        "./css/portal.css"
    )
    .scripts(["resources/assets/js/jquery-3.2.1.min.js"], "./js/jquery.js")
    .scripts(
        ["resources/assets/js/adminlte.min.js", "resources/assets/js/demo.js"],
        "./js/plantilla.js"
    )
    .scripts(
        [
            "resources/assets/js/portal/slick.min.js",
            "resources/assets/js/portal/wow.min.js",
            "resources/assets/js/portal/easing.min.js",
            "resources/assets/js/portal/hoverIntent.js",
            "resources/assets/js/portal/superfish.min.js",
            "resources/assets/js/portal/jquery.magnific-popup.min.js",
            "resources/assets/js/portal/jquery.tabs.min.js",
            "resources/assets/js/portal/jquery.nice-select.min.js",
            "resources/assets/js/portal/owl.carousel.min.js",
        ],
        "./js/portal.js"
    )
    .copy("resources/assets/imgs", "./imgs")
    .copy("resources/assets/webfonts", "./webfonts")
    .copy("resources/assets/fonts", "./fonts");
