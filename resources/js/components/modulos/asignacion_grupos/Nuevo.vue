<template>
    <div
        class="modal fade"
        :class="{ show: bModal }"
        id="modal-default"
        aria-modal="true"
        role="dialog"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-success">
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                    <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                        @click="cierraModal"
                    >
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.grupo_id,
                                    }"
                                    >Seleccionar grupo*</label
                                >
                                <el-select
                                    placeholder="Seleccionar grupo"
                                    class="d-block"
                                    :class="{ 'is-invalid': errors.grupo_id }"
                                    v-model="asignacion_grupo.grupo_id"
                                    clearable
                                    filterable
                                >
                                    <el-option
                                        v-for="item in listGrupos"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.nombre"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.grupo_id"
                                    v-text="errors.grupo_id[0]"
                                ></span>
                            </div>
                            <div
                                class="form-group col-md-12"
                                v-if="accion == 'nuevo'"
                            >
                                <label
                                    :class="{
                                        'text-danger':
                                            errors.inscripcion_solicitud_id,
                                    }"
                                    >Seleccionar estudiante*</label
                                >
                                <el-select
                                    placeholder="Seleccionar estudiante"
                                    class="d-block"
                                    :class="{
                                        'is-invalid':
                                            errors.inscripcion_solicitud_id,
                                    }"
                                    v-model="
                                        asignacion_grupo.inscripcion_solicitud_id
                                    "
                                    clearable
                                    filterable
                                    @change="getInscripcionSolicitud"
                                >
                                    <el-option
                                        v-for="item in listInscripcionSolicituds"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="
                                            item.id +
                                            ' - ' +
                                            item.inscripcion.full_name
                                        "
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.inscripcion_solicitud_id"
                                    v-text="errors.inscripcion_solicitud_id[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12" v-else>
                                <label
                                    :class="{
                                        'text-danger':
                                            errors.inscripcion_solicitud_id,
                                    }"
                                    >Estudiante*</label
                                >
                                <input
                                    type="text"
                                    class="form-control"
                                    readonly
                                    v-model="
                                        asignacion_grupo.inscripcion
                                            .full_name
                                    "
                                />
                            </div>
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.curso_id,
                                    }"
                                    >Seleccionar curso*</label
                                >
                                <el-select
                                    placeholder="Seleccionar curso"
                                    class="d-block"
                                    :class="{ 'is-invalid': errors.curso_id }"
                                    v-model="asignacion_grupo.curso_id"
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
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-between">
                    <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                        @click="cierraModal"
                    >
                        Cerrar
                    </button>
                    <el-button
                        type="success"
                        class="bg-success"
                        :loading="enviando"
                        @click="setRegistroModal()"
                        >{{ textoBoton }}</el-button
                    >
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        muestra_modal: {
            type: Boolean,
            default: false,
        },
        accion: {
            type: String,
            default: "nuevo",
        },
        asignacion_grupo: {
            type: Object,
            default: {
                grupo_id: "",
                inscripcion_id: "",
                inscripcion_solicitud_id: "",
                curso_id: "",
                inscripcion: null,
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                this.bModal = true;
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "NUEVA ASIGNACIÓN";
            } else {
                return "MODIFICAR REGISTRO";
            }
        },
        textoBoton() {
            if (this.accion == "nuevo") {
                return "Registrar";
            } else {
                return "Actualizar";
            }
        },
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            bModal: this.muestra_modal,
            enviando: false,
            errors: [],
            listGrupos: [],
            listInscripcionSolicituds: [],
            listCursos: [],
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
        this.getGruposActivos();
        this.getInscripcionSolicituds();
        this.getCursos();
    },
    methods: {
        getGruposActivos() {
            axios.get(main_url + "/admin/grupos/activos").then((response) => {
                this.listGrupos = response.data.grupos;
            });
        },
        getInscripcionSolicituds() {
            axios
                .get(
                    main_url +
                        "/admin/inscripcion_solicituds/aceptados_sin_asignar"
                )
                .then((response) => {
                    this.listInscripcionSolicituds =
                        response.data.inscripcion_solicituds;
                });
        },
        getCursos() {
            axios.get(main_url + "/admin/cursos").then((response) => {
                this.listCursos = response.data.cursos;
            });
        },
        getInscripcionSolicitud() {
            if (this.asignacion_grupo.inscripcion_solicitud_id != "") {
                axios
                    .get(
                        main_url +
                            "/admin/inscripcion_solicituds/" +
                            this.asignacion_grupo.inscripcion_solicitud_id
                    )
                    .then((response) => {
                        this.asignacion_grupo.curso_id =
                            response.data.inscripcion_solicitud.curso_id;
                    });
            }
        },

        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/asignacion_grupos";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "grupo_id",
                    this.asignacion_grupo.grupo_id
                        ? this.asignacion_grupo.grupo_id
                        : ""
                );
                formdata.append(
                    "inscripcion_id",
                    this.asignacion_grupo.inscripcion_id
                        ? this.asignacion_grupo.inscripcion_id
                        : ""
                );
                formdata.append(
                    "inscripcion_solicitud_id",
                    this.asignacion_grupo.inscripcion_solicitud_id
                        ? this.asignacion_grupo.inscripcion_solicitud_id
                        : ""
                );
                formdata.append(
                    "curso_id",
                    this.asignacion_grupo.curso_id
                        ? this.asignacion_grupo.curso_id
                        : ""
                );
                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/asignacion_grupos/" +
                        this.asignacion_grupo.id;
                    formdata.append("_method", "PUT");
                }
                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        this.enviando = false;
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.limpiaAsignacionGrupo();
                        this.$emit("envioModal");
                        this.getInscripcionSolicituds();
                        this.errors = [];
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
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
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaAsignacionGrupo() {
            this.errors = [];
            this.asignacion_grupo.grupo_id = "";
            this.asignacion_grupo.inscripcion_id = "";
            this.asignacion_grupo.inscripcion_solicitud_id = "";
            this.asignacion_grupo.curso_id = "";
        },
    },
};
</script>

<style></style>
