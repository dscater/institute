<template>
    <div class="content-wrapper contenedor_cursos">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Cursos > Mis Cursos</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-md-3" v-if="oInscripcion">
                        <router-link
                            :to="{
                                name: 'estudiante_cursos.mis_solicitudes',
                                params: {
                                    id: oInscripcion.id,
                                },
                            }"
                            class="btn btn-success btn-block btn-flat"
                        >
                            <i class="fa fa-list-alt"></i> Mis solicitudes
                        </router-link>
                    </div>
                    <div class="col-md-3" v-if="oInscripcion">
                        <router-link
                            :to="{
                                name: 'estudiante_cursos.nueva_solicitud',
                                params: { id: oInscripcion.id },
                            }"
                            class="btn btn-success btn-block btn-flat"
                        >
                            <i class="fa fa-plus"></i> Nueva solicitud
                        </router-link>
                    </div>
                </div>
                <div class="row">
                    <div
                        class="col-md-12"
                        v-for="item in listAsignacionGruposEstudiante"
                    >
                        <div class="card">
                            <div class="card-body p-0">
                                <div class="row">
                                    <div class="col-md-4 p-0">
                                        <img
                                            :src="item.curso.url_imagen"
                                            alt="Curso"
                                            style="width: 100%"
                                        />
                                    </div>
                                    <div class="col-md-8 p-4">
                                        <h4>{{ item.curso.nombre }}</h4>
                                        <p>
                                            <strong>Estado:</strong>
                                            {{ item.grupo.estado }}
                                        </p>
                                        <p>
                                            <strong>Modalidad:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .modalidad
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p>
                                            <strong>Fecha Inicio:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .fecha_inicio_t
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p>
                                            <strong>Fecha Fin:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .fecha_fin_t
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p>
                                            <strong>Días:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .dias_txt
                                                    : "S/A"
                                            }}
                                        </p>
                                        <p>
                                            <strong>Horario:</strong>
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .hora_inicio_t
                                                    : "S/A"
                                            }}
                                            a
                                            {{
                                                item.grupo.horario
                                                    ? item.grupo.horario
                                                          .hora_fin_t
                                                    : "S/A"
                                            }}
                                        </p>
                                        <a
                                            :href="item.grupo.link_reunion"
                                            v-if="item.grupo.link_reunion"
                                            >{{ item.link_reunion }}</a
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" v-if="listAsignacionGruposEstudiante.length > 0">
                    <div class="col-md-12 pb-3 paginacion_portal">
                        <b-pagination
                            class="rounded-0"
                            align="center"
                            v-model="currentPage"
                            :total-rows="rows"
                            :per-page="perPage"
                            aria-controls="my-table"
                        ></b-pagination>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    watch: {
        currentPage(newVal) {
            this.getAsignacionesGruposEstudiante(newVal);
        },
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            search: "",
            currentPage: 1,
            perPage: 10,
            rows: 10,
            listAsignacionGruposEstudiante: [],
            oInscripcion: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getAsignacionesGruposEstudiante();
    },
    methods: {
        // Listar Cursos
        getAsignacionesGruposEstudiante(page = 1) {
            this.showOverlay = true;
            let url =
                main_url + "/admin/asignacion_grupos/asignaciones_estudiante";
            axios
                .get(url, {
                    params: { page: page, per_page: this.per_page },
                })
                .then((response) => {
                    this.rows = response.data.asignacion_grupos.total;
                    this.perPage = response.data.per_page;

                    this.listAsignacionGruposEstudiante =
                        response.data.asignacion_grupos.data;
                    this.oInscripcion = response.data.inscripcion;
                });
        },
    },
};
</script>

<style>
.contenedor_cursos .img_curso {
    height: 100px;
}
</style>
