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

        // Portal - actividades
        {
            path: "/administracion/portal/actividades",
            name: "admin_portal.actividades",
            component: require("./components/modulos/portal/Actividades.vue")
                .default,
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

        // Portal - banners
        {
            path: "/administracion/portal/contactos",
            name: "admin_portal.contactos",
            component: require("./components/modulos/portal/Contactos.vue")
                .default,
            props: true,
        },

        // Portal - nosotros
        {
            path: "/administracion/portal/nosotros",
            name: "admin_portal.nosotros",
            component: require("./components/modulos/portal/Nosotros.vue")
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

        // Catálogos
        {
            path: "/administracion/catalogos",
            name: "catalogos.index",
            component: require("./components/modulos/catalogos/index.vue")
                .default,
            props: true,
        },

        // Productos
        {
            path: "/administracion/productos",
            name: "productos.index",
            component: require("./components/modulos/productos/index.vue")
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

        // PÁGINA NO ENCONTRADA
        {
            path: "*",
            component: require("./components/modulos/errors/404.vue").default,
        },
    ],
    mode: "history",
    linkActiveClass: "active open",
});
