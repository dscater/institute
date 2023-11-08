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
    @inject('o_configuracion', 'App\Models\Configuracion')
    <div id="app">
        <div class="login-page">
            <div class="login-box">
                <!-- /.login-logo -->
                <div class="card card-outline card-success">
                    <div class="card-header text-center">
                        <img src="{{ asset('imgs/' . $o_configuracion->first()->logo) }}" alt="Logo" />
                        <h4 class="text-white">Recuperar mi contraseña</h4>
                    </div>
                    <div class="card-body">
                        <p class="login-box-msg text-success font-weight-bold">
                            Ingresa tú nueva contraseña
                        </p>

                        <form action="{{ route('contrasena.actualiza_contrasena', $recuperacion->id) }}" method="post">
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            <input type="hidden" name="_method" value="put">
                            <div class="input-group mb-3">
                                <input type="password" name="password" class="form-control"
                                    value="{{ old('password') }}" placeholder="Nueva contraseña" autofocus required />
                                <div class="input-group-append">
                                    <div class="input-group-text bg-success">
                                        <span class="fas fa-key"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" name="password_confirmation" class="form-control"
                                    placeholder="Confirmar contraseña" required />
                                <div class="input-group-append">
                                    <div class="input-group-text bg-success">
                                        <span class="fas fa-key"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                @if ($errors->has('password'))
                                    <span class="invalid-feedback text-danger" style="display:block" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="row">
                                <!-- /.col -->
                                <div class="col-12">
                                    <button type="submit" class="btn btn-success btn-block btn-flat font-weight-bold">
                                        Enviar
                                    </button>
                                    <a href="/" class="btn btn-default btn-block btn-flat font-weight-bold">Volver
                                        al inicio</a>
                                </div>
                                <!-- /.col -->
                            </div>
                        </form>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
        </div>
    </div>
    <script>
        var main_url = "{{ url('') }}";
        var app_base = "";
        // var app_base = "qhana"; //habilitar esta linea si existe la carpeta public en el proyecto con el nombre del sistema
    </script>
    <script src="{{ asset('js/jquery.js') }}"></script>
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('js/plantilla.js') }}"></script>
    <script>
        @if (session('success'))
            Swal.fire({
                icon: "success",
                title: "Correcto",
                html: "{{ session('success') }}",
                showConfirmButton: true,
                confirmButtonColor: "#009688",
                confirmButtonText: "Aceptar",
            });
        @endif
        @if (session('error'))
            Swal.fire({
                icon: "error",
                title: "Error",
                html: "{{ session('error') }}",
                showConfirmButton: true,
                confirmButtonColor: "#009688",
                confirmButtonText: "Aceptar",
            });
        @endif
    </script>
</body>

</html>
