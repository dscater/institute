<template>
    <div class="content-wrapper contenedor_examen_nivelacions">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>
                            Examen de nivelación >
                            {{ oGrupo ? oGrupo.nombre : "..." }}
                        </h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row mb-3">
                    <div class="col-md-3">
                        <router-link
                            v-if="
                                permisos.includes(
                                    'examen_nivelacions.calificar_examen_index'
                                )
                            "
                            :to="{
                                name: 'examen_nivelacions.calificar_examen_index',
                            }"
                            class="btn btn-default btn-flat btn-block"
                        >
                            <i class="fa fa-arrow-left"></i>
                            Volver
                        </router-link>
                    </div>
                </div>
                <div
                    class="row"
                    v-if="oGrupo && oGrupo.asignacion_grupos.length > 0"
                >
                    <div
                        class="col-md-4"
                        v-for="item in oGrupo.asignacion_grupos"
                    >
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4 class="text-md">
                                            {{
                                                item.inscripcion_solicitud.curso
                                                    .nombre
                                            }}
                                        </h4>
                                    </div>
                                    <div class="col-md-12">
                                        <p class="mb-1">
                                            <strong>Estudiante: </strong>
                                            {{ item.inscripcion.full_name }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Estado: </strong>
                                            {{ item.estado }}
                                        </p>
                                        <p class="mb-1">
                                            <strong>Calificación: </strong>
                                            {{ item.calificacion }}
                                        </p>
                                        <hr />
                                        <template
                                            v-if="
                                                item.inscripcion_solicitud
                                                    .inscripcion_examen
                                            "
                                        >
                                            <p class="mb-1">
                                                <strong>Código Examen: </strong>
                                                {{
                                                    item.inscripcion_solicitud
                                                        .inscripcion_examen
                                                        .examen_nivelacion.id
                                                }}
                                            </p>
                                            <p class="mb-1">
                                                <strong>Puntaje: </strong>
                                                {{
                                                    item.inscripcion_solicitud
                                                        .inscripcion_examenpuntaje
                                                }}
                                            </p>
                                        </template>
                                        <template v-else>
                                            <p
                                                class="text-gray font-weight-bold mb-4"
                                            >
                                                Aún no realizó el examen
                                            </p>
                                        </template>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-md-6">
                                        <button
                                            class="btn btn-success btn-flat btn-block"
                                            @click="
                                                muestraModalCalificacion(item)
                                            "
                                        >
                                            <i
                                                class="fa fa-clipboard-check"
                                            ></i>
                                            Calificación del Curso
                                        </button>
                                    </div>
                                    <div
                                        class="col-md-6"
                                        v-if="
                                            item.inscripcion_solicitud
                                                .inscripcion_examen
                                        "
                                    >
                                        <router-link
                                            :to="{
                                                name: 'examen_nivelacions.calificar_examen',
                                                params: {
                                                    id: item
                                                        .inscripcion_solicitud
                                                        .inscripcion_examen.id,
                                                    grupo_id: id,
                                                },
                                            }"
                                            class="btn btn-primary btn-flat btn-block"
                                        >
                                            <i
                                                class="fa fa-clipboard-check"
                                            ></i>
                                            Calificar Examen
                                        </router-link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" v-else>
                    <div class="col-md-12">
                        <h4 class="w-100 text-center text-gray">
                            NO SE ENCONTRARÓN REGISTROS
                        </h4>
                    </div>
                </div>
                <div class="row" v-if="oGrupo">
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
            <CalificacionCurso
                :muestra_modal="muestra_modal"
                @close="
                    muestra_modal = false;
                    getGrupo();
                "
                :asignacion_grupo="oAsignacionGrupo"
            ></CalificacionCurso>
        </section>
    </div>
</template>

<script>
import CalificacionCurso from "./CalificacionCurso.vue";
export default {
    props: ["id"],
    components: {
        CalificacionCurso,
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            listGrupos: [],
            search: "",
            currentPage: 1,
            perPage: 10,
            rows: 10,
            oGrupo: null,
            muestra_modal: false,
            oAsignacionGrupo: {
                id: 0,
                grupo_id: "",
                inscripcion_id: "",
                inscripcion_solicitud_id: "",
                curso_id: "",
                estado: "",
                inscripcion: {
                    full_name: "",
                },
                curso: {
                    nombre: "",
                },
            },
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
        muestraModalCalificacion(item) {
            this.muestra_modal = true;
            this.oAsignacionGrupo = item;
        },
    },
};
</script>

<style>
.contenedor_examen_nivelacions .img_examen_nivelacion {
    height: 100px;
}
</style>
