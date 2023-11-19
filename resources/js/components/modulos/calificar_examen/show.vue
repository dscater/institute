<template>
    <div class="content-wrapper contenedor_inscripcion_examens">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Exámen de nivelación > Calificar</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row mb-3">
                    <div class="col-md-3">
                        <router-link
                            :to="{
                                name: 'examen_nivelacions.examenes_grupo',
                                params: {
                                    id: grupo_id,
                                },
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
                    v-if="oInscripcionExamen && oInscripcionExamen.inscripcion"
                >
                    <div class="col-md-12">
                        <div class="card mb-1">
                            <div class="card-body">
                                <div class="col-md-12">
                                    <p class="mb-1">
                                        <strong>Estudiante: </strong>
                                        {{
                                            oInscripcionExamen.inscripcion
                                                .full_name
                                        }}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div
                    class="row"
                    v-if="
                        oInscripcionExamen &&
                        oInscripcionExamen.examen_nivelacion
                    "
                >
                    <Formulario
                        :accion="'edit'"
                        :examen_nivelacion="
                            oInscripcionExamen.examen_nivelacion
                        "
                        :inscripcion_examen="oInscripcionExamen"
                        :respuestas="oInscripcionExamen.inscripcion_respuestas"
                    ></Formulario>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import Formulario from "./Formulario.vue";
export default {
    props: ["id", "grupo_id"],
    components: {
        Formulario,
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oInscripcionExamen: {
                id: 0,
            },
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getInscripcionExamen();
    },
    methods: {
        getInscripcionExamen() {
            axios
                .get(main_url + "/admin/inscripcion_examens/" + this.id)
                .then((response) => {
                    this.oInscripcionExamen = response.data.inscripcion_examen;
                });
        },
    },
};
</script>

<style></style>
