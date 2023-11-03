<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Configurar portal > Comunicado</h1>
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
                                    COMUNICADO DE LA PÁGINA INICIAL
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.descripcion,
                                            }"
                                            >Comunicado*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Comunicado"
                                            :class="{
                                                'is-invalid':
                                                    errors.descripcion,
                                            }"
                                            v-model="
                                                oPortalComunciado.descripcion
                                            "
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.descripcion"
                                            v-text="errors.descripcion[0]"
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
            oPortalComunciado: {
                descripcion: "",
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getPortalComunicado();
    },
    methods: {
        getPortalComunicado() {
            let url = main_url + "/admin/portal_comunicados";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.portal_comunicado) {
                    this.oPortalComunciado = res.data.portal_comunicado;
                    this.oPortalComunciado.descripcion = this.reemplazaBr(
                        this.oPortalComunciado.descripcion
                    );
                }
            });
        },
        actualizaInformacion() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/portal_comunicados";
                axios
                    .post(url, this.oPortalComunciado)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.oPortalComunciado = res.data.portal_comunicado;
                        this.oPortalComunciado.descripcion = this.reemplazaBr(
                            this.oPortalComunciado.descripcion
                        );
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
