<template>
    <div class="col-md-12 mt-0">
        <div class="row">
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
            <div class="col-md-12">
                <div class="card">
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
                            <div class="col-md-12 form-group">
                                <label>Puntaje final:</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    v-model="puntaje"
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-4">
                <button
                    class="btn btn-success btn-block btn-flat"
                    v-html="txtBtnRegistrar"
                    @click="enviarFormulario"
                    :disabled="enviando"
                ></button>
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
        txtBtnRegistrar() {
            if (this.enviando) {
                return `<i class="fa fa-spinner fa-spin"></i> ENVIANDO...`;
            } else {
                return `<i class="fa fa-clipboard-check"></i> REGISTRAR CALIFICACIÓN`;
            }
        },
    },
    data() {
        return {
            errors: [],
            muestra_modal: false,
            enviando: false,
            puntaje: 0,
            estado: this.inscripcion_examen.estado,
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
        enviarFormulario() {
            Swal.fire({
                icon: "question",
                title: "¿Estas seguro(a) de registrar el puntaje?",
                showCancelButton: true,
                confirmButtonColor: "#03a898",
                confirmButtonText: "Si, registrar",
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                if (result.isConfirmed) {
                    try {
                        this.enviando = true;
                        let url =
                            main_url +
                            "/admin/inscripcion_examens/registrar_calificacion/" +
                            this.inscripcion_examen.id;
                        axios
                            .post(url, {
                                puntaje: this.puntaje,
                                respuestas: this.respuestas,
                            })
                            .then((res) => {
                                this.enviando = false;
                                Swal.fire({
                                    icon: "success",
                                    title: res.data.msj,
                                    showConfirmButton: false,
                                    timer: 1500,
                                });
                                this.$router.push({
                                    name: "examen_nivelacions.calificar_examen_index",
                                });
                                this.errors = [];
                            })
                            .catch((error) => {
                                this.enviando = false;
                                if (this.accion == "edit") {
                                    this.textoBtn = "Actualizar";
                                } else {
                                    this.textoBtn = "Registrar";
                                }
                                if (error.response) {
                                    if (error.response.status === 422) {
                                        this.errors =
                                            error.response.data.errors;
                                        let mensaje = `<ul class="text-left">`;
                                        for (let key in this.errors) {
                                            if (
                                                this.errors.hasOwnProperty(key)
                                            ) {
                                                const value = this.errors[key];
                                                if (Array.isArray(value)) {
                                                    value.forEach((error) => {
                                                        mensaje += `<li><span>${error.trim()}</span></li>`;
                                                    });
                                                }
                                            }
                                        }
                                        mensaje += `<ul/>`;
                                        Swal.fire({
                                            icon: "error",
                                            title: "Tienes los siguientes errores en el formulario",
                                            html: mensaje,
                                            showConfirmButton: true,
                                            confirmButtonColor: "#009688",
                                            confirmButtonText: "Aceptar",
                                        });
                                    }
                                    if (
                                        error.response.status === 420 ||
                                        error.response.status === 419 ||
                                        error.response.status === 401
                                    ) {
                                        window.location = "/";
                                    }
                                    if (error.response.status === 500) {
                                        Swal.fire({
                                            icon: "error",
                                            title: "Error",
                                            html: error.response.data.message,
                                            showConfirmButton: false,
                                            timer: 2000,
                                        });
                                    }
                                }
                            });
                    } catch (e) {
                        this.enviando = false;
                        console.log(e);
                    }
                }
            });
        },
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
