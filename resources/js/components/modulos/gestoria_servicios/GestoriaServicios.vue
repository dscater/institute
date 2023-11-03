<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar portal - Gestoria Servicios</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 mb-2">
                        <router-link
                            :to="{ name: 'gestoria_servicios.index' }"
                            class="btn btn-default btn-flat btn-block"
                        >
                            <i class="fa fa-arrow-left"></i>
                            Volver
                        </router-link>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-dark">
                                <h4 class="card-title font-weight-bold">
                                    INFORMACIÓN DE CONTACTO
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.turismo,
                                            }"
                                            >Visa de Turismo*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Visa de Turismo"
                                            :class="{
                                                'is-invalid': errors.turismo,
                                            }"
                                            v-model="oGestoriaServicio.turismo"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.turismo"
                                            v-text="errors.turismo[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.trabajo,
                                            }"
                                            >Visa de Trabajo*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Visa de Trabajo"
                                            :class="{
                                                'is-invalid': errors.trabajo,
                                            }"
                                            v-model="oGestoriaServicio.trabajo"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.trabajo"
                                            v-text="errors.trabajo[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.estudiantes,
                                            }"
                                            >Visa de Estudiantes*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Visa de Estudiantes"
                                            :class="{
                                                'is-invalid':
                                                    errors.estudiantes,
                                            }"
                                            v-model="
                                                oGestoriaServicio.estudiantes
                                            "
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.estudiantes"
                                            v-text="errors.estudiantes[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.renovacion,
                                            }"
                                            >Visa de Renovación*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Visa de Renovación"
                                            :class="{
                                                'is-invalid': errors.renovacion,
                                            }"
                                            v-model="
                                                oGestoriaServicio.renovacion
                                            "
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.renovacion"
                                            v-text="errors.renovacion[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <hr />
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.mensaje_servicio,
                                            }"
                                            >Mensaje al final del formulario de
                                            registro*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Mensaje al final del formulario de registro"
                                            :class="{
                                                'is-invalid':
                                                    errors.mensaje_servicio,
                                            }"
                                            v-model="
                                                oGestoriaServicio.mensaje_servicio
                                            "
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.mensaje_servicio"
                                            v-text="errors.mensaje_servicio[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="col-md-3">
                                    <button
                                        class="btn btn-success btn-flat btn-block"
                                        @click="actualizaInformacion()"
                                    >
                                        <i class="fa fa-save"></i> Guardar
                                        cambios
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    components: {},
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
            oGestoriaServicio: {
                turismo: "",
                trabajo: "",
                estudiantes: "",
                renovacion: "",
                mensaje_servicio: "",
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getGestoriaServicio();
    },
    methods: {
        getGestoriaServicio() {
            let url = main_url + "/admin/gestoria_servicios";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.gestoria_servicio) {
                    this.oGestoriaServicio = res.data.gestoria_servicio;
                }
            });
        },
        actualizaInformacion() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/gestoria_servicios";
                axios
                    .post(url, this.oGestoriaServicio)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.oGestoriaServicio = res.data.gestoria_servicio;
                        this.errors = [];
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
            } catch (e) {
                this.enviando = false;
                console.log(e);
            }
        },
    },
};
</script>

<style>
#google_map {
    height: 400px;
}
</style>
