<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Configurar portal > Redes Sociales</h1>
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
                                    REDES SOCIALES
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.tiktok,
                                            }"
                                            >Tiktok</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Tiktok"
                                            :class="{
                                                'is-invalid': errors.tiktok,
                                            }"
                                            v-model="oRedSocial.tiktok"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.tiktok"
                                            v-text="errors.tiktok[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.facebook,
                                            }"
                                            >Facebook</label
                                        >
                                        <el-input
                                            placeholder="Facebook"
                                            :class="{
                                                'is-invalid': errors.facebook,
                                            }"
                                            v-model="oRedSocial.facebook"
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.facebook"
                                            v-text="errors.facebook[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.instagram,
                                            }"
                                            >Instagram</label
                                        >
                                        <el-input
                                            placeholder="Instagram"
                                            :class="{
                                                'is-invalid': errors.instagram,
                                            }"
                                            v-model="oRedSocial.instagram"
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.instagram"
                                            v-text="errors.instagram[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger': errors.youtube,
                                            }"
                                            >Youtube</label
                                        >
                                        <el-input
                                            placeholder="Instagram"
                                            :class="{
                                                'is-invalid': errors.youtube,
                                            }"
                                            v-model="oRedSocial.youtube"
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.youtube"
                                            v-text="errors.youtube[0]"
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
            oRedSocial: {
                tiktok: "",
                facebook: "",
                instagram: "",
                youtube: "",
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getRedSocial();
    },
    methods: {
        getRedSocial() {
            let url = main_url + "/admin/red_socials";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.red_social) {
                    this.oRedSocial = res.data.red_social;
                }
            });
        },
        actualizaInformacion() {
            this.enviando = true;
            try {
                let url = main_url + "/admin/red_socials";
                axios
                    .post(url, this.oRedSocial)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.oRedSocial = res.data.red_social;
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

<style></style>
