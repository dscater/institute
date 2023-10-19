@inject('configuracion', 'App\Models\Configuracion')
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $configuracion->first()->alias }}</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('css/portal.css') }}">
    <style>
    </style>
</head>

<body class="sidebar-mini layout-fixed control-sidebar-slide-open layout-navbar-fixed text-sm">
    <div id="app">
        <Portal ruta="{{ route('portal.inicio') }}" logo="{{ asset('imgs/' . $configuracion->first()->logo) }}"
            ruta_asset="{{ asset('') }}" configuracion="{{ $configuracion->first() }}">
        </Portal>
    </div>
    <script>
        var main_url = "{{ url('') }}";
        var app_base = "";
        // var app_base = "institute"; //habilitar esta linea si existe la carpeta public en el proyecto con el nombre del sistema
    </script>
    {{-- <script src="https://maps.googleapis.com/maps/api/js?key={{ config('app.google_map_api') }}"></script> --}}
    <script src="{{ asset('js/jquery.js') }}"></script>
    <script src="{{ asset('js/portal.js') }}"></script>
    <script src="{{ asset('js/app.js') }}"></script>
    <script>
        /*[ Back to top ]
                ===========================================================*/
        var windowH = $(window).height() / 2;

        $(window).on('scroll', function() {
            if ($(this).scrollTop() > windowH) {
                $("#myBtn").css('display', 'flex');
            } else {
                $("#myBtn").css('display', 'none');
            }
        });

        $('#myBtn').on("click", function() {
            $('html, body').animate({
                scrollTop: 0
            }, 300);
        });
    </script>
</body>

</html>
