<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Configuración</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-3">
                                        <button
                                            v-if="
                                                permisos.includes(
                                                    'configuracion.edit'
                                                )
                                            "
                                            class="btn btn-success btn-flat btn-block"
                                            @click="muestra_modal = true"
                                        >
                                            <i class="el-icon-edit-outline"></i>
                                            Actualizar información
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="col-md-12">
                                    <el-descriptions
                                        class="mt-3"
                                        title="Información"
                                        :column="1"
                                        border
                                        :labelStyle="{
                                            background: 'rgb(0, 123, 255)',
                                            width: '180px',
                                            color: 'white',
                                        }"
                                    >
                                        <el-descriptions-item>
                                            <template slot="label">
                                                <i class="el-icon-document"></i>
                                                Nombre del sistema
                                            </template>
                                            {{ oConfiguracion.nombre_sistema }}
                                        </el-descriptions-item>
                                        <el-descriptions-item>
                                            <template slot="label">
                                                <i class="el-icon-document"></i>
                                                Alias
                                            </template>
                                            {{ oConfiguracion.alias }}
                                        </el-descriptions-item>
                                        <el-descriptions-item>
                                            <template slot="label">
                                                <i
                                                    class="el-icon-map-location"
                                                ></i>
                                                Dirección
                                            </template>
                                            {{ oConfiguracion.dir }}
                                        </el-descriptions-item>
                                        <el-descriptions-item>
                                            <template slot="label">
                                                <i class="el-icon-document"></i>
                                                Actividad
                                            </template>
                                            {{ oConfiguracion.actividad }}
                                        </el-descriptions-item>
                                        <el-descriptions-item>
                                            <template slot="label">
                                                <i
                                                    class="el-icon-picture-outline-round"
                                                ></i>
                                                Logo
                                            </template>
                                            <img
                                                :src="oConfiguracion.path_image"
                                                style="height: 120px"
                                            />
                                        </el-descriptions-item>
                                    </el-descriptions>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Envío de correos</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <!-- <div class="col-md-12 form-group">
                                        <label>Driver*:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            v-model="oEnvioCorreo.driver"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.driver"
                                            v-text="errors.driver[0]"
                                        ></span>
                                    </div> -->
                                    <div class="col-md-12 form-group">
                                        <label>Host*:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            v-model="oEnvioCorreo.host"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.host"
                                            v-text="errors.host[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Puerto*:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            v-model="oEnvioCorreo.puerto"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.puerto"
                                            v-text="errors.puerto[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Encriptado*:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            v-model="oEnvioCorreo.encryptado"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.encryptado"
                                            v-text="errors.encryptado[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Correo*:</label>
                                        <input
                                            type="email"
                                            class="form-control"
                                            v-model="oEnvioCorreo.correo"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.correo"
                                            v-text="errors.correo[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Nombre*:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            v-model="oEnvioCorreo.nombre"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.nombre"
                                            v-text="errors.nombre[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Contraseña*:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            v-model="oEnvioCorreo.password"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.password"
                                            v-text="errors.password[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-3">
                                        <button
                                            class="btn btn-success btn-flat btn-block"
                                            @click="actualizarEnvioCorreo"
                                        >
                                            <i class="fa fa-edit"></i>
                                            Actualizar información
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div
            class="modal fade"
            :class="{ show: muestra_modal }"
            id="modal-default"
            aria-modal="true"
            role="dialog"
            @click.self="cierraModal"
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
                                            'text-danger':
                                                errors.nombre_sistema,
                                        }"
                                        >Nombre del Sistema*</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        :class="{
                                            'is-invalid': errors.nombre_sistema,
                                        }"
                                        placeholder="Nombre del sistema"
                                        v-model="oConfiguracion.nombre_sistema"
                                    />
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.nombre_sistema"
                                        v-text="errors.nombre_sistema[0]"
                                    ></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label
                                        :class="{ 'text-danger': errors.alias }"
                                        >Alias*</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        :class="{
                                            'is-invalid': errors.alias,
                                        }"
                                        placeholder="Alias"
                                        v-model="oConfiguracion.alias"
                                    />
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.alias"
                                        v-text="errors.alias[0]"
                                    ></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label
                                        :class="{
                                            'text-danger': errors.dir,
                                        }"
                                        >Dirección</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        :class="{ 'is-invalid': errors.dir }"
                                        placeholder="Dirección"
                                        v-model="oConfiguracion.dir"
                                    />
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.dir"
                                        v-text="errors.dir[0]"
                                    ></span>
                                </div>

                                <div class="form-group col-md-6">
                                    <label
                                        :class="{
                                            'text-danger': errors.actividad,
                                        }"
                                        >Actividad*</label
                                    >
                                    <input
                                        type="text"
                                        class="form-control"
                                        :class="{
                                            'is-invalid': errors.actividad,
                                        }"
                                        placeholder="Alias"
                                        v-model="oConfiguracion.actividad"
                                    />
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.actividad"
                                        v-text="errors.actividad[0]"
                                    ></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label
                                        :class="{ 'text-danger': errors.logo }"
                                        >Logo</label
                                    >
                                    <input
                                        type="file"
                                        class="form-control"
                                        :class="{
                                            'is-invalid': errors.logo,
                                        }"
                                        ref="input_file"
                                        @change="getFile"
                                    />
                                    <span
                                        class="error invalid-feedback"
                                        v-if="errors.logo"
                                        v-text="errors.logo[0]"
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
                            >{{ textoBtn }}</el-button
                        >
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            permisos: localStorage.getItem("permisos"),
            muestra_modal: false,
            // config table
            loading: false,
            // Fin config table

            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            // config modal
            tituloModal: "ACTUALIZAR INFORMACIÓN",
            accion: "edit",
            textoBtn: "Actualizar",
            enviando: false,
            oConfiguracion: {
                id: 0,
                nombre_sistema: "",
                alias: "",
                dir: "",
                actividad: "",
                logo: "",
            },
            oEnvioCorreo: {
                host: "",
                puerto: "",
                encryptado: "",
                correo: "",
                nombre: "",
                password: "",
                driver: "",
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getConfiguracion();
        this.getEnvioCorreo();
    },
    methods: {
        getEnvioCorreo() {
            axios.get(main_url + "/admin/envio_correos").then((response) => {
                if (response.data.envio_correo) {
                    this.oEnvioCorreo = response.data.envio_correo;
                }
            });
        },
        actualizarEnvioCorreo() {
            axios
                .post(main_url + "/admin/envio_correos", this.oEnvioCorreo)
                .then((response) => {
                    Swal.fire({
                        icon: "success",
                        title: response.data.msj,
                        showConfirmButton: false,
                        timer: 1500,
                    });
                })
                .catch((error) => {
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
        },

        getFile(e) {
            this.oConfiguracion.logo = e.target.files[0];
        },
        // Listar Usuarios
        getConfiguracion() {
            this.loading = true;
            let url = main_url + "/configuracion/getConfiguracion";
            axios.get(url).then((res) => {
                this.oConfiguracion = res.data.configuracion;
            });
        },
        // Dialog/modal
        cierraModal() {
            this.muestra_modal = false;
            this.getConfiguracion();
        },
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/configuracion/update";
                let formdata = new FormData();
                formdata.append(
                    "nombre_sistema",
                    this.oConfiguracion.nombre_sistema
                );
                formdata.append("alias", this.oConfiguracion.alias);
                formdata.append("dir", this.oConfiguracion.dir);
                formdata.append("actividad", this.oConfiguracion.actividad);
                formdata.append("logo", this.oConfiguracion.logo);

                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };

                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        this.getConfiguracion();
                        this.enviando = false;
                        this.muestra_modal = false;
                        // emitir evento
                        EventBus.$emit(
                            "configuracionActualizada",
                            JSON.stringify(res.data.configuracion)
                        );
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });

                        this.limpiarConfiguracion();
                        this.errors = [];
                        this.$refs.input_file.value = null;
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Actualizar";
                        }
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Actualizar";
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
        limpiarConfiguracion() {
            this.accion = "create";
            this.textoBtn = "Actualizar";
            this.oConfiguracion.nombre_sistema = "";
            this.oConfiguracion.alias = "";
            this.oConfiguracion.dir = "";
            this.oConfiguracion.actividad = "";
            this.oConfiguracion.logo = "";
        },
    },
};
</script>

<style>
.el-descriptions-item__cell.el-descriptions-item__label.is-bordered-label {
    background: var(--success) !important;
}
</style>
