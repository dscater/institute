<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>HistorialEstudiante</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        @page {
            margin-top: 1.5cm;
            margin-bottom: 1.5cm;
            margin-left: 1.5cm;
            margin-right: 1.5cm;
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

        .bold {
            font-weight: bold;
        }

        .img_celda img {
            width: 45px;
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
        <h4 class="texto">HISTORIAL DE ESTUDIANTE</h4>
        <h4 class="fecha">Expedido: {{ date('d-m-Y') }}</h4>
    </div>
    <table>
        <tbody>
            <tr>
                <td class="bold" width="14%">Nombre Completo: </td>
                <td>{{ $inscripcion->full_name }}</td>
                <td class="bold" width="14%">Nro. Identificación: </td>
                <td>{{ $inscripcion->nro_iden }}</td>
            </tr>
            <tr>
                <td class="bold">Email: </td>
                <td>{{ $inscripcion->correo }}</td>
                <td class="bold">Edad: </td>
                <td>{{ $inscripcion->edad }} años</td>
            </tr>
            <tr>
                <td class="bold">País residencia: </td>
                <td>{{ $inscripcion->pais_residencia }}</td>
                <td class="bold">Teléfono: </td>
                <td>{{ $inscripcion->fono }}</td>
            </tr>
        </tbody>
    </table>
    <h4 class="centreado" style="margin-bottom:2px;">LISTA DE SOLICITUDES</h4>
    <table border="1" style="margin-top: 2px;">
        <thead class="bg-principal">
            <tr>
                <th width="4%">N°</th>
                <th width="7%">CÓDIGO</th>
                <th>CURSO</th>
                <th>NIVEL</th>
                <th>PLAN DE PAGO</th>
                <th>FORMA DE PAGO</th>
                <th>FECHA DE INSCRIPCIÓN</th>
                <th>ESTADO</th>
            </tr>
        </thead>
        <tbody>
            @php
                $cont = 1;
            @endphp
            @foreach ($inscripcion_solicituds as $value)
                <tr>
                    <td>{{ $cont++ }}</td>
                    <td>{{ $value->codigo }}</td>
                    <td>{{ $value->curso->nombre }}</td>
                    <td>{{ $value->nivel }}</td>
                    <td>{{ mb_strtoupper($value->plan_pago->titulo) }}</td>
                    <td>{{ $value->forma_pago }}</td>
                    <td class="centreado">{{ date('d/m/Y', strtotime($value->created_at)) }}</td>
                    <td class="centreado">{{ $value->estado }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>
