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
                                    v-model="grupo_recurso.grupo_id"
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
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.titulo,
                                    }"
                                    >Título*</label
                                >
                                <el-input
                                    placeholder="Título"
                                    :class="{ 'is-invalid': errors.titulo }"
                                    v-model="grupo_recurso.titulo"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.titulo"
                                    v-text="errors.titulo[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.link,
                                    }"
                                    >Link*</label
                                >
                                <el-input
                                    placeholder="Link"
                                    :class="{ 'is-invalid': errors.link }"
                                    v-model="grupo_recurso.link"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.link"
                                    v-text="errors.link[0]"
                                ></span>
                            </div>
                            <!-- <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fecha,
                                    }"
                                    >Fecha*</label
                                >
                                <input
                                    type="date"
                                    placeholder="Fecha"
                                    class="form-control"
                                    :class="{ 'is-invalid': errors.fecha }"
                                    v-model="grupo_recurso.fecha"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fecha"
                                    v-text="errors.fecha[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.hora,
                                    }"
                                    >Hora*</label
                                >
                                <input
                                    type="time"
                                    placeholder="Hora"
                                    class="form-control"
                                    :class="{ 'is-invalid': errors.hora }"
                                    v-model="grupo_recurso.hora"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.hora"
                                    v-text="errors.hora[0]"
                                ></span>
                            </div> -->
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
        grupo_recurso: {
            type: Object,
            default: {
                grupo_id: "",
                titulo: "",
                link: "",
                fecha: "",
                hora: "",
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
                return "NUEVO REGISTRO";
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
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
        this.getGruposUser();
    },
    methods: {
        getGruposUser() {
            axios
                .get(main_url + "/admin/grupos/grupo_users")
                .then((response) => {
                    this.listGrupos = response.data.grupos;
                });
        },
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/grupo_recursos";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "grupo_id",
                    this.grupo_recurso.grupo_id
                        ? this.grupo_recurso.grupo_id
                        : ""
                );
                formdata.append(
                    "titulo",
                    this.grupo_recurso.titulo ? this.grupo_recurso.titulo : ""
                );
                formdata.append(
                    "link",
                    this.grupo_recurso.link ? this.grupo_recurso.link : ""
                );
                // formdata.append(
                //     "fecha",
                //     this.grupo_recurso.fecha ? this.grupo_recurso.fecha : ""
                // );
                // formdata.append(
                //     "hora",
                //     this.grupo_recurso.hora ? this.grupo_recurso.hora : ""
                // );

                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/grupo_recursos/" +
                        this.grupo_recurso.id;
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
                        this.limpiaGrupoRecurso();
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
        limpiaGrupoRecurso() {
            this.errors = [];
            this.grupo_recurso.grupo_id = "";
            this.grupo_recurso.titulo = "";
            this.grupo_recurso.link = "";
            this.grupo_recurso.fecha = "";
            this.grupo_recurso.hora = "";
        },
    },
};
</script>

<style></style>
