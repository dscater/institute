<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Administrar portal</h1>
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
                                    :to="{ name: 'admin_portal.actividades' }"
                                    class="text-left card-title btn btn-flat btn-warning"
                                    ><strong>Actividades</strong></router-link
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
                                :to="{ name: 'admin_portal.actividades' }"
                                class="card-body link_body"
                            >
                                <img
                                    v-if="oActividad"
                                    :src="oActividad.url_imagen"
                                    alt=""
                                />
                                <img
                                    :src="
                                        url_principal +
                                        '/imgs/fondo_actividades.png'
                                    "
                                    alt=""
                                    v-else
                                />
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{ name: 'admin_portal.nosotros' }"
                                    class="text-left card-title btn btn-flat btn-warning"
                                    ><strong>Nosotros: </strong> Historia,
                                    Misión y Visión</router-link
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
                                :to="{ name: 'admin_portal.nosotros' }"
                                class="card-body link_body"
                            >
                                <div v-if="oNosotros" class="col-md-12">
                                    <div class="row">
                                        <div
                                            class="col-md-12"
                                            v-if="oNosotros.historia != ''"
                                        >
                                            <div class="card mt-2">
                                                <div class="card-header">
                                                    <div class="card-title">
                                                        Historia
                                                    </div>
                                                </div>
                                                <div
                                                    class="card-body text-justify"
                                                    v-text="oNosotros.historia"
                                                ></div>
                                            </div>
                                        </div>
                                        <div
                                            class="col-md-12"
                                            v-if="oNosotros.mision != ''"
                                        >
                                            <div class="card mt-2">
                                                <div class="card-header">
                                                    <div class="card-title">
                                                        Misión
                                                    </div>
                                                </div>
                                                <div
                                                    class="card-body text-justify"
                                                    v-text="oNosotros.mision"
                                                ></div>
                                            </div>
                                        </div>
                                        <div
                                            class="col-md-12"
                                            v-if="oNosotros.vision != ''"
                                        >
                                            <div class="card mt-2">
                                                <div class="card-header">
                                                    <div class="card-title">
                                                        Visión
                                                    </div>
                                                </div>
                                                <div
                                                    class="card-body text-justify"
                                                    v-text="oNosotros.vision"
                                                ></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <img
                                    v-else
                                    :src="
                                        url_principal +
                                        '/imgs/fondo_nosotros.png'
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
                                    :to="{ name: 'admin_portal.contactos' }"
                                    class="text-left card-title btn btn-flat btn-warning"
                                    ><strong>Contactos: </strong> Dirección,
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
                                :to="{ name: 'admin_portal.contactos' }"
                                class="card-body link_body"
                            >
                                <div class="col-md-12" v-if="oContacto">
                                    <p>
                                        <strong>Dirección:</strong>
                                        {{ oContacto.direccion }}
                                    </p>
                                    <p>
                                        <strong>Teléfonos:</strong>
                                        {{ oContacto.fonos }}
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
                    <div class="col-md-8">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{ name: 'admin_portal.banners' }"
                                    class="text-left card-title btn btn-flat btn-warning"
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
                                :to="{ name: 'admin_portal.banners' }"
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
                                        url_principal + '/imgs/fondo_banner.png'
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
                                    class="text-left card-title btn btn-flat btn-warning"
                                    ><strong
                                        >Redes Sociales</strong
                                    ></router-link
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
                                :to="{ name: 'admin_portal.redes_sociales' }"
                                class="card-body link_body"
                            >
                                <div class="col-md-12" v-if="oRedSocial">
                                    <p>
                                        <strong>Twitter:</strong>
                                        {{ oRedSocial.twitter }}
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
            oActividad: null,
            oNosotros: null,
            oContacto: null,
            oBanner: null,
            oRedSocial: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getUltimActividad();
        this.getUltimoBanner();
        this.getInfoNosotros();
        this.getInfoContacto();
        this.getInfoRedSocial();
    },
    methods: {
        getUltimActividad() {
            axios
                .get(main_url + "/admin/actividads/get_actividad/ultimo")
                .then((response) => {
                    this.oActividad = response.data.actividad;
                });
        },
        getUltimoBanner() {
            axios
                .get(main_url + "/admin/banners/get_banner/ultimo")
                .then((response) => {
                    this.oBanner = response.data.banner;
                });
        },
        getInfoNosotros() {
            axios.get(main_url + "/admin/nosotros").then((response) => {
                this.oNosotros = response.data.nosotros;
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
