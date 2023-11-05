<?php

use App\Http\Controllers\AsignacionGrupoController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\ConfiguracionGestoriaController;
use App\Http\Controllers\ContactoController;
use App\Http\Controllers\CursoController;
use App\Http\Controllers\GestoriaBannerController;
use App\Http\Controllers\GestoriaNosotrosController;
use App\Http\Controllers\GestoriaServicioController;
use App\Http\Controllers\GestoriaSolicitudController;
use App\Http\Controllers\GestoriaTipController;
use App\Http\Controllers\GrupoController;
use App\Http\Controllers\HorarioController;
use App\Http\Controllers\InscripcionController;
use App\Http\Controllers\InscripcionSolicitudController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\PlanPagoController;
use App\Http\Controllers\PortalComunicadoController;
use App\Http\Controllers\PortalGestoriaController;
use App\Http\Controllers\ProfesorController;
use App\Http\Controllers\RedSocialController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;


// PORTAL
Route::get('/url_asset', [ConfiguracionController::class, 'url_asset'])->name("url_asset");
Route::get('/getLogo', [ConfiguracionController::class, 'getLogo'])->name("getLogo");

// LOGIN
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);

// CONFIGURACIÓN
Route::get('/configuracion/getConfiguracion', [ConfiguracionController::class, 'getConfiguracion']);

// ACCIONES PORTAL
// sliders
Route::get('portal/getSliders', [BannerController::class, 'index']);
// contacto
Route::get('portal/getContacto', [ContactoController::class, 'index']);
// redes sociales
Route::get('portal/getRedSocial', [RedSocialController::class, 'index']);
// comunicado
Route::get('portal/getPortalComunciado', [PortalComunicadoController::class, 'index']);
// portal-gestoria
Route::get('portal/getPortalGestoria', [PortalGestoriaController::class, 'index']);
// configuracion-gestoria
Route::get('portal/getConfiguracionGestoria', [ConfiguracionGestoriaController::class, 'index']);
// nosotros-gestoria
Route::get('portal/getNosotrosGestoria', [GestoriaNosotrosController::class, 'index']);
// servicios-gestoria
Route::get('portal/getServiciosGestoria', [GestoriaServicioController::class, 'index']);
// sliders-gestoria
Route::get('portal/getGestoriaSliders', [GestoriaBannerController::class, 'index']);
// configuracion-gestoria
Route::get('portal/getConfiguracionGestoria', [ConfiguracionGestoriaController::class, 'index']);
// cursos
Route::get('portal/getCursosDestacados', [CursoController::class, 'getCursosDestacados']);
Route::get('portal/getCurso/{curso}', [CursoController::class, 'show']);
Route::get('portal/getCursos', [CursoController::class, 'listaCursos']);
Route::get('portal/getIndexCursos', [CursoController::class, 'index']);
// inscripcion
Route::post('/portal/registrar_inscripcion', [InscripcionController::class, 'registrar_inscripcion']);
// plan_pagos
Route::get('/portal/get_plan_pagos', [PlanPagoController::class, 'index']);
// gestoria_solicituds
Route::post('/portal/registrar_solicitud', [GestoriaSolicitudController::class, 'registrar_solicitud']);
// gestoria_tips
Route::get('portal/getGestoriaTips', [GestoriaTipController::class, 'index']);

Route::middleware(['auth'])->group(function () {
    Route::post('/configuracion/update', [ConfiguracionController::class, 'update']);

    Route::prefix('admin')->group(function () {
        // Usuarios
        Route::post('usuarios/imprimirCredencial/{usuario}', [UserController::class, 'imprimirCredencial']);
        Route::get('usuarios/getUsuarioTipo', [UserController::class, 'getUsuarioTipo']);
        Route::get('usuarios/getUsuario/{usuario}', [UserController::class, 'getUsuario']);
        Route::patch('usuarios/asignarConfiguracion/{usuario}', [UserController::class, 'asignarConfiguracion']);
        Route::get('usuarios/userActual', [UserController::class, 'userActual']);
        Route::get('usuarios/getInfoBox', [UserController::class, 'getInfoBox']);
        Route::get('usuarios/getPermisos/{usuario}', [UserController::class, 'getPermisos']);
        Route::get('usuarios/getEncargadosRepresentantes', [UserController::class, 'getEncargadosRepresentantes']);
        Route::post('usuarios/actualizaContrasenia/{usuario}', [UserController::class, 'actualizaContrasenia']);
        Route::post('usuarios/actualizaFoto/{usuario}', [UserController::class, 'actualizaFoto']);
        Route::resource('usuarios', UserController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // BANNERS
        Route::get('banners/get_banner/ultimo', [BannerController::class, 'bannerPrincipal']);
        Route::resource('banners', BannerController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // CONTACTOS
        Route::resource('contactos', ContactoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // REDES SOCIALES
        Route::resource('red_socials', RedSocialController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // PLAN PAGOS
        Route::resource('plan_pagos', PlanPagoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // PORTAL-GESTORIAS
        Route::resource('portal_gestorias', PortalGestoriaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // PORTAL-COMUNICADO
        Route::resource('portal_comunicados', PortalComunicadoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // GESTORIA-BANNERS
        Route::get('gestoria_banners/get_banner/ultimo', [GestoriaBannerController::class, 'bannerPrincipal']);
        Route::resource('gestoria_banners', GestoriaBannerController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // GESTORIA-TIPOS
        Route::get('gestoria_tips/get_tip/ultimo', [GestoriaTipController::class, 'tipPrincipal']);
        Route::resource('gestoria_tips', GestoriaTipController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // GESTORIA-NOSOTROS
        Route::resource('gestoria_nosotros', GestoriaNosotrosController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // GESTORIA-SERVICIOS
        Route::resource('gestoria_servicios', GestoriaServicioController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // GESTORIA-CONFIGURACION
        Route::resource('configuracion_gestorias', ConfiguracionGestoriaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // CURSOS
        Route::resource('cursos', CursoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // GRUPOS
        Route::get("grupos/activos", [GrupoController::class, 'activos']);
        Route::resource('grupos', GrupoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // INSCRIPCIONES
        Route::get("inscripcion_solicituds/aceptados_sin_asignar", [InscripcionSolicitudController::class, 'aceptados_sin_asignar']);
        Route::get("inscripcion_solicituds/{inscripcion_solicitud}", [InscripcionSolicitudController::class, 'show']);
        Route::put("inscripcion_solicituds/{inscripcion_solicitud}", [InscripcionSolicitudController::class, 'update']);
        Route::resource('inscripcions', InscripcionController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // ASIGNACION GRUPOS
        Route::resource('asignacion_grupos', AsignacionGrupoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // PROFESORES
        Route::resource('profesors', ProfesorController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // HORARIOS
        Route::resource('horarios', HorarioController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);
    });
});




// ADMINISTRACIÓN
Route::get('/administracion/{optional?}', function () {
    return view('app');
})->name('base_path')->where('optional', '.*');


// PORTAL
Route::get('/{optional?}', function () {
    return view('portal');
})->name('portal.inicio')->where('optional', '.*');
