<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Configurar portal</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{
                                        name: 'admin_portal.banners',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Inicio: </strong>
                                    Banners</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{
                                    name: 'admin_portal.banners',
                                }"
                                class="card-body link_body"
                            >
                                <img
                                    v-if="oBanner"
                                    :src="oBanner.url_img"
                                    alt=""
                                />
                                <img
                                    v-else
                                    :src="
                                        url_principal + '/imgs/fondo_banner.jpg'
                                    "
                                    alt=""
                                />
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{
                                        name: 'admin_portal.portal_comunicado',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Inicio: </strong>
                                    Comunicado</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{
                                    name: 'admin_portal.portal_comunicado',
                                }"
                                class="card-body link_body"
                            >
                                <p
                                    v-if="oPortalComunciado"
                                    class="text-center"
                                    v-html="oPortalComunciado.descripcion"
                                ></p>
                                <p
                                    v-else
                                    class="font-weight-bold text-center text-gray"
                                >
                                    AÚN NO SE CARGO UN COMUNICADO
                                </p>
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{
                                        name: 'admin_portal.portal_gestoria',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Inicio: </strong> Información
                                    Gestoría</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{
                                    name: 'admin_portal.portal_gestoria',
                                }"
                                class="card-body link_body"
                            >
                                <template v-if="oPortalGestoria">
                                    <img
                                        :src="oPortalGestoria.url_imagen"
                                        alt=""
                                    />
                                    <div class="row">
                                        <div class="col-md-12 p-4">
                                            <h4
                                                v-html="
                                                    oPortalGestoria.titulo_inicio
                                                "
                                            ></h4>
                                            <p
                                                v-html="
                                                    oPortalGestoria.descripcion_inicio
                                                "
                                            ></p>
                                        </div>
                                    </div>
                                </template>
                                <p
                                    v-else
                                    class="font-weight-bold text-center text-gray"
                                >
                                    AÚN NO SE CONFIGURÓ LA INFORMACIÓN DE
                                    GESTORÍA
                                </p>
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{
                                        name: 'admin_portal.contactos',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Inicio: </strong> Dirección,
                                    Teléfonos, Correo y Mapa</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{
                                    name: 'admin_portal.contactos',
                                }"
                                class="card-body link_body"
                            >
                                <div class="col-md-12 p-3" v-if="oContacto">
                                    <p>
                                        <strong>Dirección:</strong>
                                        {{ oContacto.direccion }}
                                    </p>
                                    <p>
                                        <strong>Teléfono 1:</strong>
                                        {{ oContacto.fono1 }}
                                    </p>
                                    <p>
                                        <strong>Teléfono 2:</strong>
                                        {{ oContacto.fono2 }}
                                    </p>
                                    <p>
                                        <strong>Correo:</strong>
                                        {{ oContacto.correo }}
                                    </p>
                                </div>
                                <img
                                    v-else
                                    :src="
                                        url_principal +
                                        '/imgs/fondo_direccion.jpg'
                                    "
                                    alt=""
                                />
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{
                                        name: 'admin_portal.redes_sociales',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Inicio: </strong>Redes
                                    Sociales</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{
                                    name: 'admin_portal.redes_sociales',
                                }"
                                class="card-body link_body"
                            >
                                <div class="col-md-12 p-3" v-if="oRedSocial">
                                    <p>
                                        <strong>Tiktok:</strong>
                                        {{ oRedSocial.tiktok }}
                                    </p>
                                    <p>
                                        <strong>Facebook:</strong>
                                        {{ oRedSocial.facebook }}
                                    </p>
                                    <p>
                                        <strong>Instagram:</strong>
                                        {{ oRedSocial.instagram }}
                                    </p>
                                    <p>
                                        <strong>Youtube:</strong>
                                        {{ oRedSocial.youtube }}
                                    </p>
                                </div>
                                <img
                                    v-else
                                    :src="
                                        url_principal + '/imgs/fondo_social.jpg'
                                    "
                                    alt=""
                                />
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{
                                        name: 'admin_portal.plan_pagos',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Inicio: </strong>Inscripciones -
                                    Plan de Pagos</router-link
                                >
                                <div class="card-tools">
                                    <button
                                        type="button"
                                        class="btn btn-tool"
                                        data-card-widget="collapse"
                                    >
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            <router-link
                                :to="{
                                    name: 'admin_portal.plan_pagos',
                                }"
                                class="card-body link_body"
                            >
                                <div class="col-md-12 p-3" v-if="oPlanPago">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p class="w-100 text-center font-weight-bold">{{
                                                oPlanPago.plan_mensual.titulo
                                            }}</p>
                                            <p class="w-100 text-center">
                                                <strong>Costo: </strong
                                                >{{
                                                    oPlanPago.plan_mensual.costo
                                                }}
                                            </p>
                                            <p
                                                class="w-100 text-center"
                                                v-html="
                                                    oPlanPago.plan_mensual
                                                        .detalles
                                                "
                                            ></p>
                                            <hr/>
                                        </div>
                                        <div class="col-md-12">
                                            <p class="w-100 text-center font-weight-bold">{{
                                                oPlanPago.plan_trimestral.titulo
                                            }}</p>
                                            <p class="w-100 text-center">
                                                <strong>Costo: </strong
                                                >{{
                                                    oPlanPago.plan_trimestral
                                                        .costo
                                                }}
                                            </p>
                                            <p
                                                class="w-100 text-center"
                                                v-html="
                                                    oPlanPago.plan_trimestral
                                                        .detalles
                                                "
                                            ></p>
                                            <hr/>
                                        </div>
                                        <div class="col-md-12">
                                            <p class="w-100 text-center font-weight-bold">{{
                                                oPlanPago.plan_anual.titulo
                                            }}</p>
                                            <p class="w-100 text-center">
                                                <strong>Costo: </strong
                                                >{{
                                                    oPlanPago.plan_anual.costo
                                                }}
                                            </p>
                                            <p
                                                class="w-100 text-center"
                                                v-html="
                                                    oPlanPago.plan_anual
                                                        .detalles
                                                "
                                            ></p>
                                        </div>
                                    </div>
                                </div>
                                <img
                                    v-else
                                    :src="
                                        url_principal + '/imgs/fondo_social.jpg'
                                    "
                                    alt=""
                                />
                            </router-link>
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
            oContacto: null,
            oBanner: null,
            oPortalComunciado: null,
            oRedSocial: null,
            oPortalGestoria: null,
            oPlanPago: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getUltimoBanner();
        this.getInfoContacto();
        this.getInfoRedSocial();
        this.getPortalComunicado();
        this.getPortalGestoria();
        this.getInfoPlanPago();
    },
    methods: {
        getUltimoBanner() {
            axios
                .get(main_url + "/admin/banners/get_banner/ultimo")
                .then((response) => {
                    this.oBanner = response.data.banner;
                });
        },
        getInfoContacto() {
            axios.get(main_url + "/admin/contactos").then((response) => {
                this.oContacto = response.data.contacto;
            });
        },
        getInfoRedSocial() {
            axios.get(main_url + "/admin/red_socials").then((response) => {
                this.oRedSocial = response.data.red_social;
            });
        },
        getInfoPlanPago() {
            axios.get(main_url + "/admin/plan_pagos").then((response) => {
                this.oPlanPago = {
                    plan_mensual: { titulo: "", costo: "0.00", detalles: "" },
                    plan_trimestral: {
                        titulo: "",
                        costo: "0.00",
                        detalles: "",
                    },
                    plan_anual: { titulo: "", costo: "0.00", detalles: "" },
                };
                this.oPlanPago["plan_mensual"] = response.data.plan_mensual;
                this.oPlanPago["plan_trimestral"] =
                    response.data.plan_trimestral;
                this.oPlanPago["plan_anual"] = response.data.plan_anual;
            });
        },

        getPortalComunicado() {
            let url = main_url + "/admin/portal_comunicados";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.portal_comunicado) {
                    this.oPortalComunciado = res.data.portal_comunicado;
                }
            });
        },
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
    },
};
</script>

<style>
.link_body {
    padding: 0px;
}

.link_body img {
    width: 100%;
}

.card_portal .card-body {
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
}
.card_portal .card-header a {
    width: calc(100% - 31px);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
