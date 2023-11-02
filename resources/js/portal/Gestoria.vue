<template>
    <div class="contenedor_gestoria">
        <!-- Start popular-course Area -->
        <section class="popular-course-area section-gap bg-principal">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">¿QUIÉNES SOMOS?</h1>
                        </div>
                    </div>
                </div>
                <div
                    class="row justify-content-between align-items-center pt-3"
                >
                    <div class="col-lg-6 d-flex flex-column address-wrap">
                        <p v-html="oGestoriaNosotros.descripcion"></p>
                        <div class="row mt-3">
                            <div
                                class="col-6 col-md-3 info_gestoria text-white"
                            >
                                <div
                                    class="contenido bg-secundario2 text-center"
                                >
                                    <img
                                        :src="
                                            url_principal +
                                            '/imgs/traveller.png'
                                        "
                                        alt=""
                                    />
                                    Visa de Turismo
                                </div>
                            </div>
                            <div
                                class="col-6 col-md-3 info_gestoria text-white"
                            >
                                <div
                                    class="contenido bg-secundario2 text-center"
                                >
                                    <img
                                        :src="
                                            url_principal +
                                            '/imgs/businessman.png'
                                        "
                                        alt=""
                                    />
                                    Visa de Trabajo
                                </div>
                            </div>
                            <div
                                class="col-6 col-md-3 info_gestoria text-white"
                            >
                                <div
                                    class="contenido bg-secundario2 text-center"
                                >
                                    <img
                                        :src="
                                            url_principal +
                                            '/imgs/graduated.png'
                                        "
                                        alt=""
                                    />
                                    Visa de Estudiantes
                                </div>
                            </div>
                            <div
                                class="col-6 col-md-3 info_gestoria text-white"
                            >
                                <div
                                    class="contenido bg-secundario2 text-center"
                                >
                                    <img
                                        :src="
                                            url_principal +
                                            '/imgs/consultation.png'
                                        "
                                        alt=""
                                    />
                                    Visa de Renovación
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 search-course-right p-0">
                        <img :src="oGestoriaNosotros.url_imagen" width="100%" />
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->
        <!-- Start popular-course Area -->
        <section class="popular-course-area section-gap bg-secundario2">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">SERVICIOS</h1>
                        </div>
                    </div>
                </div>
                <div
                    class="row justify-content-between align-items-center pt-3"
                >
                    <div class="col-md-3 contenedor_servicio">
                        <div class="img">
                            <img
                                :src="url_principal + '/imgs/traveller.png'"
                                alt=""
                            />
                            Visa de Turismo
                        </div>
                        <div class="descripcion">
                            <p v-html="oGestoriaServicio.turismo"></p>
                        </div>
                    </div>
                    <div class="col-md-3 contenedor_servicio">
                        <div class="img">
                            <img
                                :src="url_principal + '/imgs/businessman.png'"
                                alt=""
                            />
                            Visa de Trabajo
                        </div>
                        <div class="descripcion">
                            <p v-html="oGestoriaServicio.trabajo"></p>
                        </div>
                    </div>
                    <div class="col-md-3 contenedor_servicio">
                        <div class="img">
                            <img
                                :src="url_principal + '/imgs/graduated.png'"
                                alt=""
                            />
                            Visa de Estudiantes
                        </div>
                        <div class="descripcion">
                            <p v-html="oGestoriaServicio.estudiantes"></p>
                        </div>
                    </div>
                    <div class="col-md-3 contenedor_servicio">
                        <div class="img">
                            <img
                                :src="url_principal + '/imgs/consultation.png'"
                                alt=""
                            />
                            Visa de Renovación
                        </div>
                        <div class="descripcion">
                            <p v-html="oGestoriaServicio.renovacion"></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->

        <section class="popular-course-area section-gap">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">SOLICITUD DEL SERVICIO</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <SolicitudGestoria
                        :mensaje_servicio="oGestoriaServicio.mensaje_servicio"
                    ></SolicitudGestoria>
                </div>
            </div>
        </section>

        <!-- Start review Area -->
        <section class="review-area section-gap relative bg-secundario2">
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div class="row d-flex justify-content-center mb-3">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">TIPS PARA LOGRAR TU VISA</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="active-review-carusel-gestoria">
                        <div
                            class="single-review item bg-principal p-3"
                            v-for="item in listTips"
                        >
                            <div
                                class="title justify-content-start d-flex mt-1 mb-1"
                            >
                                <h4 class="text-white">
                                    {{ item.titulo }}
                                </h4>
                            </div>
                            <p v-html="item.descripcion"></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End review Area -->

        <!-- Start popular-course Area -->
        <section
            class="popular-course-area section-gap contact-page-area bg-principal"
        >
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">NUESTRA UBICACIÓN</h1>
                        </div>
                    </div>
                </div>
                <div
                    class="row justify-content-between align-items-center pt-3"
                >
                    <div
                        class="col-lg-6 col-md-6 search-course-right p-0 contenedor_mapa"
                        id="google_map_gestoria"
                        v-html="oConfiguracionGestoria.mapa"
                    ></div>
                    <div class="col-lg-6 d-flex flex-column address-wrap">
                        <div
                            class="single-contact-address d-flex flex-row pt-3 pb-3"
                        >
                            <div class="icon">
                                <span class="lnr lnr-home"></span>
                            </div>
                            <div class="contact-details">
                                <h5>Dirección:</h5>
                                <p
                                    v-html="oConfiguracionGestoria.direccion"
                                ></p>
                            </div>
                        </div>
                        <div
                            class="single-contact-address d-flex flex-row pt-3 pb-3"
                        >
                            <div class="icon">
                                <span class="lnr lnr-phone-handset"></span>
                            </div>
                            <div class="contact-details">
                                <h5>Celular/Whatsapp:</h5>
                                <p v-text="oConfiguracionGestoria.fono1"></p>
                                <p
                                    v-if="oConfiguracionGestoria.fono2 != ''"
                                    v-text="oConfiguracionGestoria.fono2"
                                ></p>
                            </div>
                        </div>
                        <div
                            class="single-contact-address d-flex flex-row pt-3 pb-3"
                        >
                            <div class="icon">
                                <span class="lnr lnr-envelope"></span>
                            </div>
                            <div class="contact-details">
                                <h5>Email:</h5>
                                <p v-text="oConfiguracionGestoria.correo"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->
    </div>
</template>
<script>
import SolicitudGestoria from "./componentes/SolicitudGestoria.vue";
export default {
    components: {
        SolicitudGestoria,
    },
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
            oContacto: {
                direccion: "",
                fonos: "",
                correo: "",
                lat: "-16.50405",
                lng: "-68.13081",
            },
            oGestoriaNosotros: {
                descripcion: `Somos Gestores<br />Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.`,
                url_imagen: main_url + "/imgs/gestoriaImg.jpg",
            },
            oGestoriaServicio: {
                trabajo: `Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país`,
                turismo: `Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país`,
                estudiantes: `Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país`,
                renovacion: `Tipo de visa aplicable para pasajeros que por conexiones, escalas o itinerarios que llegan a un país, en el que toma el mismo medio de transporte o esperan el nuevo que los lleva al país`,
            },
            oConfiguracionGestoria: {
                direccion: "",
                fonos: "",
                correo: "",
                mapa: `<iframe src="https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>`,
            },
            listTips: [],
        };
    },
    mounted() {
        this.scrollArriba(0);
        this.getGestoriaNosotros();
        this.getGestoriaServicio();
        this.getConfiguracionGestoria();
        this.getGestoriaTips();
        this.loadingWindow.close();
    },
    methods: {
        getGestoriaNosotros() {
            let url = main_url + "/portal/getNosotrosGestoria";
            axios.get(url).then((res) => {
                if (res.data.gestoria_nosotros) {
                    this.oGestoriaNosotros = res.data.gestoria_nosotros;
                }
            });
        },
        getGestoriaServicio() {
            let url = main_url + "/portal/getServiciosGestoria";
            axios.get(url).then((res) => {
                if (res.data.gestoria_servicio) {
                    this.oGestoriaServicio = res.data.gestoria_servicio;
                }
            });
        },
        getGestoriaTips() {
            axios.get(main_url + "/portal/getGestoriaTips").then((response) => {
                this.listTips = response.data.gestoria_tips;
                let self = this;
                if (this.listTips.length > 0) {
                    setTimeout(function () {
                        self.initCaruselTips();
                    }, 300);
                }
            });
        },
        getConfiguracionGestoria() {
            let url = main_url + "/portal/getConfiguracionGestoria";
            axios.get(url).then((res) => {
                if (res.data.configuracion_gestoria) {
                    this.oConfiguracionGestoria =
                        res.data.configuracion_gestoria;
                }
            });
        },

        initCaruselTips() {
            $(".active-review-carusel-gestoria").owlCarousel({
                items: 3,
                margin: 30,
                loop: true,
                dots: true,
                autoplayHoverPause: true,
                smartSpeed: 650,
                autoplay: true,
                responsive: {
                    0: {
                        items: 1,
                    },
                    480: {
                        items: 1,
                    },
                    768: {
                        items: 2,
                    },
                    992: {
                        items: 3,
                    },
                },
            });
        },
    },
};
</script>
<style>
.contenedor_gestoria .info_gestoria {
    padding: 10px;
}
.contenedor_gestoria .info_gestoria .contenido {
    border-radius: 10px;
    height: 190px;
    font-weight: bold;
}

.contenedor_gestoria .info_gestoria .contenido img {
    width: 100%;
    margin-bottom: 10px;
}

.contenedor_gestoria .contenedor_servicio {
    padding: 35px;
}

.contenedor_gestoria .contenedor_servicio .img {
    margin-bottom: 10px;
    text-align: center;
    font-weight: bold;
    font-size: 1.5em;
}
.contenedor_gestoria .contenedor_servicio .img img {
    width: 90%;
    border-radius: 50%;
    margin-bottom: 15px;
}
.contenedor_gestoria .contenedor_servicio .descripcion {
    text-align: justify;
}

#google_map_gestoria {
    height: 400px;
}

@media (max-width: 800px) {
    .contenedor_gestoria .info_gestoria .contenido {
        height: auto;
    }
    .contenedor_gestoria .info_gestoria .contenido img {
        display: block;
        margin: auto;
        margin-bottom: 10px;
        width: 60%;
    }
}
</style>
