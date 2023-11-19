<template>
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-warning">
        <!-- Brand Logo -->
        <router-link
            exact
            :to="{ name: 'inicio' }"
            class="brand-link bg-success"
        >
            <img
                :src="configuracion.path_image"
                alt="Logo"
                class="brand-image"
                style="opacity: 0.8"
            />
            <span
                class="brand-text font-weight-light"
                v-text="configuracion.alias"
            ></span>
        </router-link>

        <!-- Sidebar -->
        <div class="sidebar p-0">
            <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img
                        :src="user_sidebar.path_image"
                        class="img-circle elevation-2"
                        alt="User Image"
                    />
                </div>
                <div class="info">
                    <router-link
                        exact
                        :to="{
                            name: 'usuarios.perfil',
                            params: { id: user.id },
                        }"
                        class="d-block"
                        v-text="user_sidebar.full_name"
                    ></router-link>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline pl-1 pr-1">
                <div class="input-group" data-widget="sidebar-search">
                    <input
                        class="form-control form-control-sidebar bg-white"
                        type="search"
                        placeholder="Buscar Modulo"
                        aria-label="Search"
                    />
                    <div class="input-group-append">
                        <button class="btn btn-sidebar bg-white">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2 pr-1 pl-1">
                <ul
                    class="nav nav-pills nav-sidebar flex-column nav-compact nav-child-indent text-xs"
                    data-widget="treeview"
                    role="menu"
                    data-accordion="false"
                >
                    <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <router-link
                            exact
                            :to="{ name: 'inicio' }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-home"></i>
                            <p>Pandel de Administración</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('estudiante_cursos.index')"
                        :class="[
                            $route.name == 'estudiante_cursos.index' ||
                            $route.name ==
                                'estudiante_cursos.mis_solicitudes' ||
                            $route.name ==
                                'estudiante_cursos.nueva_solicitud' ||
                            $route.name == 'grupo_recursos.estudiante_recursos'
                                ? 'menu-is-opening menu-open'
                                : '',
                        ]"
                    >
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>
                                Cursos
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('estudiante_cursos.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'estudiante_cursos.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Mis Cursos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'grupo_recursos.estudiante_recursos'
                                    )
                                "
                            >
                                <router-link
                                    :to="{
                                        name: 'grupo_recursos.estudiante_recursos',
                                    }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Recursos</p>
                                </router-link>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item" v-if="user.tipo == 'ESTUDIANTE'">
                        <router-link
                            :to="{ name: 'examen_nivelacions.estudiantes' }"
                            class="nav-link"
                            :class="[
                                $route.name ==
                                    'examen_nivelacions.realizar_examen' ||
                                $route.name == 'examen_nivelacions.ver_examen'
                                    ? 'active'
                                    : '',
                            ]"
                        >
                            <i class="nav-icon fas fa-clipboard-list"></i>
                            <p>Examen de Nivelación</p>
                        </router-link>
                    </li>
                    <li class="nav-item" v-if="user.tipo == 'ESTUDIANTE'">
                        <router-link
                            :to="{ name: 'comunicados.estudiantes' }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>Comunicados</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="
                            (user.tipo != 'ESTUDIANTE' &&
                                (permisos.includes('cursos.index') ||
                                    permisos.includes('inscripcions.index') ||
                                    permisos.includes('grupos.index') ||
                                    permisos.includes('inscripcions.index') ||
                                    permisos.includes(
                                        'asignacion_grupos.index'
                                    ) ||
                                    permisos.includes('grupo_profesors') ||
                                    permisos.includes('horarios.index') ||
                                    permisos.includes('grupo_recursos.index') ||
                                    permisos.includes(
                                        'examen_nivelacions.index'
                                    ))) ||
                            permisos.includes('comunicados.index')
                        "
                        :class="[
                            $route.name == 'grupos.index' ||
                            $route.name == 'cursos.index' ||
                            $route.name == 'inscripcions.index' ||
                            $route.name == 'inscripcions.solicitudes' ||
                            $route.name == 'asignacion_grupos.index' ||
                            $route.name == 'horarios.index' ||
                            $route.name == 'asignacion_grupos.estudiantes' ||
                            $route.name == 'asignacion_grupos.profesores' ||
                            $route.name == 'grupo_recursos.index' ||
                            $route.name == 'examen_nivelacions.index' ||
                            $route.name == 'examen_nivelacions.create' ||
                            $route.name == 'examen_nivelacions.edit' ||
                            $route.name ==
                                'examen_nivelacions.calificar_examen_index' ||
                            $route.name ==
                                'examen_nivelacions.calificar_examen' ||
                            $route.name == 'comunicados.index' ||
                            $route.name == 'grupos_profesor.index' ||
                            $route.name ==
                                'asignacion_grupos.ver_grupo_asignacion' ||
                            $route.name == 'examen_nivelacions.examenes_grupo'
                                ? 'menu-is-opening menu-open'
                                : '',
                        ]"
                    >
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p>
                                Administración de cursos
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('grupos_profesor.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'grupos_profesor.index' }"
                                    class="nav-link"
                                    :class="{
                                        active:
                                            $route.name ==
                                            'asignacion_grupos.ver_grupo_asignacion',
                                    }"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Mis Grupos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('grupos.index')"
                            >
                                <router-link
                                    :to="{ name: 'grupos.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Grupos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('asignacion_grupos.index')
                                "
                            >
                                <router-link
                                    :to="{ name: 'asignacion_grupos.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Asignación de Grupos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.indexOf('cursos.index') > 0"
                            >
                                <router-link
                                    :to="{ name: 'cursos.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Cursos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('inscripcions.index')"
                            >
                                <router-link
                                    :to="{ name: 'inscripcions.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Inscripciones</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('horarios.index')"
                            >
                                <router-link
                                    :to="{ name: 'horarios.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Horarios</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('grupo_recursos.index')"
                            >
                                <router-link
                                    :to="{ name: 'grupo_recursos.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Recursos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('comunicados.index')"
                            >
                                <router-link
                                    :to="{ name: 'comunicados.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Comunicados</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'examen_nivelacions.index'
                                    )
                                "
                            >
                                <router-link
                                    :to="{ name: 'examen_nivelacions.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Examen de nivelación</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'examen_nivelacions.calificar_examen_index'
                                    )
                                "
                            >
                                <router-link
                                    :to="{
                                        name: 'examen_nivelacions.calificar_examen_index',
                                    }"
                                    class="nav-link"
                                    :class="[
                                        $route.name ==
                                            'examen_nivelacions.calificar_examen_index' ||
                                        $route.name ==
                                            'examen_nivelacions.examenes_grupo' ||
                                        $route.name ==
                                            'examen_nivelacions.calificar_examen'
                                            ? 'active'
                                            : '',
                                    ]"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Examen de nivelación</p>
                                </router-link>
                            </li>
                        </ul>
                    </li>
                    <li
                        class="nav-item"
                        v-if="
                            permisos.includes('gestoria_servicios.index') ||
                            permisos.includes('gestoria_tips.index') ||
                            permisos.includes('portal_gestoria.index') ||
                            permisos.includes('gestoria_solicituds.index')
                        "
                        :class="[
                            $route.name == 'gestoria_servicios.index' ||
                            $route.name == 'gestoria_servicios.edit' ||
                            $route.name == 'gestoria_tips.index' ||
                            $route.name == 'admin_portal_gestoria.index' ||
                            $route.name ==
                                'admin_portal_gestoria.gestoria_banners' ||
                            $route.name ==
                                'admin_portal_gestoria.gestoria_nosotros' ||
                            $route.name ==
                                'admin_portal_gestoria.configuracion_gestoria' ||
                            $route.name == 'gestoria_solicituds.index'
                                ? 'menu-is-opening menu-open'
                                : '',
                        ]"
                    >
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-list-alt"></i>
                            <p class="text-xs">
                                Administración Gestoría de Visa
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'gestoria_servicios.index'
                                    )
                                "
                            >
                                <router-link
                                    :to="{
                                        name: 'gestoria_servicios.index',
                                    }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Servicios</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'gestoria_solicituds.index'
                                    )
                                "
                            >
                                <router-link
                                    :to="{ name: 'gestoria_solicituds.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Solicitudes de Servicios</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('gestoria_tips.index')"
                            >
                                <router-link
                                    :to="{ name: 'gestoria_tips.index' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Tips Para Lograr Tú Visa</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes('portal_gestoria.index')
                                "
                            >
                                <router-link
                                    :to="{
                                        name: 'admin_portal_gestoria.index',
                                    }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Configurar Gestoría de Visa</p>
                                </router-link>
                            </li>
                        </ul>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('portals.index')"
                    >
                        <router-link
                            :to="{ name: 'admin_portal.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fa fa-table"></i>
                            <p>Configurar Portal</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('usuarios.index')"
                    >
                        <router-link
                            exact
                            :to="{ name: 'usuarios.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-users"></i>
                            <p>Gestión de Usuarios</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('profesors.index')"
                    >
                        <router-link
                            exact
                            :to="{ name: 'profesors.index' }"
                            class="nav-link"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="nav-icon fas fa-users"></i>
                            <p>Profesores</p>
                        </router-link>
                    </li>
                    <li
                        class="nav-item"
                        v-if="
                            permisos.includes('reportes.usuarios') ||
                            permisos.includes('reportes.profesors') ||
                            permisos.includes('reportes.profesors') ||
                            permisos.includes('reportes.estudiantes') ||
                            permisos.includes('reportes.estudiantes_grupos') ||
                            permisos.includes('reportes.horarios') ||
                            permisos.includes('reportes.examen_nivelacion') ||
                            permisos.includes('reportes.gestoria_solicituds') ||
                            permisos.includes('reportes.historial_estudiante')
                        "
                        :class="[
                            $route.name == 'reportes.usuarios' ||
                            $route.name == 'reportes.profesors' ||
                            $route.name == 'reportes.profesors' ||
                            $route.name == 'reportes.estudiantes' ||
                            $route.name == 'reportes.estudiantes_grupos' ||
                            $route.name == 'reportes.horarios' ||
                            $route.name == 'reportes.examen_nivelacion' ||
                            $route.name == 'reportes.gestoria_solicituds' ||
                            $route.name == 'reportes.historial_estudiante'
                                ? 'menu-is-opening menu-open'
                                : '',
                        ]"
                    >
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-file-pdf"></i>
                            <p>
                                Reportes
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li
                                class="nav-item"
                                v-if="permisos.includes('reportes.usuarios')"
                            >
                                <router-link
                                    :to="{ name: 'reportes.usuarios' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Lista de Usuarios</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('reportes.profesors')"
                            >
                                <router-link
                                    :to="{ name: 'reportes.profesors' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Lista de Profesores</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('reportes.estudiantes')"
                            >
                                <router-link
                                    :to="{ name: 'reportes.estudiantes' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Lista de Estudiantes</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'reportes.estudiantes_grupos'
                                    )
                                "
                            >
                                <router-link
                                    :to="{
                                        name: 'reportes.estudiantes_grupos',
                                    }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Lista de Estudiantes por Grupos</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'reportes.historial_estudiante'
                                    )
                                "
                            >
                                <router-link
                                    :to="{
                                        name: 'reportes.historial_estudiante',
                                    }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Historial de Estudiante</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="permisos.includes('reportes.horarios')"
                            >
                                <router-link
                                    :to="{ name: 'reportes.horarios' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Horarios</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'reportes.examen_nivelacion'
                                    )
                                "
                            >
                                <router-link
                                    :to="{ name: 'reportes.examen_nivelacion' }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Examen de Nivelación</p>
                                </router-link>
                            </li>
                            <li
                                class="nav-item"
                                v-if="
                                    permisos.includes(
                                        'reportes.gestoria_solicituds'
                                    )
                                "
                            >
                                <router-link
                                    :to="{
                                        name: 'reportes.gestoria_solicituds',
                                    }"
                                    class="nav-link"
                                >
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Solicitud de Servicios Gestoría Visa</p>
                                </router-link>
                            </li>
                        </ul>
                    </li>
                    <li
                        class="nav-item"
                        v-if="permisos.includes('configuracion.index')"
                    >
                        <router-link
                            :to="{ name: 'configuracion' }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-cog"></i>
                            <p>Configurar Sistema</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link
                            exact
                            :to="{
                                name: 'usuarios.perfil',
                                params: { id: user.id },
                            }"
                            class="nav-link"
                        >
                            <i class="nav-icon fas fa-user"></i>
                            <p>Perfil</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <a
                            href="#"
                            class="nav-link"
                            @click.prevent="logout()"
                            v-loading.fullscreen.lock="fullscreenLoading"
                        >
                            <i class="fas fa-power-off nav-icon"></i>
                            <p>Cerrar Sesión</p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
</template>

<script>
export default {
    props: ["user_sidebar", "configuracion"],
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            fullscreenLoading: false,
            permisos:
                typeof localStorage.getItem("permisos") == "string"
                    ? JSON.parse(localStorage.getItem("permisos"))
                    : localStorage.getItem("permisos"),
            timeoutId: null,
        };
    },
    mounted() {
        // Configurar el temporizador para llamar a logout después de 10 minutos de inactividad
        this.resetLogoutTimer();
        window.addEventListener("mousemove", this.resetLogoutTimer);
    },
    methods: {
        logout() {
            this.fullscreenLoading = true;
            axios.post(main_url + "/logout").then((res) => {
                let self = this;
                setTimeout(function () {
                    self.$router.push({ name: "login" });
                    localStorage.clear();
                    location.reload();
                }, 500);
            });
        },
        resetLogoutTimer() {
            // Reiniciar el temporizador cuando se detecta actividad
            clearTimeout(this.timeoutId);
            this.timeoutId = setTimeout(() => {
                this.logout();
            }, 10 * 60 * 1000); // 10 minutos en milisegundos
        },
    },
    beforeDestroy() {
        // Limpiar el temporizador y quitar el evento cuando se destruye el componente
        clearTimeout(this.timeoutId);
        window.removeEventListener("mousemove", this.resetLogoutTimer);
    },
};
</script>

<style>
.user-panel .info {
    display: flex;
    height: 100%;
    align-items: center;
}
.user-panel .info a {
    font-size: 0.8em;
}

.main-sidebar .image img {
    min-height: 30px;
}
</style>
