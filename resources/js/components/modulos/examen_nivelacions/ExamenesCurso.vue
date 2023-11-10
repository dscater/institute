<template>
    <div class="col-md-12 mb-3 contenedor_link_examen">
        <div class="row">
            <div class="col-md-12" v-if="oExamenNivelacion">
                <div class="card">
                    <div class="card-body">
                        <div class="row fila_examen">
                            <div class="col-md-12">
                                <p class="">
                                    <strong>Código de examen: </strong
                                    >{{ oExamenNivelacion.id }}
                                </p>
                                <p class="">
                                    <strong>Total preguntas: </strong
                                    >{{ oExamenNivelacion.total_preguntas }}
                                </p>
                                <template
                                    v-if="
                                        asignacion_grupo &&
                                        asignacion_grupo.inscripcion_solicitud
                                            .inscripcion_examen
                                    "
                                >
                                    <p class="">
                                        <strong>Revisión examen: </strong>
                                        <span
                                            class="text-sm badge"
                                            :class="[
                                                asignacion_grupo
                                                    .inscripcion_solicitud
                                                    .inscripcion_examen
                                                    .estado == 'PENDIENTE'
                                                    ? 'badge-danger'
                                                    : 'badge-success',
                                            ]"
                                            >{{
                                                asignacion_grupo
                                                    .inscripcion_solicitud
                                                    .inscripcion_examen.estado
                                            }}</span
                                        >
                                    </p>
                                    <p class="">
                                        <strong>Calificación: </strong>
                                        <span
                                            class="text-sm badge"
                                            :class="[
                                                asignacion_grupo
                                                    .inscripcion_solicitud
                                                    .inscripcion_examen.puntaje
                                                    ? 'badge-success'
                                                    : 'badge-danger',
                                            ]"
                                            >{{
                                                asignacion_grupo
                                                    .inscripcion_solicitud
                                                    .inscripcion_examen.puntaje
                                            }}</span
                                        >
                                    </p>
                                </template>
                            </div>
                            <div class="col-md-3 mb-0">
                                <router-link
                                    v-if="
                                        !asignacion_grupo.inscripcion_solicitud
                                            .inscripcion_examen
                                    "
                                    :to="{
                                        name: 'examen_nivelacions.realizar_examen',
                                        params: {
                                            id: oExamenNivelacion.id,
                                            asignacion_id: asignacion_grupo_id,
                                        },
                                    }"
                                    class="btn btn-sm btn-success btn-flat btn-block"
                                >
                                    <i class="fa fa-clipboard-list"></i>
                                    Realizar examen
                                </router-link>
                                <router-link
                                    v-else
                                    :to="{
                                        name: 'examen_nivelacions.ver_examen',
                                        params: {
                                            id: asignacion_grupo
                                                .inscripcion_solicitud
                                                .inscripcion_examen.id,
                                        },
                                    }"
                                    class="btn btn-sm btn-primary btn-flat btn-block"
                                >
                                    <i class="fa fa-clipboard-list"></i>
                                    Ver examen
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" v-if="!oExamenNivelacion">
                <div class="card">
                    <div class="card-body">
                        <h4 class="w-100 text-center font-weight-bold text-md">
                            NO SE CARGÓ NINGUN EXAMEN AÚN
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        curso_id: {
            type: Number,
            default: 0,
            requred: true,
        },
        asignacion_grupo_id: {
            type: Number,
            default: 0,
            required: true,
        },
        asignacion_grupo: {
            type: Object,
            default: {
                id: 0,
                grupo_id: 0,
                inscripcion_id: 0,
                inscripcion_solicitud_id: 0,
                curso_id: 0,
            },
            required: true,
        },
    },
    data() {
        return {
            oExamenNivelacion: null,
            oCurso: null,
        };
    },
    mounted() {
        this.getExamenesCurso();
    },
    methods: {
        getExamenesCurso() {
            axios
                .get(
                    main_url +
                        "/admin/examen_nivelacions/getExamenesCurso/" +
                        this.curso_id
                )
                .then((response) => {
                    this.oCurso = response.data;
                    this.oExamenNivelacion = this.oCurso.examen_nivelacion;
                });
        },
    },
};
</script>
<style>
.contenedor_link_examen .fila_examen {
    position: relative;
}
.contenedor_link_examen .fecha_hora {
    position: absolute;
    right: 0px;
    top: 0px;
    font-size: 0.75em;
}
</style>
