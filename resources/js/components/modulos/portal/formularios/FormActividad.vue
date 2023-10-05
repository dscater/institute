<template>
    <div
        class="modal fade formulario_actividad"
        :class="{ show: bModal }"
        id="modal-default"
        aria-modal="true"
        role="dialog"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning">
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
                                        'text-danger': errors.descripcion,
                                    }"
                                    >Descripción</label
                                >
                                <el-input
                                    type="textarea"
                                    placeholder="Descripción"
                                    :class="{
                                        'is-invalid': errors.descripcion,
                                    }"
                                    v-model="actividad.descripcion"
                                    autosize
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.descripcion"
                                    v-text="errors.descripcion[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.imagen,
                                    }"
                                    >Seleccionar imagen*</label
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.imagen,
                                    }"
                                    ref="input_file"
                                    @change="cargaImagen"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.imagen"
                                    v-text="errors.imagen[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <div class="contenedor_imagen">
                                    <div class="imagen">
                                        <img
                                            :src="src_imagen_cargada"
                                            alt="Imagen"
                                            v-if="src_imagen_cargada != ''"
                                        />
                                        <div class="vacio" v-else>
                                            Seleccioné una imagen
                                        </div>
                                    </div>
                                </div>
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
                        type="warning"
                        class="bg-warning"
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
        actividad: {
            type: Object,
            default: {
                img: null,
                url_imagen: "",
                descripcion: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                this.$refs.input_file.value = null;
                this.bModal = true;
                if (this.accion == "edit") {
                    let self = this;
                    console.log(this.actividad);
                    setTimeout(function () {
                        self.src_imagen_cargada = self.actividad.url_imagen;
                    }, 300);
                }
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "AGREGAR ACTIVIDAD";
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
            src_imagen_cargada: "",
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
    },
    methods: {
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/actividads";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "imagen",
                    this.actividad.imagen ? this.actividad.imagen : ""
                );
                formdata.append(
                    "descripcion",
                    this.actividad.descripcion ? this.actividad.descripcion : ""
                );
                if (this.accion == "edit") {
                    url = main_url + "/admin/actividads/" + this.actividad.id;
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
                        this.limpiaActividad();
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
        cargaImagen(e) {
            const file = e.target.files[0];
            if (file) {
                this.actividad.imagen = file;
                this.src_imagen_cargada = URL.createObjectURL(file);
            } else {
                if (this.actividad.url_imagen) {
                    this.src_imagen_cargada = this.actividad.url_imagen;
                } else {
                    this.actividad.imagen = null;
                    this.src_imagen_cargada = "";
                }
            }
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaActividad() {
            this.errors = [];
            this.actividad.imagen = null;
            this.actividad.descripcion = "";
            this.$refs.input_file.value = null;
            this.src_imagen_cargada = "";
        },
    },
};
</script>

<style>
.formulario_actividad .contenedor_imagen {
    display: flex;
    min-height: 100px;
}
.formulario_actividad .contenedor_imagen .imagen {
    height: 100%;
    width: 100%;
}

.formulario_actividad .contenedor_imagen .imagen img {
    width: 100%;
}

.formulario_actividad .contenedor_imagen .imagen .vacio {
    height: 100px;
    width: 100%;
    background: gray;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
}
</style>
