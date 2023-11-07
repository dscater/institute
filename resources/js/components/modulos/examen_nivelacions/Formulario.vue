<template>
    <div class="col-md-12 mt-2">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.curso_id,
                                    }"
                                    >Seleccionar curso:</label
                                >
                                <el-select
                                    placeholder="Seleccionar grupo"
                                    class="d-block"
                                    :class="{ 'is-invalid': errors.curso_id }"
                                    v-model="examen_nivelacion.curso_id"
                                    clearable
                                    filterable
                                >
                                    <el-option
                                        v-for="item in listCursos"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.nombre"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.curso_id"
                                    v-text="errors.curso_id[0]"
                                ></span>
                                <hr />
                            </div>
                            <div class="col-md-12">
                                <h4
                                    class="w-100 text-center"
                                    v-text="tituloExamen"
                                ></h4>
                            </div>
                            <div class="col-md-12">
                                <span
                                    class="cursor-pointer"
                                    @click="muestra_modal = true"
                                >
                                    <i class="fa fa-info-circle"></i> Ayuda
                                </span>
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
                                                        <div
                                                            class="input-group"
                                                        >
                                                            <span
                                                                class="input-group-text rounded-0 bg-primary border-primary"
                                                                v-text="
                                                                    index + 1
                                                                "
                                                            >
                                                            </span>
                                                            <input
                                                                type="text"
                                                                class="form-control rounded-0"
                                                                :class="{
                                                                    'is-invalid':
                                                                        errors[
                                                                            'examen_enunciados_' +
                                                                                index
                                                                        ],
                                                                }"
                                                                placeholder="Enunciado..."
                                                                v-model="
                                                                    item.enunciado
                                                                "
                                                            />
                                                            <button
                                                                class="btn btn-danger rounded-0"
                                                                type="button"
                                                                @click="
                                                                    eliminarEnunciado(
                                                                        index,
                                                                        item.id
                                                                    )
                                                                "
                                                            >
                                                                <i
                                                                    class="fa fa-trash"
                                                                ></i>
                                                            </button>
                                                        </div>
                                                        <div class="row">
                                                            <div
                                                                class="col-2"
                                                                v-for="item_tipo in listTipoPreguntas"
                                                            >
                                                                <p
                                                                    class="text-sm w-100 d-flex align-center cursor-pointer"
                                                                    @click="
                                                                        aplicaCambioTipoPregunta(
                                                                            index,
                                                                            item_tipo
                                                                        )
                                                                    "
                                                                >
                                                                    <input
                                                                        type="radio"
                                                                        class="mr-1"
                                                                        :name="
                                                                            'tipo_' +
                                                                            index
                                                                        "
                                                                        :value="
                                                                            item_tipo
                                                                        "
                                                                        v-model="
                                                                            item.tipo
                                                                        "
                                                                    />
                                                                    {{
                                                                        item_tipo
                                                                    }}
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 pl-4">
                                                        <a
                                                            href="#"
                                                            @click.prevent="
                                                                agregarPregunta(
                                                                    index
                                                                )
                                                            "
                                                            ><i
                                                                class="fa fa-plus"
                                                            ></i>
                                                            Agregar pregunta</a
                                                        >
                                                    </div>
                                                    <div
                                                        class="col-md-12 pl-4 pt-2"
                                                        v-for="(
                                                            pregunta,
                                                            index_pregunta
                                                        ) in item.enunciado_preguntas"
                                                    >
                                                        <div class="row">
                                                            <Pregunta
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
                                                                @eliminado="
                                                                    eliminarPregunta
                                                                "
                                                            ></Pregunta>
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
                            <div class="col-md-12">
                                <button
                                    class="btn btn-outline-primary btn-block btn-flat"
                                    @click="agregarEnunciado"
                                >
                                    <i class="fa fa-plus"></i> AGREGAR ENUNCIADO
                                </button>
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
import Pregunta from "./Pregunta.vue";
export default {
    components: {
        Pregunta,
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
                examen_enunciados: [],
                eliminados_enunciados: [],
                eliminados_preguntas: [],
            },
        },
    },

    computed: {
        tituloExamen() {
            if (this.examen_nivelacion.curso_id != "") {
                let nom_curso = this.listCursos.filter(
                    (elem) => elem.id === this.examen_nivelacion.curso_id
                )[0].nombre;
                return "EXÁMEN DE NIVELACIÓN - " + nom_curso;
            }
            return "EXÁMEN DE NIVELACIÓN...";
        },
        txtBtnRegistrar() {
            if (this.enviando) {
                return `<i class="fa fa-spinner fa-spin"></i> ENVIANDO...`;
            } else {
                if (this.accion == "nuevo") {
                    return `<i class="fa fa-save"></i> REGISTRAR EXAMEN`;
                } else {
                    return `<i class="fa fa-sync"></i> ACTUALIZAR EXAMEN`;
                }
            }
        },
    },
    data() {
        return {
            errors: [],
            muestra_modal: false,
            enviando: false,
            listCursos: [],
            eliminados_enunciados: [],
            eliminados_preguntas: [],
            listTipoPreguntas: [
                "LLENADO",
                "SELECCIÓN",
                "LLENADO INTERMEDIO",
                "LLENADO INTERMEDIO CON OPCIONES",
                "ELIGE UNA OPCIÓN",
                "LLENADO DOBLE INTERMEDIO CON OPCIONES",
            ],
        };
    },
    mounted() {
        this.getCursos();
    },
    methods: {
        getCursos() {
            axios.get(main_url + "/admin/cursos").then((response) => {
                this.listCursos = response.data.cursos;
            });
        },
        enviarFormulario() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/examen_nivelacions";
                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/examen_nivelacions/" +
                        this.examen_nivelacion.id;
                    this.examen_nivelacion["_method"] = "PUT";
                    this.examen_nivelacion["eliminados_enunciados"] =
                        this.eliminados_enunciados;
                    this.examen_nivelacion["eliminados_preguntas"] =
                        this.eliminados_preguntas;
                }
                axios
                    .post(url, this.examen_nivelacion)
                    .then((res) => {
                        this.enviando = false;
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.$router.push({ name: "examen_nivelacions.index" });
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
                                this.errors = error.response.data.errors;
                                let mensaje = `<ul class="text-left">`;
                                for (let key in this.errors) {
                                    if (this.errors.hasOwnProperty(key)) {
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
        },

        // ENUNCIADOS
        agregarEnunciado() {
            this.examen_nivelacion.examen_enunciados.push({
                id: 0,
                examen_nivelacion_id: 0,
                enunciado: "",
                tipo: "LLENADO",
                enunciado_preguntas: [],
            });
        },
        eliminarEnunciado(index, id) {
            if (id != 0) {
                this.eliminados_enunciados.push(id);
            }
            this.examen_nivelacion.examen_enunciados.splice(index, 1);
        },
        aplicaCambioTipoPregunta(index, tipo = "") {
            this.examen_nivelacion.examen_enunciados[index].tipo = tipo;
            this.examen_nivelacion.examen_enunciados[
                index
            ].enunciado_preguntas.forEach((elem) => {
                elem.tipo = tipo;
            });
        },
        // PREGUNTAS
        agregarPregunta(index) {
            let tipo = this.examen_nivelacion.examen_enunciados[index].tipo;

            this.examen_nivelacion.examen_enunciados[
                index
            ].enunciado_preguntas.push({
                id: 0,
                examen_enunciado_id: 0,
                pregunta: "",
                tipo: tipo,
                opciones: "",
                array_opciones: [],
            });
        },
        eliminarPregunta(index, index_pregunta, pregunta_id) {
            if (pregunta_id != 0) {
                this.eliminados_preguntas.push(pregunta_id);
            }
            this.examen_nivelacion.examen_enunciados[
                index
            ].enunciado_preguntas.splice(index_pregunta, 1);
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
