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

        // Portal - gestoria_banners
        {
            path: "/administracion/portal/gestoria_banners",
            name: "admin_portal.gestoria_banners",
            component:
                require("./components/modulos/portal/GestoriaBanners.vue")
                    .default,
            props: true,
        },

        // Portal - gestoria_nosotros
        {
            path: "/administracion/portal/gestoria_nosotros",
            name: "admin_portal.gestoria_nosotros",
            component:
                require("./components/modulos/portal/GestoriaNosotros.vue")
                    .default,
            props: true,
        },

        // Portal - gestoria_servicios
        {
            path: "/administracion/portal/gestoria_servicios",
            name: "admin_portal.gestoria_servicios",
            component:
                require("./components/modulos/portal/GestoriaServicios.vue")
                    .default,
            props: true,
        },

        // Portal - configuracion_gestoria
        {
            path: "/administracion/portal/configuracion_gestoria",
            name: "admin_portal.configuracion_gestoria",
            component:
                require("./components/modulos/portal/ConfiguracionGestoria.vue")
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

        // Configuración
        {
            path: "/administracion/configuracion",
            name: "configuracion",
            component: require("./components/modulos/configuracion/index.vue")
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
