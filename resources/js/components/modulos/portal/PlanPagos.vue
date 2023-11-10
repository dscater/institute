<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Configurar portal >Plan de Pagos</h1>
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
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h4>Planes de pago</h4>
                    </div>
                    <div class="col-md-4">
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
                                                    errors.titulo_mensual,
                                            }"
                                            >Titulo*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Titulo*"
                                            :class="{
                                                'is-invalid':
                                                    errors.titulo_mensual,
                                            }"
                                            v-model="plan_mensual.titulo"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.titulo_mensual"
                                            v-text="errors.titulo_mensual[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.costo_mensual,
                                            }"
                                            >Costo*</label
                                        >
                                        <input
                                            type="number"
                                            placeholder="Costo*"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors.costo_mensual,
                                            }"
                                            v-model="plan_mensual.costo"
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.costo_mensual"
                                            v-text="errors.costo_mensual[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.detalles_mensual,
                                            }"
                                            >Detalles*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Detalles*"
                                            :class="{
                                                'is-invalid':
                                                    errors.detalles_mensual,
                                            }"
                                            v-model="plan_mensual.detalles"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.detalles_mensual"
                                            v-text="errors.detalles_mensual[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
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
                                                    errors.titulo_trimestral,
                                            }"
                                            >Titulo*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Titulo*"
                                            :class="{
                                                'is-invalid':
                                                    errors.titulo_trimestral,
                                            }"
                                            v-model="plan_trimestral.titulo"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.titulo_trimestral"
                                            v-text="errors.titulo_trimestral[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.costo_trimestral,
                                            }"
                                            >Costo*</label
                                        >
                                        <input
                                            type="number"
                                            placeholder="Costo*"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors.costo_trimestral,
                                            }"
                                            v-model="plan_trimestral.costo"
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.costo_trimestral"
                                            v-text="errors.costo_trimestral[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.detalles_trimestral,
                                            }"
                                            >Detalles*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Detalles*"
                                            :class="{
                                                'is-invalid':
                                                    errors.detalles_trimestral,
                                            }"
                                            v-model="plan_trimestral.detalles"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.detalles_trimestral"
                                            v-text="
                                                errors.detalles_trimestral[0]
                                            "
                                        ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
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
                                                    errors.titulo_anual,
                                            }"
                                            >Titulo*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Titulo*"
                                            :class="{
                                                'is-invalid':
                                                    errors.titulo_anual,
                                            }"
                                            v-model="plan_anual.titulo"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.titulo_anual"
                                            v-text="errors.titulo_anual[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.costo_anual,
                                            }"
                                            >Costo*</label
                                        >
                                        <input
                                            type="number"
                                            placeholder="Costo*"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors.costo_anual,
                                            }"
                                            v-model="plan_anual.costo"
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.costo_anual"
                                            v-text="errors.costo_anual[0]"
                                        ></span>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.detalles_anual,
                                            }"
                                            >Detalles*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Detalles*"
                                            :class="{
                                                'is-invalid':
                                                    errors.detalles_anual,
                                            }"
                                            v-model="plan_anual.detalles"
                                            autosize
                                        >
                                        </el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.detalles_anual"
                                            v-text="errors.detalles_anual[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h4>Información Formas de Pago</h4>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header bg-dark rounded-0">
                                <h4 class="card-title font-weight-bold">
                                    ZELLE
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.archivo_zelle,
                                            }"
                                            >Cargar archivo</label
                                        >
                                        <input
                                            type="file"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors.archivo_zelle,
                                            }"
                                            ref="input_file_zelle"
                                            @change="
                                                cargaArchivo($event, 'zelle')
                                            "
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.archivo_zelle"
                                            v-text="errors.archivo_zelle[0]"
                                        ></span>
                                    </div>
                                    <div
                                        class="col-md-12"
                                        v-if="informacion_zelle?.url_archivo"
                                    >
                                        <a
                                            :href="
                                                informacion_zelle.url_archivo
                                            "
                                            target="_blank"
                                            >Ver archivo</a
                                        >
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.descripcion_zelle,
                                            }"
                                            >Descripción*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Costo*"
                                            :class="{
                                                'is-invalid':
                                                    errors.descripcion_zelle,
                                            }"
                                            v-model="
                                                informacion_zelle.descripcion
                                            "
                                            autosize
                                        ></el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.descripcion_zelle"
                                            v-text="errors.descripcion_zelle[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header bg-dark rounded-0">
                                <h4 class="card-title font-weight-bold">
                                    WESTERN UNION
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.archivo_western,
                                            }"
                                            >Cargar archivo</label
                                        >
                                        <input
                                            type="file"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors.archivo_western,
                                            }"
                                            ref="input_file_western"
                                            @change="
                                                cargaArchivo($event, 'western')
                                            "
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.archivo_western"
                                            v-text="errors.archivo_western[0]"
                                        ></span>
                                    </div>
                                    <div
                                        class="col-md-12"
                                        v-if="informacion_western?.url_archivo"
                                    >
                                        <a
                                            :href="
                                                informacion_western.url_archivo
                                            "
                                            target="_blank"
                                            >Ver archivo</a
                                        >
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.descripcion_western,
                                            }"
                                            >Descripción*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Costo*"
                                            :class="{
                                                'is-invalid':
                                                    errors.descripcion_western,
                                            }"
                                            v-model="
                                                informacion_western.descripcion
                                            "
                                            autosize
                                        ></el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.descripcion_western"
                                            v-text="
                                                errors.descripcion_western[0]
                                            "
                                        ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header bg-dark rounded-0">
                                <h4 class="card-title font-weight-bold">
                                    DEPÓSITO BANCARIO
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.archivo_deposito,
                                            }"
                                            >Cargar archivo</label
                                        >
                                        <input
                                            type="file"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors.archivo_deposito,
                                            }"
                                            ref="input_file_deposito"
                                            @change="
                                                cargaArchivo($event, 'deposito')
                                            "
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.archivo_deposito"
                                            v-text="errors.archivo_deposito[0]"
                                        ></span>
                                    </div>
                                    <div
                                        class="col-md-12"
                                        v-if="informacion_deposito?.url_archivo"
                                    >
                                        <a
                                            :href="
                                                informacion_deposito.url_archivo
                                            "
                                            target="_blank"
                                            >Ver archivo</a
                                        >
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.descripcion_deposito,
                                            }"
                                            >Descripción*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Costo*"
                                            :class="{
                                                'is-invalid':
                                                    errors.descripcion_deposito,
                                            }"
                                            v-model="
                                                informacion_deposito.descripcion
                                            "
                                            autosize
                                        ></el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.descripcion_deposito"
                                            v-text="
                                                errors.descripcion_deposito[0]
                                            "
                                        ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header bg-dark rounded-0">
                                <h4 class="card-title font-weight-bold">
                                    MERCADO PAGO
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.archivo_mercado,
                                            }"
                                            >Cargar archivo</label
                                        >
                                        <input
                                            type="file"
                                            class="form-control"
                                            :class="{
                                                'is-invalid':
                                                    errors.archivo_mercado,
                                            }"
                                            ref="input_file_mercado"
                                            @change="
                                                cargaArchivo($event, 'mercado')
                                            "
                                        />
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.archivo_mercado"
                                            v-text="errors.archivo_mercado[0]"
                                        ></span>
                                    </div>
                                    <div
                                        class="col-md-12"
                                        v-if="informacion_mercado?.url_archivo"
                                    >
                                        <a
                                            :href="
                                                informacion_mercado.url_archivo
                                            "
                                            target="_blank"
                                            >Ver archivo</a
                                        >
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.descripcion_mercado,
                                            }"
                                            >Descripción*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Costo*"
                                            :class="{
                                                'is-invalid':
                                                    errors.descripcion_mercado,
                                            }"
                                            v-model="
                                                informacion_mercado.descripcion
                                            "
                                            autosize
                                        ></el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.descripcion_mercado"
                                            v-text="
                                                errors.descripcion_mercado[0]
                                            "
                                        ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header bg-dark rounded-0">
                                <h4 class="card-title font-weight-bold">
                                    OTRAS FORMAS DE PAGO
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.descripcion_otros,
                                            }"
                                            >Descripción*</label
                                        >
                                        <el-input
                                            type="textarea"
                                            placeholder="Costo*"
                                            :class="{
                                                'is-invalid':
                                                    errors.descripcion_otros,
                                            }"
                                            v-model="
                                                informacion_otros.descripcion
                                            "
                                            autosize
                                        ></el-input>
                                        <span
                                            class="error invalid-feedback"
                                            v-if="errors.descripcion_otros"
                                            v-text="errors.descripcion_otros[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <button
                            class="btn btn-success btn-flat btn-block"
                            @click="actualizaInformacion()"
                        >
                            <i class="fa fa-save"></i> Guardar cambios
                        </button>
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
            informacion_zelle: {
                url_archivo: "",
                archivo: null,
                descripcion: "Pago zelle\nDescripción pago zelle",
            },
            informacion_western: {
                url_archivo: "",
                archivo: null,
                descripcion: "Pago western union\nDescripción pago western",
            },
            informacion_deposito: {
                url_archivo: main_url + "/imgs/qr_institute.png",
                archivo: null,
                descripcion:
                    "Deposito bancario\nNro. de cuenta: 100000000000000000000000",
            },
            informacion_mercado: {
                url_archivo: "",
                archivo: null,
                descripcion:
                    "Mercado pago Argentina\nJuan Perez\nCVU: 00000333333333\nAlias: Tomorrowistoday\nCUIT/CUIL: 2000999999\nMercado Pago",
            },
            informacion_otros: {
                descripcion:
                    "Otros tipos de pagos\nDescripción de otros tipos de pagos",
            },

            src_imagen_cargada: "",
            errors: [],
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
                if (res.data.informacion_zelle) {
                    this.informacion_zelle = res.data.informacion_zelle;
                    this.informacion_zelle.descripcion = this.reemplazaBr(
                        this.informacion_zelle.descripcion
                    );
                }
                if (res.data.informacion_western) {
                    this.informacion_western = res.data.informacion_western;
                    this.informacion_western.descripcion = this.reemplazaBr(
                        this.informacion_western.descripcion
                    );
                }
                if (res.data.informacion_deposito) {
                    this.informacion_deposito = res.data.informacion_deposito;
                    this.informacion_deposito.descripcion = this.reemplazaBr(
                        this.informacion_deposito.descripcion
                    );
                }
                if (res.data.informacion_mercado) {
                    this.informacion_mercado = res.data.informacion_mercado;
                    this.informacion_mercado.descripcion = this.reemplazaBr(
                        this.informacion_mercado.descripcion
                    );
                }
                if (res.data.informacion_otros) {
                    this.informacion_otros = res.data.informacion_otros;
                    this.informacion_otros.descripcion = this.reemplazaBr(
                        this.informacion_otros.descripcion
                    );
                }
            });
        },
        actualizaInformacion() {
            this.enviando = true;

            let config = {
                headers: {
                    "Content-Type": "multipart/form-data",
                },
            };
            let formdata = new FormData();
            formdata.append(
                "titulo_mensual",
                this.plan_mensual.titulo ? this.plan_mensual.titulo : ""
            );
            formdata.append(
                "costo_mensual",
                this.plan_mensual.costo ? this.plan_mensual.costo : ""
            );
            formdata.append(
                "detalles_mensual",
                this.plan_mensual.detalles ? this.plan_mensual.detalles : ""
            );

            formdata.append(
                "titulo_trimestral",
                this.plan_trimestral.titulo ? this.plan_trimestral.titulo : ""
            );
            formdata.append(
                "costo_trimestral",
                this.plan_trimestral.costo ? this.plan_trimestral.costo : ""
            );
            formdata.append(
                "detalles_trimestral",
                this.plan_trimestral.detalles
                    ? this.plan_trimestral.detalles
                    : ""
            );

            formdata.append(
                "titulo_anual",
                this.plan_anual.titulo ? this.plan_anual.titulo : ""
            );
            formdata.append(
                "costo_anual",
                this.plan_anual.costo ? this.plan_anual.costo : ""
            );
            formdata.append(
                "detalles_anual",
                this.plan_anual.detalles ? this.plan_anual.detalles : ""
            );

            // zelle
            formdata.append(
                "archivo_zelle",
                this.informacion_zelle.archivo
                    ? this.informacion_zelle.archivo
                    : ""
            );
            formdata.append(
                "descripcion_zelle",
                this.informacion_zelle.descripcion
                    ? this.informacion_zelle.descripcion
                    : ""
            );

            // western
            formdata.append(
                "archivo_western",
                this.informacion_western.archivo
                    ? this.informacion_western.archivo
                    : ""
            );
            formdata.append(
                "descripcion_western",
                this.informacion_western.descripcion
                    ? this.informacion_western.descripcion
                    : ""
            );

            // deposito
            formdata.append(
                "archivo_deposito",
                this.informacion_deposito.archivo
                    ? this.informacion_deposito.archivo
                    : ""
            );
            formdata.append(
                "descripcion_deposito",
                this.informacion_deposito.descripcion
                    ? this.informacion_deposito.descripcion
                    : ""
            );

            // mercado
            formdata.append(
                "archivo_mercado",
                this.informacion_mercado.archivo
                    ? this.informacion_mercado.archivo
                    : ""
            );
            formdata.append(
                "descripcion_mercado",
                this.informacion_mercado.descripcion
                    ? this.informacion_mercado.descripcion
                    : ""
            );

            // otros
            formdata.append(
                "descripcion_otros",
                this.informacion_otros.descripcion
                    ? this.informacion_otros.descripcion
                    : ""
            );

            try {
                let url = main_url + "/admin/plan_pagos";
                axios
                    .post(url, formdata, config)
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
                        if (res.data.informacion_zelle) {
                            this.informacion_zelle = res.data.informacion_zelle;
                            this.informacion_zelle.descripcion =
                                this.reemplazaBr(
                                    this.informacion_zelle.descripcion
                                );
                        }
                        if (res.data.informacion_western) {
                            this.informacion_western =
                                res.data.informacion_western;
                            this.informacion_western.descripcion =
                                this.reemplazaBr(
                                    this.informacion_western.descripcion
                                );
                        }
                        if (res.data.informacion_deposito) {
                            this.informacion_deposito =
                                res.data.informacion_deposito;
                            this.informacion_deposito.descripcion =
                                this.reemplazaBr(
                                    this.informacion_deposito.descripcion
                                );
                        }
                        if (res.data.informacion_mercado) {
                            this.informacion_mercado =
                                res.data.informacion_mercado;
                            this.informacion_mercado.descripcion =
                                this.reemplazaBr(
                                    this.informacion_mercado.descripcion
                                );
                        }
                        if (res.data.informacion_otros) {
                            this.informacion_otros = res.data.informacion_otros;
                            this.informacion_otros.descripcion =
                                this.reemplazaBr(
                                    this.informacion_otros.descripcion
                                );
                        }
                        this.errors = [];
                        this.$refs.input_file_zelle.value = "";
                        this.$refs.input_file_western.value = "";
                        this.$refs.input_file_deposito.value = "";
                        this.$refs.input_file_mercado.value = "";
                    })
                    .catch((error) => {
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                                let mensaje = `<ul class="text-left">`;
                                for (let key in this.errors) {
                                    if (this.errors.hasOwnProperty(key)) {
                                        const value = this.errors[key];
                                        if (Array.isArray(value)) {
                                            value.forEach((error) => {
                                                mensaje += `<li><span>${error.trim()}</span></li>`;
                                            });
                                        }
                                    }
                                }
                                mensaje += `<ul/>`;
                                Swal.fire({
                                    icon: "error",
                                    title: "Tienes los siguientes errores en el formulario",
                                    html: mensaje,
                                    showConfirmButton: true,
                                    confirmButtonColor: "#009688",
                                    confirmButtonText: "Aceptar",
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
        cargaArchivo(e, forma) {
            const file = e.target.files[0];
            if (file) {
                if (forma == "zelle") {
                    this.informacion_zelle.archivo = file;
                }
                if (forma == "western") {
                    this.informacion_western.archivo = file;
                }
                if (forma == "deposito") {
                    this.informacion_deposito.archivo = file;
                }
                if (forma == "mercado") {
                    this.informacion_mercado.archivo = file;
                }
            }
        },
    },
};
</script>

<style>
.previsualizacion_archivo img {
    width: 100%;
}
</style>
