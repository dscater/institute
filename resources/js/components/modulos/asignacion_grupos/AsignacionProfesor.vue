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
                                        'text-danger': errors.profesor_id,
                                    }"
                                    >Seleccionar profesor*</label
                                >
                                <el-select
                                    placeholder="Seleccionar profesor"
                                    class="d-block"
                                    :class="{
                                        'is-invalid': errors.profesor_id,
                                    }"
                                    v-model="grupo_profesor.profesor_id"
                                    clearable
                                    filterable
                                >
                                    <el-option
                                        v-for="item in listProfesors"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.full_name"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.profesor_id"
                                    v-text="errors.profesor_id[0]"
                                ></span>
                            </div>
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
                                    v-model="grupo_profesor.grupo_id"
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
        grupo_profesor: {
            type: Object,
            default: {
                user_id: "",
                profesor_id: "",
                grupo_id: "",
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
            listProfesors: [],
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
        this.getGruposActivos();
        this.getProfesors();
    },
    methods: {
        getGruposActivos() {
            axios.get(main_url + "/admin/grupos/activos").then((response) => {
                this.listGrupos = response.data.grupos;
            });
        },
        getProfesors() {
            axios.get(main_url + "/admin/profesors").then((response) => {
                this.listProfesors = response.data.profesors;
            });
        },

        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/grupo_profesors";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "grupo_id",
                    this.grupo_profesor.grupo_id
                        ? this.grupo_profesor.grupo_id
                        : ""
                );
                formdata.append(
                    "profesor_id",
                    this.grupo_profesor.profesor_id
                        ? this.grupo_profesor.profesor_id
                        : ""
                );
                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/grupo_profesors/" +
                        this.grupo_profesor.id;
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
                        this.limpiaGrupoProfesor();
                        this.$emit("envioModal");
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
        limpiaGrupoProfesor() {
            this.errors = [];
            this.grupo_profesor.grupo_id = "";
            this.grupo_profesor.profesor_id = "";
            this.grupo_profesor.user_id = "";
        },
    },
};
</script>

<style></style>
