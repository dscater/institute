<template>
    <div class="col-md-12 mt-0">
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-1">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <label
                                    >Total preguntas:
                                    {{
                                        examen_nivelacion.total_preguntas
                                    }}</label
                                >
                            </div>
                            <div class="col-md-12">
                                <label
                                    >Correctos:
                                    <span class="fotn-weight-normal">{{
                                        c_correctos
                                    }}</span></label
                                >
                                <label
                                    >Incorrectos:
                                    <span class="fotn-weight-normal">{{
                                        c_incorrectos
                                    }}</span></label
                                >
                            </div>
                            <div class="col-md-12">
                                <label>Puntaje final: {{ puntaje }}</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <h4
                                    class="w-100 text-center"
                                    v-text="tituloExamen"
                                ></h4>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div
                                        class="col-md-12"
                                        v-if="
                                            examen_nivelacion.examen_enunciados
                                                .length > 0
                                        "
                                        v-for="(
                                            item, index
                                        ) in examen_nivelacion.examen_enunciados"
                                    >
                                        <div class="card contenedor_enunciado">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <p>
                                                            {{ index + 1 }})
                                                            {{ item.enunciado }}
                                                        </p>
                                                    </div>
                                                    <div
                                                        class="col-md-12 pl-4 pt-2"
                                                        v-for="(
                                                            pregunta,
                                                            index_pregunta
                                                        ) in item.enunciado_preguntas"
                                                    >
                                                        <div class="row">
                                                            <Respuesta
                                                                :index="index"
                                                                :index_pregunta="
                                                                    index_pregunta
                                                                "
                                                                :pregunta="
                                                                    pregunta
                                                                "
                                                                :respuestas="
                                                                    respuestas
                                                                "
                                                                :errors_form="
                                                                    errors
                                                                "
                                                                @actualiza_respuesta="
                                                                    actualizaRespuesta
                                                                "
                                                            ></Respuesta>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12" v-else>
                                        <h4
                                            class="w-100 text-center text-gray text-sm"
                                        >
                                            NO SE AGREGARÓN ENUNCIADOS
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <ModalInfo
            :muestra_modal="muestra_modal"
            @close="muestra_modal = false"
        ></ModalInfo>
    </div>
</template>

<script>
import ModalInfo from "./ModalInfo.vue";
import Respuesta from "./Respuesta.vue";
export default {
    components: {
        Respuesta,
        ModalInfo,
    },
    props: {
        accion: {
            type: String,
            default: "nuevo",
        },
        examen_nivelacion: {
            type: Object,
            default: {
                id: 0,
                curso_id: "",
                curso: {
                    nombre: "",
                },
            },
        },
        inscripcion_examen: {
            type: Object,
            default: {
                id: 0,
                inscripcion_id: "",
                inscripcion_solicitud_id: "",
                examen_nivelacion_id: "",
                puntaje: "",
                estado: "",
                c_correctos: 0,
                c_incorrectos: 0,
            },
        },
        respuestas: {
            type: Array,
            default: [],
            required: true,
        },
    },

    computed: {
        tituloExamen() {
            if (this.examen_nivelacion) {
                return (
                    "EXÁMEN DE NIVELACIÓN - " +
                    this.examen_nivelacion.curso.nombre
                );
            }
            return "EXÁMEN DE NIVELACIÓN - ";
        },
    },
    data() {
        return {
            errors: [],
            muestra_modal: false,
            enviando: false,
            puntaje: 0,
            c_correctos: 0,
            c_incorrectos: 0,
        };
    },
    mounted() {
        this.c_correctos = this.inscripcion_examen?.c_correctos;
        this.c_incorrectos = this.inscripcion_examen?.c_incorrectos;
        this.puntaje = this.inscripcion_examen.puntaje;
        setTimeout(() => {
            this.inicializarRespuestas();
        }, 300);
    },
    methods: {
        inicializarRespuestas() {
            this.contabilizarCorrectosIncorrectos();
        },
        contabilizarCorrectosIncorrectos() {
            let correctos = this.respuestas.filter(
                (elem) => elem.calificacion == "CORRECTO"
            );
            this.c_correctos = correctos.length;
            let incorrectos = this.respuestas.filter(
                (elem) => elem.calificacion != "CORRECTO"
            );
            this.c_incorrectos = incorrectos.length;
        },
        actualizaRespuesta(id, valor) {
            this.respuestas.filter((elem) => elem.id == id)[0].calificacion =
                valor;
            this.contabilizarCorrectosIncorrectos();
        },
    },
};
</script>

<style>
.contenedor_enunciado {
    overflow: auto !important;
}
.contenedor_enunciado > .card-body {
    min-width: 400px;
}
</style>
