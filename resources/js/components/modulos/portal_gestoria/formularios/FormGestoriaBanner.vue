<template>
    <div
        class="modal fade formulario_gestoria_banner"
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
                                        'text-danger': errors.img,
                                    }"
                                    >Seleccionar imagen (1920 x 860)*</label
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.img,
                                    }"
                                    ref="input_file"
                                    @change="cargaImagen"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.img"
                                    v-text="errors.img[0]"
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
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.posicion,
                                    }"
                                    >Posición*</label
                                >
                                <input
                                    type="number"
                                    min="1"
                                    placeholder="Posición"
                                    class="form-control"
                                    :class="{ 'is-invalid': errors.posicion }"
                                    v-model="gestoria_banner.posicion"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.posicion"
                                    v-text="errors.posicion[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label
                                    :class="{
                                        'text-danger': errors.titulo,
                                    }"
                                    >Título</label
                                >
                                <el-input
                                    placeholder="Título"
                                    :class="{ 'is-invalid': errors.titulo }"
                                    v-model="gestoria_banner.titulo"
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
                                        'text-danger': errors.descripcion,
                                    }"
                                    >Descripción</label
                                >
                                <el-input
                                    placeholder="Descripción"
                                    :class="{
                                        'is-invalid': errors.descripcion,
                                    }"
                                    v-model="gestoria_banner.descripcion"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.descripcion"
                                    v-text="errors.descripcion[0]"
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
        gestoria_banner: {
            type: Object,
            default: {
                img: null,
                url_img: "",
                posicion: 1,
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
                    console.log(this.gestoria_banner);
                    setTimeout(function () {
                        self.src_imagen_cargada = self.gestoria_banner.url_img;
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
                return "AGREGAR BANNER";
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
                let url = main_url + "/admin/gestoria_banners";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "img",
                    this.gestoria_banner.img ? this.gestoria_banner.img : ""
                );
                formdata.append(
                    "posicion",
                    this.gestoria_banner.posicion
                        ? this.gestoria_banner.posicion
                        : ""
                );
                formdata.append(
                    "titulo",
                    this.gestoria_banner.titulo
                        ? this.gestoria_banner.titulo
                        : ""
                );
                formdata.append(
                    "descripcion",
                    this.gestoria_banner.descripcion
                        ? this.gestoria_banner.descripcion
                        : ""
                );
                if (this.accion == "edit") {
                    url =
                        main_url +
                        "/admin/gestoria_banners/" +
                        this.gestoria_banner.id;
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
                        this.limpiaGestoriaBanner();
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
                this.gestoria_banner.img = file;
                this.src_imagen_cargada = URL.createObjectURL(file);
            } else {
                if (this.gestoria_banner.url_img) {
                    this.src_imagen_cargada = this.gestoria_banner.url_img;
                } else {
                    this.gestoria_banner.img = null;
                    this.src_imagen_cargada = "";
                }
            }
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaGestoriaBanner() {
            this.errors = [];
            this.gestoria_banner.img = null;
            this.gestoria_banner.posicion = "";
            this.gestoria_banner.titulo = "";
            this.gestoria_banner.descripcion = "";
            this.$refs.input_file.value = null;
            this.src_imagen_cargada = "";
        },
    },
};
</script>

<style>
.formulario_gestoria_banner .contenedor_imagen {
    display: flex;
    min-height: 100px;
}
.formulario_gestoria_banner .contenedor_imagen .imagen {
    height: 100%;
    width: 100%;
}

.formulario_gestoria_banner .contenedor_imagen .imagen img {
    width: 100%;
}

.formulario_gestoria_banner .contenedor_imagen .imagen .vacio {
    height: 100px;
    width: 100%;
    background: gray;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
}

.formulario_gestoria_banner .contenedor_imagen .imagen .desc1 {
    max-width: 50%;
    word-wrap: break-word;
    position: absolute;
    bottom: 60px;
    left: 30px;
    text-transform: capitalize;
}
.formulario_gestoria_banner .contenedor_imagen .imagen .desc2 {
    max-width: 50%;
    word-wrap: break-word;
    position: absolute;
    bottom: 40px;
    left: 30px;
    text-transform: uppercase;
    font-weight: bold;
}
.formulario_gestoria_banner .contenedor_imagen .imagen .boton_comprar {
    position: absolute;
    bottom: 10px;
    left: 30px;
}

.formulario_gestoria_banner .contenedor_imagen .imagen .boton_comprar button {
    border-radius: 30px;
}
</style>
