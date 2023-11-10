<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Configurar portal > Información Gestoría</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 mb-2">
                        <router-link
                            :to="{ name: 'admin_portal.index' }"
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
                                    INFORMACIÓN DE GESTORÍA
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.titulo_inicio,
                                            }"
                                            >Título*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Título"
                                            :class="{
                                                'is-invalid':
                                                    errors.titulo_inicio,
                                            }"
                                            v-model="
                                                oPortalGestoria.titulo_inicio
                                            "
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.titulo_inicio"
                                            v-text="errors.titulo_inicio[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.descripcion_inicio,
                                            }"
                                            >Descripción*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Descripción"
                                            :class="{
                                                'is-invalid':
                                                    errors.descripcion_inicio,
                                            }"
                                            v-model="
                                                oPortalGestoria.descripcion_inicio
                                            "
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.descripcion_inicio"
                                            v-text="
                                                errors.descripcion_inicio[0]
                                            "
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.imagen_inicio,
                                            }"
                                            >Imagen (945 x 720)</label
                                        >
                                        <input
                                            type="file"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors.imagen_inicio,
                                            }"
                                            ref="input_file"
                                            @change="cargaImagen"
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.imagen_inicio"
                                            v-text="errors.imagen_inicio[0]"
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
            oPortalGestoria: {
                imagen_inicio: null,
                titulo_inicio: "",
                descripcion_inicio: "",
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getPortalGestoria();
    },
    methods: {
        getPortalGestoria() {
            let url = main_url + "/admin/portal_gestorias";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.portal_gestoria) {
                    this.oPortalGestoria = res.data.portal_gestoria;
                }
            });
        },
        actualizaInformacion() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/portal_gestorias";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "titulo_inicio",
                    this.oPortalGestoria.titulo_inicio
                        ? this.oPortalGestoria.titulo_inicio
                        : ""
                );
                formdata.append(
                    "descripcion_inicio",
                    this.oPortalGestoria.descripcion_inicio
                        ? this.oPortalGestoria.descripcion_inicio
                        : ""
                );
                formdata.append(
                    "imagen_inicio",
                    this.oPortalGestoria.imagen_inicio
                        ? this.oPortalGestoria.imagen_inicio
                        : ""
                );
                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.oPortalGestoria = res.data.portal_gestoria;
                        this.$refs.input_file.value = "";
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
        cargaImagen(e) {
            this.oPortalGestoria.imagen_inicio = e.target.files[0];
        },
    },
};
</script>

<style>
#google_map {
    height: 400px;
}
</style>
