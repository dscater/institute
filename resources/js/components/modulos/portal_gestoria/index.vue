<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>
                            Administración Gestoría de Visa > Configurar
                            Gestoría de Visa
                        </h1>
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
                                        name: 'admin_portal_gestoria.gestoria_banners',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Gestoría: </strong>
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
                                    name: 'admin_portal_gestoria.gestoria_banners',
                                }"
                                class="card-body link_body"
                            >
                                <img
                                    v-if="oGestoriaBanner"
                                    :src="oGestoriaBanner.url_img"
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
                                        name: 'admin_portal_gestoria.gestoria_nosotros',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Gestoría: </strong> ¿Quiénes
                                    somos?</router-link
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
                                    name: 'admin_portal_gestoria.gestoria_nosotros',
                                }"
                                class="card-body link_body"
                            >
                                <template v-if="oGestoriaNosotros">
                                    <img
                                        :src="oGestoriaNosotros.url_imagen"
                                        alt=""
                                    />
                                    <div class="row">
                                        <div class="col-md-12 p-4">
                                            <p
                                                v-html="
                                                    oGestoriaNosotros.descripcion
                                                "
                                            ></p>
                                        </div>
                                    </div>
                                </template>
                                <p
                                    v-else
                                    class="font-weight-bold text-center text-gray"
                                >
                                    AÚN NO SE CONFIGURÓ LA INFORMACIÓN
                                </p>
                            </router-link>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card_portal collapsed-card">
                            <div class="card-header bg-dark">
                                <router-link
                                    :to="{
                                        name: 'admin_portal_gestoria.configuracion_gestoria',
                                    }"
                                    class="text-left card-title btn btn-flat btn-success"
                                    ><strong>Gestoría: </strong>
                                    Configuración</router-link
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
                                    name: 'admin_portal_gestoria.configuracion_gestoria',
                                }"
                                class="card-body link_body"
                            >
                                <div
                                    class="col-md-12 p-3"
                                    v-if="oConfiguracionGestoria"
                                >
                                    <p>
                                        <strong>Dirección:</strong>
                                        {{ oConfiguracionGestoria.direccion }}
                                    </p>
                                    <p>
                                        <strong>Teléfono 1:</strong>
                                        {{ oConfiguracionGestoria.fono1 }}
                                    </p>
                                    <p>
                                        <strong>Teléfono 2:</strong>
                                        {{ oConfiguracionGestoria.fono2 }}
                                    </p>
                                    <p>
                                        <strong>Correo:</strong>
                                        {{ oConfiguracionGestoria.correo }}
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
            oGestoriaBanner: null,
            oGestoriaNosotros: null,
            oConfiguracionGestoria: null,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getUltimoGestoriaBanner();
        this.getGestoriaNosotros();
        this.getInfoConfiguracionGestoria();
    },
    methods: {
        getUltimoGestoriaBanner() {
            axios
                .get(main_url + "/admin/gestoria_banners/get_banner/ultimo")
                .then((response) => {
                    this.oGestoriaBanner = response.data.gestoria_banner;
                });
        },
        getGestoriaNosotros() {
            let url = main_url + "/admin/gestoria_nosotros";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.gestoria_nosotros) {
                    this.oGestoriaNosotros = res.data.gestoria_nosotros;
                }
            });
        },
        getInfoConfiguracionGestoria() {
            axios
                .get(main_url + "/admin/configuracion_gestorias")
                .then((response) => {
                    this.oConfiguracionGestoria =
                        response.data.configuracion_gestoria;
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
