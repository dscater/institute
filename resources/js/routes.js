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
            props:true
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
