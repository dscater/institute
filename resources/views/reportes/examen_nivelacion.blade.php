<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Examen de nivelación</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 0.3cm;
            margin-left: 0.5cm;
            margin-right: 0.5cm;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            page-break-before: avoid;
        }

        table thead tr th,
        tbody tr td {
            padding: 3px;
            word-wrap: break-word;
        }

        table thead tr th {
            font-size: 7pt;
        }

        table tbody tr td {
            font-size: 6pt;
        }


        .encabezado {
            width: 100%;
        }

        .logo img {
            position: absolute;
            width: 200px;
            height: 90px;
            top: -20px;
            left: 0px;
        }

        h2.titulo {
            width: 450px;
            margin: auto;
            margin-top: 0PX;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14pt;
        }

        .texto {
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .fecha {
            width: 250px;
            text-align: center;
            margin: auto;
            margin-top: 15px;
            font-weight: normal;
            font-size: 0.85em;
        }

        .total {
            text-align: right;
            padding-right: 15px;
            font-weight: bold;
        }

        table {
            width: 100%;
        }

        table thead {
            background: rgb(236, 236, 236)
        }

        tr {
            page-break-inside: avoid !important;
        }

        .centreado {
            padding-left: 0px;
            text-align: center;
        }

        .datos {
            margin-left: 15px;
            border-top: solid 1px;
            border-collapse: collapse;
            width: 250px;
        }

        .txt {
            font-weight: bold;
            text-align: right;
            padding-right: 5px;
        }

        .txt_center {
            font-weight: bold;
            text-align: center;
        }

        .cumplimiento {
            position: absolute;
            width: 150px;
            right: 0px;
            top: 86px;
        }

        .b_top {
            border-top: solid 1px black;
        }

        .gray {
            background: rgb(202, 202, 202);
        }

        .bg-principal {
            background: #03a898;
            color: white;
        }

        .txt_rojo {}

        .img_celda img {
            width: 45px;
        }

        .titulo_centreado {
            width: 100%;
            text-align: center;
        }

        .break_page {
            page-break-after: always;
        }

        .enunciado {
            margin-bottom: 3px;
        }

        .text_examen {
            font-size: 0.9em;
        }

        .contenedor_preguntas {
            width: 100%;
            padding-left: 20px;
        }

        .llenado {
            width: 70%;
            height: 10px;
            border-bottom: solid 1px black;
        }

        .separacion {
            display: inline-block;
            width: 70px;
            border-bottom: solid 1px black;
        }

        .lista_opciones {
            list-style: none;
        }

        .lista_opciones li {
            font-size: 0.85em;
        }
    </style>
</head>

<body>´
    @php
        $txt_opciones = ['A)', 'B)', 'C)', 'D)', 'E)', 'F)', 'G)'];
    @endphp
    @inject('configuracion', 'App\Models\Configuracion')
    @foreach ($cursos as $key_curso => $curso)
        @if (count($curso->examen_nivelacions))
            @foreach ($curso->examen_nivelacions as $key_ee => $en)
                <div class="encabezado">
                    <div class="logo">
                        <img src="{{ asset('imgs/' . $configuracion->first()->logo) }}">
                    </div>
                    <h2 class="titulo">
                        {{ $configuracion->first()->nombre_sistema }}
                    </h2>
                    <h4 class="texto">EXAMEN DE NIVELACIÓN</h4>
                    <h4 class="texto">{{ $curso->nombre }}</h4>
                    <h4 class="texto">Código examen: {{ $en->id }}</h4>
                </div>
                <div class="contenedor_examen">
                    @foreach ($en->examen_enunciados as $key => $ee)
                        <p class="text_examen enunciado">{{ $key + 1 }}) {{ $ee->enunciado }}</p>
                        <div class="contenedor_preguntas">
                            @foreach ($ee->enunciado_preguntas as $key_preg => $ep)
                                @include('reportes.parcial.preguntas')
                            @endforeach
                        </div>
                    @endforeach
                </div>
                @if ($key_ee < count($curso->examen_nivelacions) - 1)
                    <div class="break_page"></div>
                @endif
            @endforeach
            @if ($key_curso < count($cursos) - 1)
                <div class="break_page"></div>
            @endif
        @else
            <div class="encabezado">
                <div class="logo">
                    <img src="{{ asset('imgs/' . $configuracion->first()->logo) }}">
                </div>
                <h2 class="titulo">
                    {{ $configuracion->first()->nombre_sistema }}
                </h2>
                <h4 class="texto">EXAMEN DE NIVELACIÓN</h4>
                <h4 class="texto">{{ $curso->nombre }}</h4>
            </div>
            <h4 class="titulo_centreado">NO SE AGREGÓ NINGUN EXAMEN</h4>
            <div class="break_page"></div>
        @endif
    @endforeach
</body>

</html>
