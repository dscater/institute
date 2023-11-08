<div class="row">
    <div class="col-md-12">
        <table class="table table-bordered">
            <thead class="bg-principal2">
                <tr>
                    <th class="text-white text-center">
                        HORARIO
                    </th>
                    <th class="text-white text-center">
                        LUNES
                    </th>
                    <th class="text-white text-center">
                        MARTES
                    </th>
                    <th class="text-white text-center">
                        MIERCOLES
                    </th>
                    <th class="text-white text-center">
                        JUEVES
                    </th>
                    <th class="text-white text-center">
                        VIERNES
                    </th>
                    <th class="text-white text-center">
                        SÁBADO
                    </th>
                    <th class="text-white text-center">
                        DOMINGO
                    </th>
                </tr>
            </thead>
            <tbody class="bg-secundario2">
                @foreach ($array_horas as $ah)
                    <tr>
                        <td class="text-white text-center">{{ $ah }}</td>
                        <td class="text-white text-center">
                            @foreach ($tabla_horarios[$ah][1] as $item_curso)
                                {{ $item_curso->nombre }}<br>
                            @endforeach
                        </td>
                        <td class="text-white text-center">
                            @foreach ($tabla_horarios[$ah][2] as $item_curso)
                                {{ $item_curso->nombre }}<br>
                            @endforeach
                        </td>
                        <td class="text-white text-center">
                            @foreach ($tabla_horarios[$ah][3] as $item_curso)
                                {{ $item_curso->nombre }}<br>
                            @endforeach
                        </td>
                        <td class="text-white text-center">
                            @foreach ($tabla_horarios[$ah][4] as $item_curso)
                                {{ $item_curso->nombre }}<br>
                            @endforeach
                        </td>
                        <td class="text-white text-center">
                            @foreach ($tabla_horarios[$ah][5] as $item_curso)
                                {{ $item_curso->nombre }}<br>
                            @endforeach
                        </td>
                        <td class="text-white text-center">
                            @foreach ($tabla_horarios[$ah][6] as $item_curso)
                                {{ $item_curso->nombre }}<br>
                            @endforeach
                        </td>
                        <td class="text-white text-center">
                            @foreach ($tabla_horarios[$ah][0] as $item_curso)
                                {{ $item_curso->nombre }}<br>
                            @endforeach
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="col-md-6">
        <table class="table table-bordered">
            <thead class="bg-principal2">
                <tr>
                    <th class="text-white text-center">
                        FECHAS
                    </th>
                    <th class="text-white text-center">
                        CURSOS
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($array_fechas as $af)
                    <tr>
                        <td class="text-white text-center">{{ $af }}</td>
                        <td class="text-white text-center">
                            @if (count($tabla_fechas[$af]))
                                @foreach ($tabla_fechas[$af] as $key => $c)
                                    {{ $c->nombre }}
                                    @if ($key < count($tabla_fechas[$af]) - 1)
                                        <span>,</span>
                                    @endif
                                @endforeach
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
