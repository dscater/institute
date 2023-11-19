import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
    base: "/" + app_base,
    routes: [
        /* ************************* *
         *       PORTAL
         * ************************* */
        // INICIO
        {
            path: "/",
            name: "portal.inicio",
            component: require("./portal/Inicio.vue").default,
        },

        // CURSOS
        {
            path: "/cursos",
            name: "portal.cursos",
            component: require("./portal/Cursos.vue").default,
        },

        // CURSO
        {
            path: "/cursos/:id",
            name: "portal.curso",
            component: require("./portal/Curso.vue").default,
            props: true,
        },

        // INSCRIPCIONES
        {
            path: "/inscripciones",
            name: "portal.inscripciones",
            component: require("./portal/Inscripciones.vue").default,
        },

        // HORARIOS
        {
            path: "/horarios",
            name: "portal.horarios",
            component: require("./portal/Horarios.vue").default,
        },

        // GESTORÍA
        {
            path: "/gestoria",
            name: "portal.gestoria",
            component: require("./portal/Gestoria.vue").default,
        },

        /* ************************* *
         *     ADMINISTRACIÓN
         * ************************* */

        // INICIO
        {
            path: "/administracion",
            name: "inicio",
            component: require("./components/Inicio.vue").default,
        },

        // LOGIN
        {
            path: "/administracion/login",
            name: "login",
            component: require("./Auth.vue").default,
        },

        // Usuarios
        {
            path: "/administracion/usuarios/perfil/:id",
            name: "usuarios.perfil",
            component: require("./components/modulos/usuarios/perfil.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/usuarios",
            name: "usuarios.index",
            component: require("./components/modulos/usuarios/index.vue")
                .default,
        },

        // Portal
        {
            path: "/administracion/portal",
            name: "admin_portal.index",
            component: require("./components/modulos/portal/index.vue").default,
            props: true,
        },

        // Portal - banners
        {
            path: "/administracion/portal/banners",
            name: "admin_portal.banners",
            component: require("./components/modulos/portal/Banners.vue")
                .default,
            props: true,
        },

        // Portal - PortalComunicado
        {
            path: "/administracion/portal/portal_comunicado",
            name: "admin_portal.portal_comunicado",
            component:
                require("./components/modulos/portal/PortalComunicado.vue")
                    .default,
            props: true,
        },

        // Portal - PortalGestoria
        {
            path: "/administracion/portal/portal_gestoria",
            name: "admin_portal.portal_gestoria",
            component: require("./components/modulos/portal/PortalGestoria.vue")
                .default,
            props: true,
        },

        // Portal - contactos
        {
            path: "/administracion/portal/contactos",
            name: "admin_portal.contactos",
            component: require("./components/modulos/portal/Contactos.vue")
                .default,
            props: true,
        },

        // Portal - redes_sociales
        {
            path: "/administracion/portal/redes_sociales",
            name: "admin_portal.redes_sociales",
            component: require("./components/modulos/portal/RedesSociales.vue")
                .default,
            props: true,
        },

        // Portal - plan_pagos
        {
            path: "/administracion/portal/plan_pagos",
            name: "admin_portal.plan_pagos",
            component: require("./components/modulos/portal/PlanPagos.vue")
                .default,
            props: true,
        },

        // Portal - Gestoria
        {
            path: "/administracion/portal_gestoria",
            name: "admin_portal_gestoria.index",
            component: require("./components/modulos/portal_gestoria/index.vue")
                .default,
            props: true,
        },

        // gestoria_tips
        {
            path: "/administracion/gestoria_tips",
            name: "gestoria_tips.index",
            component: require("./components/modulos/gestoria_tips/index.vue")
                .default,
            props: true,
        },

        // gestoria_nosotros
        {
            path: "/administracion/portal_gestoria/gestoria_nosotros",
            name: "admin_portal_gestoria.gestoria_nosotros",
            component:
                require("./components/modulos/portal_gestoria/GestoriaNosotros.vue")
                    .default,
            props: true,
        },

        // gestoria_servicios
        {
            path: "/administracion/gestoria_servicios",
            name: "gestoria_servicios.index",
            component:
                require("./components/modulos/gestoria_servicios/index.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/gestoria_servicios/edit",
            name: "gestoria_servicios.edit",
            component:
                require("./components/modulos/gestoria_servicios/GestoriaServicios.vue")
                    .default,
            props: true,
        },

        // Portal - gestoria_banners
        {
            path: "/administracion/portal_gestoria/gestoria_banners",
            name: "admin_portal_gestoria.gestoria_banners",
            component:
                require("./components/modulos/portal_gestoria/GestoriaBanners.vue")
                    .default,
            props: true,
        },

        // Portal - configuracion_gestoria
        {
            path: "/administracion/portal_gestoria/configuracion_gestoria",
            name: "admin_portal_gestoria.configuracion_gestoria",
            component:
                require("./components/modulos/portal_gestoria/ConfiguracionGestoria.vue")
                    .default,
            props: true,
        },

        // Cursos
        {
            path: "/administracion/cursos",
            name: "cursos.index",
            component: require("./components/modulos/cursos/index.vue").default,
            props: true,
        },
        {
            path: "/administracion/mis_cursos",
            name: "estudiante_cursos.index",
            component:
                require("./components/modulos/cursos/EstudianteCursos.vue")
                    .default,
        },
        {
            path: "/administracion/mis_cursos/mis_solicitudes/:id",
            name: "estudiante_cursos.mis_solicitudes",
            component: require("./components/modulos/cursos/MisSolicitudes.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/mis_cursos/nueva_solicitud/:id",
            name: "estudiante_cursos.nueva_solicitud",
            component: require("./components/modulos/cursos/NuevaSolicitud.vue")
                .default,
            props: true,
        },

        // Grupos
        {
            path: "/administracion/grupos",
            name: "grupos.index",
            component: require("./components/modulos/grupos/index.vue").default,
            props: true,
        },

        // Inscripciones
        {
            path: "/administracion/inscripcions",
            name: "inscripcions.index",
            component: require("./components/modulos/inscripcions/index.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/inscripcions/solicitudes/:id",
            name: "inscripcions.solicitudes",
            component:
                require("./components/modulos/inscripcions/Solicitudes.vue")
                    .default,
            props: true,
        },

        // Asignación Grupos
        {
            path: "/administracion/asignacion_grupos",
            name: "asignacion_grupos.index",
            component:
                require("./components/modulos/asignacion_grupos/index.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/asignacion_grupos/esudiantes",
            name: "asignacion_grupos.estudiantes",
            component:
                require("./components/modulos/asignacion_grupos/Estudiantes.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/asignacion_grupos/profesores",
            name: "asignacion_grupos.profesores",
            component:
                require("./components/modulos/asignacion_grupos/Profesores.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/asignacion_grupos/ver_grupo_asignacion/:id",
            name: "asignacion_grupos.ver_grupo_asignacion",
            component:
                require("./components/modulos/asignacion_grupos/VerGrupoAsignacion.vue")
                    .default,
            props: true,
        },

        // Profesors
        {
            path: "/administracion/profesors",
            name: "profesors.index",
            component: require("./components/modulos/profesors/index.vue")
                .default,
            props: true,
        },

        {
            path: "/administracion/grupos_profesor",
            name: "grupos_profesor.index",
            component: require("./components/modulos/grupos_profesor/index.vue")
                .default,
            props: true,
        },

        // Grupo Recursos
        {
            path: "/administracion/grupo_recursos",
            name: "grupo_recursos.index",
            component: require("./components/modulos/grupo_recursos/index.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/grupo_recursos/estudiante",
            name: "grupo_recursos.estudiante_recursos",
            component:
                require("./components/modulos/grupo_recursos/EstudianteRecursos.vue")
                    .default,
            props: true,
        },
        // Horarios
        {
            path: "/administracion/horarios",
            name: "horarios.index",
            component: require("./components/modulos/horarios/index.vue")
                .default,
            props: true,
        },

        // Examen de nivelacion
        {
            path: "/administracion/examen_nivelacions",
            name: "examen_nivelacions.index",
            component:
                require("./components/modulos/examen_nivelacions/index.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/examen_nivelacions/create",
            name: "examen_nivelacions.create",
            component:
                require("./components/modulos/examen_nivelacions/create.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/examen_nivelacions/edit/:id",
            name: "examen_nivelacions.edit",
            component:
                require("./components/modulos/examen_nivelacions/edit.vue")
                    .default,
            props: true,
        },

        {
            path: "/administracion/examen_nivelacions/estudiante",
            name: "examen_nivelacions.estudiantes",
            component:
                require("./components/modulos/examen_nivelacions/Estudiantes.vue")
                    .default,
            props: true,
        },

        // realizar examen estudiante
        {
            path: "/administracion/examen_nivelacions/realizar_examen/:id/:asignacion_id",
            name: "examen_nivelacions.realizar_examen",
            component:
                require("./components/modulos/realizar_examen/create.vue")
                    .default,
            props: true,
        },

        // calificar examen estudiante
        {
            path: "/administracion/examen_nivelacions/calificar_examenes",
            name: "examen_nivelacions.calificar_examen_index",
            component:
                require("./components/modulos/calificar_examen/index.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/examen_nivelacions/calificar_examen/examenes_grupo/:id",
            name: "examen_nivelacions.examenes_grupo",
            component:
                require("./components/modulos/calificar_examen/VerExamenesGrupo.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/examen_nivelacions/calificar_examen/examenes_grupo/:grupo_id/:id",
            name: "examen_nivelacions.calificar_examen",
            component: require("./components/modulos/calificar_examen/show.vue")
                .default,
            props: true,
        },

        // ver examen estudiante
        {
            path: "/administracion/examen_nivelacions/ver_examen/:id",
            name: "examen_nivelacions.ver_examen",
            component: require("./components/modulos/ver_examen/show.vue")
                .default,
            props: true,
        },

        // Comunicados
        {
            path: "/administracion/comunicados",
            name: "comunicados.index",
            component: require("./components/modulos/comunicados/index.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/comunicados/estudiante",
            name: "comunicados.estudiantes",
            component:
                require("./components/modulos/comunicados/ComunicadosEstudiantes.vue")
                    .default,
            props: true,
        },

        // Gestoria Solicitudes
        {
            path: "/administracion/gestoria_solicituds",
            name: "gestoria_solicituds.index",
            component:
                require("./components/modulos/gestoria_solicituds/index.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/gestoria_solicituds/:id",
            name: "gestoria_solicituds.show",
            component:
                require("./components/modulos/gestoria_solicituds/show.vue")
                    .default,
            props: true,
        },

        // Configuración
        {
            path: "/administracion/configuracion",
            name: "configuracion",
            component: require("./components/modulos/configuracion/index.vue")
                .default,
            props: true,
        },

        // Reportes
        {
            path: "/administracion/reportes/usuarios",
            name: "reportes.usuarios",
            component: require("./components/modulos/reportes/usuarios.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/reportes/profesors",
            name: "reportes.profesors",
            component: require("./components/modulos/reportes/profesors.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/reportes/estudiantes",
            name: "reportes.estudiantes",
            component: require("./components/modulos/reportes/estudiantes.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/reportes/historial_estudiante",
            name: "reportes.historial_estudiante",
            component: require("./components/modulos/reportes/historial_estudiante.vue")
                .default,
            props: true,
        },        
        {
            path: "/administracion/reportes/estudiantes_grupos",
            name: "reportes.estudiantes_grupos",
            component:
                require("./components/modulos/reportes/estudiantes_grupos.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/reportes/horarios",
            name: "reportes.horarios",
            component: require("./components/modulos/reportes/horarios.vue")
                .default,
            props: true,
        },
        {
            path: "/administracion/reportes/examen_nivelacion",
            name: "reportes.examen_nivelacion",
            component:
                require("./components/modulos/reportes/examen_nivelacion.vue")
                    .default,
            props: true,
        },
        {
            path: "/administracion/reportes/gestoria_solicituds",
            name: "reportes.gestoria_solicituds",
            component:
                require("./components/modulos/reportes/gestoria_solicituds.vue")
                    .default,
            props: true,
        },

        // PÁGINA NO ENCONTRADA
        {
            path: "*",
            component: require("./components/modulos/errors/404.vue").default,
        },
    ],
    mode: "history",
    linkActiveClass: "active open",
});
