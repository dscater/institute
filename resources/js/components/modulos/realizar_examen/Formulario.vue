<template>
    <div class="col-md-12 mt-2">
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
                            <!-- <div class="col-md-12">
                                <span
                                    class="cursor-pointer"
                                    @click="muestra_modal = true"
                                >
                                    <i class="fa fa-info-circle"></i> Ayuda
                                </span>
                            </div> -->
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
                                                                :errors_form="
                                                                    errors
                                                                "
                                                                @chageRespuesta="
                                                                    registraRespuesta
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
            <div class="col-md-3 mb-4">
                <button
                    class="btn btn-success btn-block btn-flat"
                    v-html="txtBtnRegistrar"
                    @click="enviarFormulario('no')"
                    :disabled="enviando"
                ></button>
            </div>
            <div class="col-md-3 mb-4">
                <button
                    class="btn btn-warning btn-block btn-flat"
                    v-html="txtBtnOmitir"
                    @click="enviarFormulario('si')"
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
        asignacion_id: {
            type: Number,
            default: 0,
            required: true,
        },
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
                return `<i class="fa fa-paper-plane"></i> ENVIAR EXAMEN`;
            }
        },
        txtBtnOmitir() {
            if (this.enviando) {
                return `<i class="fa fa-spinner fa-spin"></i> ENVIANDO...`;
            } else {
                return `<i class="fa fa-times"></i> OMITIR EXAMEN`;
            }
        },
    },
    data() {
        return {
            errors: [],
            muestra_modal: false,
            enviando: false,
            respuestas: [],
        };
    },
    mounted() {
        setTimeout(() => {
            this.inicializarRespuestas();
        }, 300);
    },
    methods: {
        enviarFormulario(omitir) {
            let mensaje = "¿Estas seguro(a) de envíar el examen?";
            let txt_btn_enviar = "Si, enviar examen";
            if (omitir == "si") {
                mensaje =
                    "¿Estas seguro(a) de omitir el examen?<br />Esto hara que tengas un puntaje de 0";
                txt_btn_enviar = "Si, omitir examen";
            }

            Swal.fire({
                icon: "question",
                title: mensaje,
                showCancelButton: true,
                confirmButtonColor: "#03a898",
                confirmButtonText: txt_btn_enviar,
                cancelButtonText: "No, cancelar",
                denyButtonText: `No, cancelar`,
            }).then((result) => {
                if (result.isConfirmed) {
                    try {
                        this.enviando = true;
                        let url =
                            main_url +
                            "/admin/examen_nivelacions/registrar_examen_estudiante/" +
                            this.examen_nivelacion.id;
                        axios
                            .post(url, {
                                respuestas: this.respuestas,
                                asignacion_id: this.asignacion_id,
                                omitir: omitir,
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
                                    name: "examen_nivelacions.estudiantes",
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
            this.examen_nivelacion.examen_enunciados.forEach((ee) => {
                ee.enunciado_preguntas.forEach((ep) => {
                    this.respuestas.push({
                        examen_enunciado_id: ee.id,
                        enunciado_pregunta_id: ep.id,
                        respuesta: "",
                    });
                });
            });
        },

        registraRespuesta(enunciado_id, pregunta_id, valor) {
            this.respuestas.filter(
                (elem) =>
                    elem.examen_enunciado_id == enunciado_id &&
                    elem.enunciado_pregunta_id == pregunta_id
            )[0].respuesta = valor;
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
