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
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.nombres,
                                    }"
                                    >Nombre completo*</label
                                >
                                <el-input
                                    placeholder="Nombre completo"
                                    :class="{ 'is-invalid': errors.nombres }"
                                    v-model="profesor.nombres"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.nombres"
                                    v-text="errors.nombres[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.apellidos,
                                    }"
                                    >Apellido completo*</label
                                >

                                <el-input
                                    placeholder="Ap. Paterno"
                                    :class="{ 'is-invalid': errors.apellidos }"
                                    v-model="profesor.apellidos"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.apellidos"
                                    v-text="errors.apellidos[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.ci,
                                    }"
                                    >CI/DNI</label
                                >
                                <el-input
                                    placeholder="CI/DNI"
                                    :class="{ 'is-invalid': errors.ci }"
                                    v-model="profesor.ci"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.ci"
                                    v-text="errors.ci[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.nacionalidad,
                                    }"
                                    >Nacionalidad</label
                                >
                                <el-input
                                    placeholder="Nacionalidad"
                                    :class="{
                                        'is-invalid': errors.nacionalidad,
                                    }"
                                    v-model="profesor.nacionalidad"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.nacionalidad"
                                    v-text="errors.nacionalidad[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.pais_residencia,
                                    }"
                                    >País de residencia actual*</label
                                >
                                <el-input
                                    placeholder="País de residencia actual"
                                    :class="{
                                        'is-invalid': errors.pais_residencia,
                                    }"
                                    v-model="profesor.pais_residencia"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.pais_residencia"
                                    v-text="errors.pais_residencia[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.dir,
                                    }"
                                    >Dirección</label
                                >
                                <el-input
                                    placeholder="Dirección"
                                    :class="{ 'is-invalid': errors.dir }"
                                    v-model="profesor.dir"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.dir"
                                    v-text="errors.dir[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fono,
                                    }"
                                    >Teléfono/Celular*</label
                                >
                                <el-input
                                    placeholder="Teléfono/Celular"
                                    :class="{ 'is-invalid': errors.fono }"
                                    v-model="profesor.fono"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fono"
                                    v-text="errors.fono[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.especialidad,
                                    }"
                                    >Especialidad*</label
                                >
                                <el-input
                                    placeholder="Especialidad"
                                    :class="{
                                        'is-invalid': errors.especialidad,
                                    }"
                                    v-model="profesor.especialidad"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.especialidad"
                                    v-text="errors.especialidad[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.correo,
                                    }"
                                    >Correo electrónico*</label
                                >
                                <el-input
                                    placeholder="Correo electrónico"
                                    :class="{ 'is-invalid': errors.correo }"
                                    v-model="profesor.correo"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.correo"
                                    v-text="errors.correo[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.password,
                                    }"
                                    >Contraseña*</label
                                >
                                <el-input
                                    placeholder="Contraseña"
                                    :class="{ 'is-invalid': errors.password }"
                                    v-model="profesor.password"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.password"
                                    v-text="errors.password[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.foto,
                                    }"
                                    >Foto</label
                                >
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.foto,
                                    }"
                                    ref="input_file"
                                    @change="cargaImagen"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.foto"
                                    v-text="errors.foto[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.acceso,
                                    }"
                                    >Acceso al sistema*</label
                                >
                                <el-switch
                                    :class="{
                                        'is-invalid': errors.acceso,
                                    }"
                                    style="display: block"
                                    v-model="profesor.acceso"
                                    active-color="#13ce66"
                                    inactive-color="#ff4949"
                                    active-text="HABILITADO"
                                    inactive-text="DESHABILITADO"
                                    active-value="1"
                                    inactive-value="0"
                                >
                                </el-switch>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.acceso"
                                    v-text="errors.acceso[0]"
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
        profesor: {
            type: Object,
            default: {
                nombres: "",
                apellidos: "",
                ci: "",
                nacionalidad: "",
                pais_residencia: "",
                dir: "",
                fono: "",
                especialidad: "",
                correo: "",
                user_id: "",
                acceso: "0",
                foto: null,
                password: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                this.$refs.input_file.value = null;
                this.bModal = true;
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "AGREGAR PROFESOR";
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
            listExpedido: [
                { value: "LP", label: "La Paz" },
                { value: "CB", label: "Cochabamba" },
                { value: "SC", label: "Santa Cruz" },
                { value: "CH", label: "Chuquisaca" },
                { value: "OR", label: "Oruro" },
                { value: "PT", label: "Potosi" },
                { value: "TJ", label: "Tarija" },
                { value: "PD", label: "Pando" },
                { value: "BN", label: "Beni" },
            ],
            listTipos: ["ADMINISTRADOR", "AUXILIAR"],
            errors: [],
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
                let url = main_url + "/admin/profesors";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "nombres",
                    this.profesor.nombres ? this.profesor.nombres : ""
                );
                formdata.append("apellidos",this.profesor.apellidos ? this.profesor.apellidos : "");
                formdata.append("ci",this.profesor.ci ? this.profesor.ci : "");
                formdata.append("nacionalidad",this.profesor.nacionalidad ? this.profesor.nacionalidad : "");
                formdata.append("pais_residencia",this.profesor.pais_residencia ? this.profesor.pais_residencia : "");
                formdata.append("dir",this.profesor.dir ? this.profesor.dir : "");
                formdata.append("fono",this.profesor.fono ? this.profesor.fono : "");
                formdata.append("especialidad",this.profesor.especialidad ? this.profesor.especialidad : "");
                formdata.append("correo",this.profesor.correo ? this.profesor.correo : "");
                formdata.append("user_id",this.profesor.user_id ? this.profesor.user_id : "");
                formdata.append("acceso",this.profesor.acceso ? this.profesor.acceso : "");
                formdata.append("foto",this.profesor.foto ? this.profesor.foto : "");
                
                formdata.append(
                    "password",
                    this.profesor.password ? this.profesor.password : ""
                );

                if (this.accion == "edit") {
                    url = main_url + "/admin/profesors/" + this.profesor.id;
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
                        this.limpiaProfesor();
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
            this.profesor.foto = e.target.files[0];
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaProfesor() {
            this.errors = [];
            this.profesor.nombre = "";
            this.profesor.paterno = "";
            this.profesor.materno = "";
            this.profesor.dir = "";
            this.profesor.correo = "";
            this.profesor.fono = "";
            this.profesor.tipo = "";
            this.profesor.foto = null;
            this.profesor.acceso = "0";
            this.profesor.password = "";
            this.$refs.input_file.value = null;
        },
    },
};
</script>

<style></style>
