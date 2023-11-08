@if ($ep->tipo == 'LLENADO')
    <p class="text_examen">
        {{ $key_preg + 1 }}) {{ $ep->pregunta }}</p>
    <p class="llenado"></p>
@endif


@if (
    $ep->tipo == 'SELECCIÓN' ||
        $ep->tipo == 'LLENADO INTERMEDIO' ||
        $ep->tipo == 'LLENADO DOBLE INTERMEDIO CON OPCIONES' ||
        $ep->tipo == 'LLENADO INTERMEDIO CON OPCIONES' ||
        $ep->tipo == 'ELIGE UNA OPCIÓN')

    @php
        $text_pregunta = str_replace('_', '<span class="separacion"></span>', $ep->pregunta);
    @endphp

    @if ($ep->tipo == 'SELECCIÓN')
        <p class="text_examen">{{ $key_preg + 1 }}) {!! $text_pregunta !!}
            @foreach ($ep->array_opciones as $key_ao => $ao)
                <span>{{ $ao }} @if ($key_ao < count($ep->array_opciones) - 1)
                        <span>/</span>
                    @endif
                </span>
            @endforeach
        </p>
    @endif

    @if ($ep->tipo == 'LLENADO INTERMEDIO')
        <p class="text_examen">{{ $key_preg + 1 }}) {!! $text_pregunta !!}</p>
    @endif

    @if (
        $ep->tipo == 'LLENADO DOBLE INTERMEDIO CON OPCIONES' ||
            $ep->tipo == 'LLENADO INTERMEDIO CON OPCIONES' ||
            $ep->tipo == 'ELIGE UNA OPCIÓN')
        <p class="text_examen">{{ $key_preg + 1 }}) {!! $text_pregunta !!} </p>
        <ul class="lista_opciones">
            @foreach ($ep->array_opciones as $key_ao => $ao)
                <li>{{ $txt_opciones[$key_ao] }} {{ $ao }}</li>
            @endforeach
        </ul>
    @endif
@endif
