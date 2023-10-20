<template>
    <div class="contenedor_inicio">
        <!-- Start popular-course Area -->
        <section class="popular-course-area section-gap">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content text-principal col-lg-8">
                        <div class="title text-center">
                            <h1 class="mb-10">CURSOS DESTACADOS</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="popular-cursos-carusel">
                        <div class="single-popular-carusel">
                            <div class="thumb-wrap relative">
                                <div class="thumb relative">
                                    <div class="overlay overlay-bg"></div>
                                    <img
                                        class="img-fluid"
                                        :src="url_principal + '/images/p1.jpg'"
                                        alt=""
                                    />
                                </div>
                                <!-- <div
                                    class="meta d-flex justify-content-between"
                                >
                                    <p>
                                        <span class="lnr lnr-users"></span> 355
                                        <span class="lnr lnr-bubble"></span>35
                                    </p>
                                    <h4>$150</h4>
                                </div> -->
                            </div>
                            <div class="details">
                                <router-link
                                    :to="{
                                        name: 'portal.curso',
                                        params: { id: 1 },
                                    }"
                                >
                                    <h4 class="text-principal mt-2 mb-2">
                                        Inglés
                                    </h4>
                                </router-link>
                                <p class="text-principal">
                                    When television was young, there was a
                                    hugely popular show based on the still
                                    popular fictional characte
                                </p>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <router-link
                                            :to="{
                                                name: 'portal.curso',
                                                params: { id: 1 },
                                            }"
                                            class="btn btn-warning btn-block btn-flat"
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
                        <div class="single-popular-carusel">
                            <div class="thumb-wrap relative">
                                <div class="thumb relative">
                                    <div class="overlay overlay-bg"></div>
                                    <img
                                        class="img-fluid"
                                        :src="url_principal + '/images/p2.jpg'"
                                        alt=""
                                    />
                                </div>
                                <div
                                    class="meta d-flex justify-content-between"
                                >
                                    <p>
                                        <span class="lnr lnr-users"></span> 355
                                        <!-- <span class="lnr lnr-bubble"></span>35 -->
                                    </p>
                                    <h4>$150</h4>
                                </div>
                            </div>
                            <div class="details">
                                <router-link
                                    :to="{
                                        name: 'portal.curso',
                                        params: { id: 1 },
                                    }"
                                >
                                    <h4 class="text-principal mt-2 mb-2">
                                        Programación
                                    </h4>
                                </router-link>
                                <p class="text-principal">
                                    When television was young, there was a
                                    hugely popular show based on the still
                                    popular fictional characte
                                </p>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <router-link
                                            :to="{
                                                name: 'portal.curso',
                                                params: { id: 1 },
                                            }"
                                            class="btn btn-warning btn-block btn-flat"
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
                        <div class="single-popular-carusel">
                            <div class="thumb-wrap relative">
                                <div class="thumb relative">
                                    <div class="overlay overlay-bg"></div>
                                    <img
                                        class="img-fluid"
                                        :src="url_principal + '/images/p3.jpg'"
                                        alt=""
                                    />
                                </div>
                                <div
                                    class="meta d-flex justify-content-between"
                                >
                                    <p>
                                        <span class="lnr lnr-users"></span> 355
                                        <!-- <span class="lnr lnr-bubble"></span>35 -->
                                    </p>
                                    <h4>$150</h4>
                                </div>
                            </div>
                            <div class="details">
                                <router-link
                                    :to="{
                                        name: 'portal.curso',
                                        params: { id: 1 },
                                    }"
                                >
                                    <h4 class="text-principal mt-2 mb-2">
                                        Fotografía
                                    </h4>
                                </router-link>
                                <p class="text-principal">
                                    When television was young, there was a
                                    hugely popular show based on the still
                                    popular fictional characte
                                </p>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <router-link
                                            :to="{
                                                name: 'portal.curso',
                                                params: { id: 1 },
                                            }"
                                            class="btn btn-warning btn-block btn-flat"
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
                        <div class="single-popular-carusel">
                            <div class="thumb-wrap relative">
                                <div class="thumb relative">
                                    <div class="overlay overlay-bg"></div>
                                    <img
                                        class="img-fluid"
                                        :src="url_principal + '/images/p4.jpg'"
                                        alt=""
                                    />
                                </div>
                                <div
                                    class="meta d-flex justify-content-between"
                                >
                                    <p>
                                        <span class="lnr lnr-users"></span> 355
                                        <!-- <span class="lnr lnr-bubble"></span>35 -->
                                    </p>
                                    <h4>$150</h4>
                                </div>
                            </div>
                            <div class="details">
                                <router-link
                                    :to="{
                                        name: 'portal.curso',
                                        params: { id: 1 },
                                    }"
                                >
                                    <h4 class="text-principal mt-2 mb-2">
                                        Diseño
                                    </h4>
                                </router-link>
                                <p class="text-principal">
                                    When television was young, there was a
                                    hugely popular show based on the still
                                    popular fictional characte
                                </p>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <router-link
                                            :to="{
                                                name: 'portal.curso',
                                                params: { id: 1 },
                                            }"
                                            class="btn btn-warning btn-block btn-flat"
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
                        <div class="single-popular-carusel">
                            <div class="thumb-wrap relative">
                                <div class="thumb relative">
                                    <div class="overlay overlay-bg"></div>
                                    <img
                                        class="img-fluid"
                                        :src="url_principal + '/images/p1.jpg'"
                                        alt=""
                                    />
                                </div>
                                <div
                                    class="meta d-flex justify-content-between"
                                >
                                    <p>
                                        <span class="lnr lnr-users"></span> 355
                                        <!-- <span class="lnr lnr-bubble"></span>35 -->
                                    </p>
                                    <h4>$150</h4>
                                </div>
                            </div>
                            <div class="details">
                                <router-link
                                    :to="{
                                        name: 'portal.curso',
                                        params: { id: 1 },
                                    }"
                                >
                                    <h4 class="text-principal mt-2 mb-2">
                                        Computación
                                    </h4>
                                </router-link>
                                <p class="text-principal">
                                    When television was young, there was a
                                    hugely popular show based on the still
                                    popular fictional characte
                                </p>
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <router-link
                                            :to="{
                                                name: 'portal.curso',
                                                params: { id: 1 },
                                            }"
                                            class="btn btn-warning btn-block btn-flat"
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
                </div>
            </div>
        </section>
        <!-- End popular-course Area -->

        <!-- Start search-course Area -->
        <section class="search-course-area relative bg-secundario2">
            <div class="container">
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-6 col-md-6 search-course-right p-0">
                        <img
                            :src="url_principal + '/imgs/gestoriaImg.jpg'"
                            width="100%"
                        />
                    </div>
                    <div class="col-lg-6 col-md-6 search-course-left">
                        <h1 class="text-white">
                            Gestoría de visas para Estados Unidos sin
                            complicaciones
                        </h1>
                        <p>
                            ¡Prepara tu viaje o cambia tu vida! Encuentra todo
                            lo que necesitas saber sobre las visas de turismo y
                            de trabajo para Estados Unidaos
                        </p>
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
        };
    },
    mounted() {
        this.loadingWindow.close();
        let self = this;
        this.getInfoContacto();
        setTimeout(function () {
            self.initCarousel();
        }, 300);
    },
    methods: {
        getInfoContacto() {
            axios.get(main_url + "/portal/getContacto").then((response) => {
                this.oContacto = response.data.contacto;
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
