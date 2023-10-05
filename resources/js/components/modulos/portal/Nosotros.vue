<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar portal - Nosotros</h1>
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
                                    HISTORIA
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <el-input
                                            type="textarea"
                                            placeholder="Historia"
                                            :class="{
                                                'is-invalid': errors.historia,
                                            }"
                                            v-model="oNosotros.historia"
                                            autosize
                                        >
                                            >
                                        </el-input>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="col-md-3">
                                    <button
                                        class="btn btn-warning btn-flat btn-block"
                                        @click="
                                            actualizaInformacion('historia')
                                        "
                                    >
                                        <i class="fa fa-save"></i> Guardar
                                        cambios
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-dark">
                                <h4 class="card-title font-weight-bold">
                                    MISIÓN
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <el-input
                                            type="textarea"
                                            placeholder="Misión"
                                            :class="{
                                                'is-invalid': errors.mision,
                                            }"
                                            v-model="oNosotros.mision"
                                            autosize
                                        >
                                            >
                                        </el-input>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="col-md-3">
                                    <button
                                        class="btn btn-warning btn-flat btn-block"
                                        @click="actualizaInformacion('mision')"
                                    >
                                        <i class="fa fa-save"></i> Guardar
                                        cambios
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-dark">
                                <h4 class="card-title font-weight-bold">
                                    VISIÓN
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <el-input
                                            type="textarea"
                                            placeholder="Visión"
                                            :class="{
                                                'is-invalid': errors.vision,
                                            }"
                                            v-model="oNosotros.vision"
                                            autosize
                                        >
                                            >
                                        </el-input>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="col-md-3">
                                    <button
                                        class="btn btn-warning btn-flat btn-block"
                                        @click="actualizaInformacion('vision')"
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
            oNosotros: {
                historia: "",
                mision: "",
                vision: "",
            },
            errors: [],
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getNosotros();
    },
    methods: {
        getNosotros() {
            let url = main_url + "/admin/nosotros";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.nosotros) {
                    this.oNosotros = res.data.nosotros;
                }
            });
        },
        actualizaInformacion(col) {
            this.enviando = true;
            try {
                let url = main_url + "/admin/nosotros";
                let formdata = new FormData();
                formdata.append("col", col);
                formdata.append(
                    "historia",
                    this.oNosotros.historia ? this.oNosotros.historia : ""
                );
                formdata.append(
                    "mision",
                    this.oNosotros.mision ? this.oNosotros.mision : ""
                );
                formdata.append(
                    "vision",
                    this.oNosotros.vision ? this.oNosotros.vision : ""
                );
                axios
                    .post(url, formdata)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.oNosotros[col] = res.data.nosotros[col];
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
