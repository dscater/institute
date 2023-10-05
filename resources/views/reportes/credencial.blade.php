<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Credencial</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin: 0;
            padding: 0;
        }

        .contenedor_principal {
            display: block;
            height: 100%;
            width: 100%;
        }

        .contenedor_principal img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .info {
            font-size: 9.3pt;
            margin-bottom: 0px;
            overflow: hidden;
            white-space: nowrap;
            word-break: normal;
        }

        .info_1 {
            margin-top: 78px;
            margin-left: 240px;
            margin-bottom: 0px;
        }

        .info_2 {
            margin-left: 200px;
            margin-top: 11px;
        }

        .info_3 {
            margin-top: 11px;
            margin-left: 225px;
        }

        .info_4 {
            margin-left: 215px;
        }

        .bold {
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="contenedor_principal">
        <img src="{{ asset('imgs/fondo_credencial.png') }}" alt="Imagen">
        <p class="info info_1">{{ $usuario->full_name_abre }}</p>
        <p class="info info_2">{{ $usuario->full_ci }}</p>
        <p class="info info_3 bold">{{ $usuario->cargo }}</p>
        <p class="info info_4">{{ $usuario->validez_credencial }}</p>
    </div>
</body>

</html>
