<template>
    <div class="content-wrapper contenedor_ver_grupo_asignacion">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>
                            Asignación de Grupos >
                            {{ oGrupo ? oGrupo.nombre : "..." }}
                        </h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3" v-if="user.tipo == 'PROFESOR'">
                        <router-link
                            :to="{
                                name: 'grupos_profesor.index',
                            }"
                            class="btn btn-default btn-flat btn-block"
                        >
                            <i class="fa fa-arrow-left"></i>
                            Volver
                        </router-link>
                    </div>
                    <div class="col-md-3" v-if="user.tipo != 'PROFESOR'">
                        <router-link
                            :to="{
                                name: 'asignacion_grupos.index',
                            }"
                            class="btn btn-default btn-flat btn-block"
                        >
                            <i class="fa fa-arrow-left"></i>
                            Volver
                        </router-link>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-7">
                        <div class="card">
                            <div class="card-body">
                                <div class="row" v-if="oGrupo">
                                    <div class="col-md-12">
                                        <h4 class="w-100 text-center">
                                            Estudiantes Registrados
                                        </h4>
                                        <h4 class="w-100 text-center text-sm">
                                            Total:
                                            {{
                                                oGrupo.asignacion_grupos.length
                                            }}
                                        </h4>
                                    </div>
                                    <div
                                        class="col-md-12"
                                        v-for="(
                                            item, index
                                        ) in oGrupo.asignacion_grupos"
                                    >
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="info_estudiante">
                                                    <div
                                                        class="font-weight-bold numeracion"
                                                    >
                                                        {{ index + 1 }}
                                                    </div>
                                                    <div class="estudiante">
                                                        <div class="nombre">
                                                            {{
                                                                item.inscripcion
                                                                    .full_name
                                                            }}
                                                        </div>
                                                        <div class="detalles">
                                                            <div
                                                                class="detalle"
                                                            >
                                                                Estado:
                                                                <span
                                                                    class="font-weight-bold"
                                                                >
                                                                    {{
                                                                        item.estado
                                                                    }}</span
                                                                >
                                                            </div>
                                                            <div
                                                                class="detalle"
                                                            >
                                                                Calificación:
                                                                <span
                                                                    class="font-weight-bold"
                                                                    >{{
                                                                        item.calificacion
                                                                    }}</span
                                                                >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 class="w-100 text-center">
                                            Profesor Asignado
                                        </h4>
                                    </div>
                                    <div
                                        class="col-md-12"
                                        v-if="oGrupo && oGrupo.grupo_profesor"
                                    >
                                        <div class="text-center">
                                            <img
                                                class="profile-user-img img-fluid img-circle border-1 border-success"
                                                :src="
                                                    oGrupo.grupo_profesor
                                                        .profesor.user
                                                        .path_image
                                                "
                                                alt="User profile picture"
                                                id="img_perfil"
                                            />
                                        </div>
                                        <h3
                                            class="profile-username text-center"
                                        >
                                            {{
                                                oGrupo.grupo_profesor.profesor
                                                    .full_name
                                            }}
                                        </h3>
                                    </div>
                                    <div class="col-md-12" v-else>
                                        <h4
                                            class="w-100 text-md text-gray text-center"
                                        >
                                            Aún no se asigno un profesor al
                                            grupo
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    props: ["id"],
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oGrupo: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getGrupo();
    },
    methods: {
        getGrupo() {
            axios
                .get(main_url + "/admin/grupos/" + this.id)
                .then((response) => {
                    this.oGrupo = response.data.grupo;
                });
        },
    },
};
</script>

<style>
.contenedor_ver_grupo_asignacion .info_estudiante {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    width: 100%;
    position: relative;
}
.contenedor_ver_grupo_asignacion .info_estudiante .numeracion {
    position: absolute;
    top: -23px;
    left: -23px;
    background-color: var(--principal2);
    border-radius: 50%;
    height: 30px;
    width: 30px;
    color: white;
    font-size: 0.75em;
    display: flex;
    justify-content: center;
    align-items: center;
}
.contenedor_ver_grupo_asignacion .info_estudiante .estudiante {
    display: flex;
    flex-direction: column;
    width: 100%;
}
.contenedor_ver_grupo_asignacion .info_estudiante .estudiante .nombre {
    padding: 3px;
    padding-left: 20px;
    font-weight: 400;
    font-size: 0.95;
    font-weight: 500;
}
.contenedor_ver_grupo_asignacion .info_estudiante .estudiante .detalles {
    display: flex;
    padding: 3px;
    justify-content: space-around;
}
.contenedor_ver_grupo_asignacion
    .info_estudiante
    .estudiante
    .detalles
    .detalle {
    font-size: 0.85em;
    color: rgb(95, 95, 95);
}
</style>
