<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar portal - Plan de Pagos</h1>
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
                            <div class="card-header bg-dark rounded-0">
                                <h4 class="card-title font-weight-bold">
                                    PLAN #1
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors?.plan_mensual
                                                        ?.titulo,
                                            }"
                                            >Titulo*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Titulo*"
                                            :class="{
                                                'is-invalid':
                                                    errors?.plan_mensual
                                                        ?.titulo,
                                            }"
                                            v-model="plan_mensual.titulo"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors?.plan_mensual?.titulo"
                                            v-text="
                                                errors?.plan_mensual?.titulo[0]
                                            "
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors?.plan_mensual?.costo,
                                            }"
                                            >Costo*</label
                                        >
                                        <input
                                            type="number"
                                            placeholder="Costo*"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors?.plan_mensual?.costo,
                                            }"
                                            v-model="plan_mensual.costo"
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors?.plan_mensual?.costo"
                                            v-text="
                                                errors?.plan_mensual?.costo[0]
                                            "
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors?.plan_mensual
                                                        ?.detalles,
                                            }"
                                            >Detalles*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Detalles*"
                                            :class="{
                                                'is-invalid':
                                                    errors?.plan_mensual
                                                        ?.detalles,
                                            }"
                                            v-model="plan_mensual.detalles"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="
                                                errors?.plan_mensual?.detalles
                                            "
                                            v-text="
                                                errors?.plan_mensual
                                                    ?.detalles[0]
                                            "
                                        ></span>
                                    </div>
                                </div>
                            </div>
                            <div class="card-header bg-dark rounded-0">
                                <h4 class="card-title font-weight-bold">
                                    PLAN #2
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors?.plan_trimestral
                                                        ?.titulo,
                                            }"
                                            >Titulo*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Titulo*"
                                            :class="{
                                                'is-invalid':
                                                    errors?.plan_trimestral
                                                        ?.titulo,
                                            }"
                                            v-model="plan_trimestral.titulo"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="
                                                errors?.plan_trimestral?.titulo
                                            "
                                            v-text="
                                                errors?.plan_trimestral
                                                    ?.titulo[0]
                                            "
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors?.plan_trimestral
                                                        ?.costo,
                                            }"
                                            >Costo*</label
                                        >
                                        <input
                                            type="number"
                                            placeholder="Costo*"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors?.plan_trimestral
                                                        ?.costo,
                                            }"
                                            v-model="plan_trimestral.costo"
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="
                                                errors?.plan_trimestral?.costo
                                            "
                                            v-text="
                                                errors?.plan_trimestral
                                                    ?.costo[0]
                                            "
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors?.plan_trimestral
                                                        ?.detalles,
                                            }"
                                            >Detalles*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Detalles*"
                                            :class="{
                                                'is-invalid':
                                                    errors?.plan_trimestral
                                                        ?.detalles,
                                            }"
                                            v-model="plan_trimestral.detalles"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="
                                                errors?.plan_trimestral
                                                    ?.detalles
                                            "
                                            v-text="
                                                errors?.plan_trimestral
                                                    ?.detalles[0]
                                            "
                                        ></span>
                                    </div>
                                </div>
                            </div>

                            <div class="card-header bg-dark rounded-0">
                                <h4 class="card-title font-weight-bold">
                                    PLAN #3
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors?.plan_anual?.titulo,
                                            }"
                                            >Titulo*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Titulo*"
                                            :class="{
                                                'is-invalid':
                                                    errors?.plan_anual?.titulo,
                                            }"
                                            v-model="plan_anual.titulo"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors?.plan_anual?.titulo"
                                            v-text="
                                                errors?.plan_anual?.titulo[0]
                                            "
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors?.plan_anual?.costo,
                                            }"
                                            >Costo*</label
                                        >
                                        <input
                                            type="number"
                                            placeholder="Costo*"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors?.plan_anual?.costo,
                                            }"
                                            v-model="plan_anual.costo"
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors?.plan_anual?.costo"
                                            v-text="
                                                errors?.plan_anual?.costo[0]
                                            "
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors?.plan_anual
                                                        ?.detalles,
                                            }"
                                            >Detalles*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Detalles*"
                                            :class="{
                                                'is-invalid':
                                                    errors?.plan_anual
                                                        ?.detalles,
                                            }"
                                            v-model="plan_anual.detalles"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors?.plan_anual?.detalles"
                                            v-text="
                                                errors?.plan_anual?.detalles[0]
                                            "
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
            oPlanPago: {},
            plan_mensual: {
                titulo: "PLAN MENSUAL",
                costo: "0",
                detalles: "",
            },
            plan_trimestral: {
                titulo: "PLAN TRIMESTRAL",
                costo: "0",
                detalles: "",
            },
            plan_anual: {
                titulo: "PLAN ANUAL",
                costo: "0",
                detalles: "",
            },
            errors: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getPlanPago();
    },
    methods: {
        getPlanPago() {
            let url = main_url + "/admin/plan_pagos";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.plan_mensual) {
                    this.plan_mensual.titulo = res.data.plan_mensual.titulo;
                    this.plan_mensual.costo = res.data.plan_mensual.costo;
                    this.plan_mensual.detalles = res.data.plan_mensual.detalles;
                    this.plan_mensual.detalles = this.reemplazaBr(
                        this.plan_mensual.detalles
                    );
                }
                if (res.data.plan_trimestral) {
                    this.plan_trimestral.titulo =
                        res.data.plan_trimestral.titulo;
                    this.plan_trimestral.costo = res.data.plan_trimestral.costo;
                    this.plan_trimestral.detalles =
                        res.data.plan_trimestral.detalles;
                    this.plan_trimestral.detalles = this.reemplazaBr(
                        this.plan_trimestral.detalles
                    );
                }
                if (res.data.plan_anual) {
                    this.plan_anual.titulo = res.data.plan_anual.titulo;
                    this.plan_anual.costo = res.data.plan_anual.costo;
                    this.plan_anual.detalles = res.data.plan_anual.detalles;
                    this.plan_anual.detalles = this.reemplazaBr(
                        this.plan_anual.detalles
                    );
                }
            });
        },
        actualizaInformacion() {
            this.enviando = true;
            this.oPlanPago["plan_mensual"] = this.plan_mensual;
            this.oPlanPago["plan_trimestral"] = this.plan_trimestral;
            this.oPlanPago["plan_anual"] = this.plan_anual;
            try {
                let url = main_url + "/admin/plan_pagos";
                axios
                    .post(url, this.oPlanPago)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        if (res.data.plan_mensual) {
                            this.plan_mensual.titulo =
                                res.data.plan_mensual.titulo;
                            this.plan_mensual.costo =
                                res.data.plan_mensual.costo;
                            this.plan_mensual.detalles =
                                res.data.plan_mensual.detalles;
                            this.plan_mensual.detalles = this.reemplazaBr(
                                this.plan_mensual.detalles
                            );
                        }
                        if (res.data.plan_trimestral) {
                            this.plan_trimestral.titulo =
                                res.data.plan_trimestral.titulo;
                            this.plan_trimestral.costo =
                                res.data.plan_trimestral.costo;
                            this.plan_trimestral.detalles =
                                res.data.plan_trimestral.detalles;
                            this.plan_trimestral.detalles = this.reemplazaBr(
                                this.plan_trimestral.detalles
                            );
                        }
                        if (res.data.plan_anual) {
                            this.plan_anual.titulo = res.data.plan_anual.titulo;
                            this.plan_anual.costo = res.data.plan_anual.costo;
                            this.plan_anual.detalles =
                                res.data.plan_anual.detalles;
                            this.plan_anual.detalles = this.reemplazaBr(
                                this.plan_anual.detalles
                            );
                        }
                        this.errors = [];
                    })
                    .catch((error) => {
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                                Swal.fire({
                                    icon: "error",
                                    title: "Error",
                                    html: "Debes completar todos los campos",
                                    showConfirmButton: false,
                                    timer: 2000,
                                });
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
