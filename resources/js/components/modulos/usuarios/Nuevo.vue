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
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.nombre,
                                    }"
                                    >Nombre*</label
                                >
                                <el-input
                                    placeholder="Nombre"
                                    :class="{ 'is-invalid': errors.nombre }"
                                    v-model="usuario.nombre"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.nombre"
                                    v-text="errors.nombre[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.paterno,
                                    }"
                                    >Ap. Paterno*</label
                                >

                                <el-input
                                    placeholder="Ap. Paterno"
                                    :class="{ 'is-invalid': errors.paterno }"
                                    v-model="usuario.paterno"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.paterno"
                                    v-text="errors.paterno[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.materno,
                                    }"
                                    >Ap. Materno</label
                                >
                                <el-input
                                    placeholder="Ap. Materno"
                                    :class="{ 'is-invalid': errors.materno }"
                                    v-model="usuario.materno"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.materno"
                                    v-text="errors.materno[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.ci,
                                    }"
                                    >C.I.*</label
                                >
                                <el-input
                                    placeholder="Número de C.I."
                                    :class="{ 'is-invalid': errors.ci }"
                                    v-model="usuario.ci"
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
                                        'text-danger': errors.ci_exp,
                                    }"
                                    >Expedido*</label
                                >
                                <el-select
                                    class="w-100 d-block"
                                    :class="{
                                        'is-invalid': errors.ci_exp,
                                    }"
                                    v-model="usuario.ci_exp"
                                    clearable
                                >
                                    <el-option
                                        v-for="(item, index) in listExpedido"
                                        :key="index"
                                        :value="item.value"
                                        :label="item.label"
                                    >
                                    </el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.ci_exp"
                                    v-text="errors.ci_exp[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fecha_nac,
                                    }"
                                    >Fecha de nacimiento*</label
                                >
                                <input
                                    type="date"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.fecha_nac,
                                    }"
                                    v-model="usuario.fecha_nac"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fecha_nac"
                                    v-text="errors.fecha_nac[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.genero,
                                    }"
                                    >Genero*</label
                                >

                                <el-input
                                    placeholder="Genero"
                                    :class="{ 'is-invalid': errors.genero }"
                                    v-model="usuario.genero"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.genero"
                                    v-text="errors.genero[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.cargo,
                                    }"
                                    >Cargo*</label
                                >

                                <el-input
                                    placeholder="Cargo"
                                    :class="{ 'is-invalid': errors.cargo }"
                                    v-model="usuario.cargo"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.cargo"
                                    v-text="errors.cargo[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fecha_ingreso,
                                    }"
                                    >Fecha de ingreso*</label
                                >
                                <input
                                    type="date"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.fecha_ingreso,
                                    }"
                                    v-model="usuario.fecha_ingreso"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fecha_ingreso"
                                    v-text="errors.fecha_ingreso[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.taller,
                                    }"
                                    >Taller al que pertenece*</label
                                >

                                <el-input
                                    placeholder="Taller al que pertenece"
                                    :class="{ 'is-invalid': errors.taller }"
                                    v-model="usuario.taller"
                                    clearable
                                >
                                </el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.taller"
                                    v-text="errors.taller[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.estado,
                                    }"
                                    >Estado*</label
                                >
                                <el-switch
                                    :class="{
                                        'is-invalid': errors.estado,
                                    }"
                                    style="display: block"
                                    v-model="usuario.estado"
                                    active-color="#13ce66"
                                    inactive-color="#ff4949"
                                    active-text="ACTIVO"
                                    inactive-text="RETIRADO"
                                    active-value="1"
                                    inactive-value="0"
                                >
                                </el-switch>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.estado"
                                    v-text="errors.estado[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fono,
                                    }"
                                    >Teléfono/Celular*</label
                                >
                                <b-form-tags
                                    input-id="tags-basic"
                                    placeholder="Teléfono/Celular"
                                    :class="{ 'is-invalid': errors.fono }"
                                    v-model="usuario.fono"
                                    addButtonText="Añadir"
                                    separator=" ,;"
                                    remove-on-delete
                                ></b-form-tags>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fono"
                                    v-text="errors.fono[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.dir,
                                    }"
                                    >Dirección*</label
                                >
                                <el-input
                                    placeholder="Dirección"
                                    :class="{ 'is-invalid': errors.dir }"
                                    v-model="usuario.dir"
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
                                        'text-danger': errors.tipo_personal,
                                    }"
                                    >Tipo de Personal*</label
                                >
                                <el-select
                                    class="w-100"
                                    :class="{
                                        'is-invalid': errors.tipo_personal,
                                    }"
                                    v-model="usuario.tipo_personal"
                                    clearable
                                >
                                    <el-option
                                        v-for="item in listTiposPersonal"
                                        :key="item"
                                        :value="item"
                                        :label="item"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.tipo_personal"
                                    v-text="errors.tipo_personal[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.p_discapacidad,
                                    }"
                                    >Porcentaje de discapacidad(%)*</label
                                >
                                <input
                                    type="number"
                                    placeholder="Porcentaje de discapacidad(%)"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.p_discapacidad,
                                    }"
                                    v-model="usuario.p_discapacidad"
                                    clearable
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.p_discapacidad"
                                    v-text="errors.p_discapacidad[0]"
                                ></span>
                            </div>
                            <div
                                class="form-group col-md-6"
                                v-show="usuario.tipo_personal == 'SOCIO'"
                            >
                                <label
                                    :class="{
                                        'text-danger': errors.tipo,
                                    }"
                                    >Tipo de Usuario*</label
                                >
                                <el-select
                                    class="w-100"
                                    :class="{
                                        'is-invalid': errors.tipo,
                                    }"
                                    v-model="usuario.tipo"
                                    clearable
                                >
                                    <el-option
                                        v-for="item in listTipos"
                                        :key="item"
                                        :value="item"
                                        :label="item"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.tipo"
                                    v-text="errors.tipo[0]"
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
                                        'text-danger':
                                            errors.validez_credencial,
                                    }"
                                    >Validez del Credencial*</label
                                >
                                <el-input
                                    placeholder="Validez del Credencial"
                                    :class="{
                                        'is-invalid': errors.validez_credencial,
                                    }"
                                    v-model="usuario.validez_credencial"
                                    clearable
                                ></el-input>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.validez_credencial"
                                    v-text="errors.validez_credencial[0]"
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
        usuario: {
            type: Object,
            default: {
                nombre: "",
                paterno: "",
                materno: "",
                ci: "",
                ci_exp: "",
                fecha_nac: "",
                genero: "",
                cargo: "",
                fecha_ingreso: "",
                taller: "",
                dir: "",
                fono: [],
                tipo_personal: "",
                p_discapacidad: "",
                tipo: "",
                foto: null,
                validez_credencial: "",
                estado: "0",
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
                return "AGREGAR PERSONAL";
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
            listTiposPersonal: ["SOCIO", "TRABAJADOR"],
            listTipos: ["ADMINISTRADOR", "REPRESENTANTE", "SOCIO"],
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
                let url = main_url + "/admin/usuarios";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "nombre",
                    this.usuario.nombre ? this.usuario.nombre : ""
                );
                formdata.append(
                    "paterno",
                    this.usuario.paterno ? this.usuario.paterno : ""
                );
                formdata.append(
                    "materno",
                    this.usuario.materno ? this.usuario.materno : ""
                );
                formdata.append("ci", this.usuario.ci ? this.usuario.ci : "");
                formdata.append(
                    "ci_exp",
                    this.usuario.ci_exp ? this.usuario.ci_exp : ""
                );
                formdata.append(
                    "fecha_nac",
                    this.usuario.fecha_nac ? this.usuario.fecha_nac : ""
                );
                formdata.append(
                    "genero",
                    this.usuario.genero ? this.usuario.genero : ""
                );
                formdata.append(
                    "cargo",
                    this.usuario.cargo ? this.usuario.cargo : ""
                );
                formdata.append(
                    "fecha_ingreso",
                    this.usuario.fecha_ingreso ? this.usuario.fecha_ingreso : ""
                );
                formdata.append(
                    "taller",
                    this.usuario.taller ? this.usuario.taller : ""
                );
                formdata.append(
                    "dir",
                    this.usuario.dir ? this.usuario.dir : ""
                );
                formdata.append(
                    "fono",
                    this.usuario.fono ? this.usuario.fono.join("; ") : ""
                );
                formdata.append(
                    "tipo_personal",
                    this.usuario.tipo_personal ? this.usuario.tipo_personal : ""
                );
                formdata.append(
                    "p_discapacidad",
                    this.usuario.p_discapacidad
                        ? this.usuario.p_discapacidad
                        : ""
                );
                formdata.append(
                    "tipo",
                    this.usuario.tipo ? this.usuario.tipo : ""
                );
                formdata.append(
                    "foto",
                    this.usuario.foto ? this.usuario.foto : ""
                );
                formdata.append(
                    "validez_credencial",
                    this.usuario.validez_credencial
                        ? this.usuario.validez_credencial
                        : ""
                );
                formdata.append(
                    "estado",
                    this.usuario.estado ? this.usuario.estado : "0"
                );

                if (this.accion == "edit") {
                    url = main_url + "/admin/usuarios/" + this.usuario.id;
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
                        this.limpiaUsuario();
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
            this.usuario.foto = e.target.files[0];
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
        limpiaUsuario() {
            this.errors = [];
            this.usuario.nombre = "";
            this.usuario.paterno = "";
            this.usuario.materno = "";
            this.usuario.ci = "";
            this.usuario.ci_exp = "";
            this.usuario.fecha_nac = "";
            this.usuario.genero = "";
            this.usuario.cargo = "";
            this.usuario.fecha_ingreso = "";
            this.usuario.taller = "";
            this.usuario.dir = "";
            this.usuario.fono = [];
            this.usuario.tipo_personal = "";
            this.usuario.p_discapacidad = "";
            this.usuario.tipo = "";
            this.usuario.foto = null;
            this.usuario.validez_credencial = "";
            this.usuario.estado = "0";
            this.$refs.input_file.value = null;
        },
    },
};
</script>

<style></style>
