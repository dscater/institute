@inject('configuracion', 'App\Models\Configuracion')
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $configuracion->first()->alias }}</title>
    <style>
        #app {
            background-color: none;
            background-image: url("{{ url('') }}/imgs/login.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('css/plantilla.css') }}">
</head>

<body class="sidebar-mini layout-fixed control-sidebar-slide-open layout-navbar-fixed text-sm">
    <div id="app">
        @if (Auth::check())
            <App ruta="{{ route('base_path') }}" configuracion="{{ $configuracion->first() }}"
                user="{{ Auth::user() }}"></App>
        @else
            <Auth ruta="{{ route('base_path') }}" logo="{{ asset('imgs/' . $configuracion->first()->logo) }}"
                empresa="{{ $configuracion->first()->razon_social }}" configuracion="{{ $configuracion->first() }}"
                url_portal="{{ route('portal.inicio') }}">
            </Auth>
        @endif
    </div>
    <script>
        var main_url = "{{ url('') }}";
        var app_base = "";
        // var app_base = "qhana"; //habilitar esta linea si existe la carpeta public en el proyecto con el nombre del sistema
    </script>
    {{-- <script src="https://maps.googleapis.com/maps/api/js?key={{ config('app.google_map_api') }}"></script> --}}
    <script src="{{ asset('js/jquery.js') }}"></script>
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('js/plantilla.js') }}"></script>
    <script>
        $(document).ready(function() {
            $(document).on("click", "aside nav ul li a", function() {
                let existe_submenu = $(this).siblings("ul.nav-treeview");
                if ($("body").hasClass("sidebar-open") && !$(this).parent().hasClass("menu") &&
                    existe_submenu.length == 0) {
                    $("body").addClass("sidebar-collapse");
                    $("body").addClass("sidebar-close");
                    $("body").removeClass("sidebar-open");
                }
            });
        });

        const textareas = document.querySelectorAll('textarea.form-control');

        function ajustarTamaño(textarea) {
            textarea.style.height = 'auto'; // Restablece la altura a automático
            textarea.style.height = textarea.scrollHeight + 'px'; // Establece la altura al valor de desplazamiento
        }

        // Función para reemplazar las etiquetas <br> o <br /> por saltos de línea (\n)
        function reemplazarSaltosDeLinea(textarea) {
            textarea.value = textarea.value
                .replace(/<br\s*\/?>/g, '\n')
                .replace(/\n\n+/g, '\n'); // Elimina saltos de línea adicionales
        }
        // Recorre la lista de <textarea> y agrega eventos de cambio en el contenido y en el enfoque
        textareas.forEach((textarea) => {
            textarea.addEventListener('input', () => {
                ajustarTamaño(textarea);
            });

            textarea.addEventListener('focus', () => {
                reemplazarSaltosDeLinea(textarea);
            });

            // Ajusta el tamaño inicialmente (cuando la página se carga) y reemplaza saltos de línea
            ajustarTamaño(textarea);
            reemplazarSaltosDeLinea(textarea);
        });
    </script>
</body>

</html>
