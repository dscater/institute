<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Estudiantes por Grupos</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 0.3cm;
            margin-left: 0.3cm;
            margin-right: 0.3cm;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 0px;
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

        .nom_grupo {
            width: 100%;
            text-align: center;
            margin-bottom: 4px;
        }
    </style>
</head>

<body>
    @inject('configuracion', 'App\Models\Configuracion')
    <div class="encabezado">
        <div class="logo">
            <img src="{{ asset('imgs/' . $configuracion->first()->logo) }}">
        </div>
        <h2 class="titulo">
            {{ $configuracion->first()->nombre_sistema }}
        </h2>
        <h4 class="texto">LISTA DE ESTUDIANTES POR GRUPOS</h4>
        <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
    </div>
    @foreach ($grupos as $grupo)
        <h4 class="nom_grupo">{{ $grupo->nombre }}</h4>
        <table border="1">
            <thead class="bg-principal">
                <tr>
                    <th width="3%">N°</th>
                    <th>NOMBRE COMPLETO</th>
                    <th>NRO. IDENTIFICACIÓN</th>
                    <th>FECHA DE NACIMIENTO</th>
                    <th>EDAD</th>
                    <th>PAÍS DE RESIDENCIA</th>
                    <th>NACIONALIDAD</th>
                    <th>PROVINCIA/DEPARTAMENTO</th>
                    <th>SEXO</th>
                    <th>TELÉFONO/CELULAR</th>
                    <th>EMAIL</th>
                    <th>CURSO</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $cont = 1;
                @endphp
                @foreach ($grupo->asignacion_grupos as $value)
                    <tr>
                        <td class="centreado">{{ $cont++ }}</td>
                        <td class="centreado">{{ $value->inscripcion->full_name }}</td>
                        <td class="centreado">{{ $value->inscripcion->nro_iden }}</td>
                        <td class="centreado">{{ $value->inscripcion->fecha_nac }}</td>
                        <td class="centreado">{{ $value->inscripcion->edad }}</td>
                        <td class="centreado">{{ $value->inscripcion->pais_residencia }}</td>
                        <td class="centreado">{{ $value->inscripcion->nacionalidad }}</td>
                        <td class="centreado">{{ $value->inscripcion->prov_dpto }}</td>
                        <td class="centreado">{{ $value->inscripcion->sexo }}</td>
                        <td class="centreado">{{ $value->inscripcion->fono }}</td>
                        <td class="centreado">{{ $value->inscripcion->correo }}</td>
                        <td class="centreado">{{ $value->curso->nombre }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    @endforeach
</body>

</html>
