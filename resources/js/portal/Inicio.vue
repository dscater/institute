<template>
    <div class="contenedor_inicio">
        <!-- Start popular-course Area -->
        <section class="popular-course-area section-gap">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">ÚLTIMOS CURSOS</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div
                        class="popular-cursos-carusel"
                        v-if="listCursos.length > 0"
                    >
                        <div
                            class="single-popular-carusel"
                            v-for="item in listCursos"
                        >
                            <div class="thumb-wrap relative">
                                <div class="thumb relative">
                                    <div class="overlay overlay-bg"></div>
                                    <img
                                        class="img-fluid"
                                        :src="item.url_imagen"
                                        alt=""
                                    />
                                </div>
                            </div>
                            <div class="details">
                                <router-link
                                    :to="{
                                        name: 'portal.curso',
                                        params: { id: 1 },
                                    }"
                                >
                                    <h4
                                        class="text-principal mt-2 mb-2 titulo_curso"
                                    >
                                        {{ item.nombre }}
                                    </h4>
                                </router-link>
                                <p class="text-principal">
                                    {{ item.texto_corto }}
                                </p>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <router-link
                                            :to="{
                                                name: 'portal.curso',
                                                params: { id: item.id },
                                            }"
                                            class="btn btn-success btn-block btn-flat"
                                        >
                                            Ver más
                                            <span
                                                class="lnr lnr-arrow-right text-white"
                                            ></span>
                                        </router-link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" v-else>
                        <h4
                            class="w-100 font-weight-bold text-gray text-center"
                        >
                            NO SE ENCONTRARÓN REGISTROS
                        </h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->

        <!-- Start search-course Area -->
        <section
            class="search-course-area relative bg-secundario2"
            v-if="oPortalGestoria"
        >
            <div class="container">
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-6 col-md-6 search-course-right p-0">
                        <img :src="oPortalGestoria.url_imagen" width="100%" />
                    </div>
                    <div class="col-lg-6 col-md-6 search-course-left">
                        <h1
                            class="text-white"
                            v-html="oPortalGestoria.titulo_inicio"
                        ></h1>
                        <p v-html="oPortalGestoria.descripcion_inicio"></p>
                        <div class="row mt-3">
                            <div class="col-md-4">
                                <router-link
                                    :to="{ name: 'portal.gestoria' }"
                                    class="btn btn-warning btn-block btn-flat"
                                    >Ver más
                                    <span
                                        class="lnr lnr-arrow-right text-white"
                                    ></span
                                ></router-link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End search-course Area -->

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
                        id="google_map_inicio"
                        v-html="oContacto.mapa"
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
                                <p>
                                    {{ oContacto.direccion }}
                                </p>
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
                                <p>{{ oContacto.fono1 }}</p>
                                <p v-if="oContacto.fono2 != ''">
                                    {{ oContacto.fono2 }}
                                </p>
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
                                <p>{{ oContacto.correo }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->

        <!-- Start cta-two Area -->
        <section class="cta-two-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 ml-auto">
                        <h1>¿No estás inscrito?</h1>
                    </div>
                    <div class="col-lg-4 text-left mr-auto">
                        <router-link
                            class="primary-btn wh"
                            :to="{ name: 'portal.inscripciones' }"
                            >Inscribete ahora</router-link
                        >
                    </div>
                </div>
            </div>
        </section>
        <!-- End cta-two Area -->
    </div>
</template>
<script>
export default {
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
                mapa: `<iframe src="https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d15302.44340797871!2d-68.13196529479978!3d-16.495230895308648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.497514656468287!2d-68.12797416816427!5e0!3m2!1ses-419!2sbo!4v1697748242821!5m2!1ses-419!2sbo" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>`,
            },
            oPortalGestoria: null,
            listCursos: [],
        };
    },
    mounted() {
        this.getInfoContacto();
        this.getPortalGestoria();
        this.getCursosDestacados();

        setTimeout(() => {
            this.loadingWindow.close();
        }, 500);
    },
    methods: {
        getInfoContacto() {
            axios.get(main_url + "/portal/getContacto").then((response) => {
                this.oContacto = response.data.contacto;
            });
        },
        getPortalGestoria() {
            let url = main_url + "/portal/getPortalGestoria";
            if (this.pagina != 0) {
                url += "?page=" + this.pagina;
            }
            axios.get(url).then((res) => {
                if (res.data.portal_gestoria) {
                    this.oPortalGestoria = res.data.portal_gestoria;
                }
            });
        },
        getCursosDestacados() {
            axios
                .get(main_url + "/portal/getCursosDestacados")
                .then((response) => {
                    this.listCursos = response.data.cursos;
                    let self = this;
                    if (this.listCursos.length > 0) {
                        setTimeout(function () {
                            self.initCarousel();
                        }, 300);
                    }
                });
        },
        initCarousel() {
            $(".popular-cursos-carusel").owlCarousel({
                items: 4,
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
                        items: 4,
                    },
                },
            });
        },

        cargaMapaGoogle(lat, lng, drag = false, dir = "") {
            lat = parseFloat(lat);
            lng = parseFloat(lng);

            // Inicializa el mapa
            this.map = new google.maps.Map(
                document.getElementById("google_map_inicio"),
                {
                    center: { lat: lat, lng: lng },
                    zoom: 18,
                }
            );

            // Configura el icono personalizado
            const customIcon = {
                url: main_url + "/imgs/pinmap.gif", // Ruta a tu icono personalizado
                scaledSize: new google.maps.Size(50, 50), // Tamaño del icono
            };

            // Crea un marcador en el centro del mapa
            this.marker = new google.maps.Marker({
                position: { lat: lat, lng: lng },
                map: this.map,
                icon: customIcon,
                draggable: drag,
            });

            // Escucha el evento de arrastrar del marcador
            google.maps.event.addListener(this.marker, "dragend", () => {
                const newPosition = this.marker.getPosition();
                this.oContacto.lat = newPosition.lat();
                this.oContacto.lng = newPosition.lng();
            });

            if (dir != "") {
                // Crea una ventana de información (infowindow) con el contenido deseado
                let self = this;
                this.infowindow = new google.maps.InfoWindow({
                    content: `<strong>DIRECCIÓN:</strong><br>${self.oContacto.direccion}`,
                });
                // Escucha el evento 'click' en el marcador para abrir la ventana de información
                this.marker.addListener("click", () => {
                    this.infowindow.open(this.map, this.marker);
                });
            }
        },
    },
};
</script>
<style>
#google_map_inicio {
    height: 400px;
}
</style>
